; 创建一个窗口更随另一个窗口，以跟随文件资源管理器为例

myGui := Gui('+AlwaysOnTop -SysMenu -Caption')
myGui.MarginX := 0
myGui.MarginY := 0

parentId := WinExist('ahk_class CabinetWClass ahk_exe explorer.exe')
; OutputDebug(parentId)
if (!parentId) {
  OutputDebug('窗口不存在')
  ExitApp
}
myGui.Opt('Owner' parentId)

myGui.AddButton(, '你好').OnEvent('Click', close)
close(*) {
  WinClose(myGui)
  ExitApp
}

; OutputDebug(A_ScreenDPI / 96)
getParentPos(&px, &py, &pw, &ph)
clientWidth := Buffer(4)
clientHeight := Buffer(4)
DllCall('GetClientRect', 'ptr', parentId, 'ptr', buf := Buffer(16))
pw := NumGet(buf, 8, 'int')
ph := NumGet(buf, 12, 'int')
myGui.Show('NoActivate' 'x' (pw - 200) ' y' 4)
; myGui.Show('NoActivate x50 y100')
DllCall('SetParent', 'ptr', myGui.Hwnd, 'ptr', parentId)

; SetTimer(handle, 1)

handle(*) {
  if (!WinExist('ahk_id' parentId))
  {
    OutputDebug('窗口被关闭了')
    close()
    return
  }
  getParentPos(&px, &py, &pw, &ph)
  OutputDebug(px ',' py ',' pw ',' ph)
  x := px + pw - 200
  y := py + 5
  myGui.Move(x, y)
}

getParentPos(&px := 0, &py := 0, &pw := 0, &ph := 0) {
  WinGetPos(&px, &py, &pw, &ph, 'ahk_id' parentId)
}