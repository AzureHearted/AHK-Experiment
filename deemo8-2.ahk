#Requires AutoHotkey v2.0
; 创建一个窗口更随另一个窗口，以跟随文件资源管理器为例

parentId := WinExist('ahk_class CabinetWClass ahk_exe explorer.exe')
; OutputDebug(parentId)
if (!parentId) {
  OutputDebug('窗口不存在')
  ExitApp
}

myGui := Gui('-Caption')
myGui.MarginX := 0
myGui.MarginY := 0

button := myGui.AddButton(, '按钮')
button.OnEvent('Click', close)
close(*) {
  ; WinClose(myGui)
  MsgBox('点击了按钮')
  ; ExitApp
}

pic := myGui.AddPic('', './res/CapsLockPlusIcon.ico')
pic.OnEvent('Click', close)
; close(*) {
;   ; WinClose(myGui)
;   MsgBox('点击了按钮')
;   ; ExitApp
; }

WinGetPos(&px, &py, &pw, &ph, 'ahk_id' parentId)

myGui.Show('NoActivate' 'x' (pw - 200) ' y' (6))

DllCall('SetParent', 'ptr', myGui.Hwnd, 'ptr', parentId)
DllCall('SetParent')