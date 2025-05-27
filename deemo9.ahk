#Requires AutoHotkey v2.0

; 通过Windows Hook实现GUI吸附在某个窗口上

global targetHwnd := 0 ;目标窗口id
global hook := 0 ;钩子
global guiHwnd := 0 ;Gui窗口id

;创建吸附窗口
myGui := Gui('+AlwaysOnTop -Caption +ToolWindow')
myGui.AddText('', '这是吸附窗口')
myGui.Show('x0 y0 NoActivate')
WinGetPos(&gx, &gy, &gw, &gh, 'ahk_id' myGui.Hwnd)
guiHwnd := myGui.Hwnd

;获取目标窗口(比如 explorer)
targetHwnd := WinExist('ahk_class CabinetWClass ahk_exe explorer.exe')
if (!targetHwnd) {
  OutputDebug('窗口不存在')
  ExitApp
}

;todo 设置事件钩子
hook := DllCall('SetWinEventHook'
  , 'uint', 0x800B
  , 'uint', 0x800B
  , 'ptr', 0
  , 'ptr', CallbackCreate(WinEventProc, 'Fast')
  , 'uint', 0
  , 'uint', 0
  , 'uint', 0x000
)

if (!hook) {
  MsgBox('Hook 注册失败')
  ExitApp
}

OnExit((*) => Unhook())

;回调函数
WinEventProc(hWinEventHook, event, hwnd, idObject, idChild, eventThread, eventTime) {
  if (hwnd != targetHwnd) {
    return
  }
  if (idObject != 0 || idChild != 0) { ;只处理主窗口移动，不处理控件
    return
  }

  ;获取目标窗口位置
  WinGetPos(&x, &y, &w, &h, 'ahk_id' hwnd)

  ;假设GUI吸附在右下角偏移10px
  guiX := x + w + 10
  guiY := y + h - 10
  WinMove(guiX, guiY, , , 'ahk_id' guiHwnd)
}

;清理函数
Unhook() {
  if (hook) {
    DllCall('UnhookWinEvent', 'ptr', hook)
  }
}