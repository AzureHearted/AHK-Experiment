#Requires AutoHotkey v2.0

NumpadAdd::
{
  static toggle := false

  HotIf 'MouseIsOver("ahk_class Shell_TrayWnd")'
  if (toggle := !toggle) {
    OutputDebug(toggle)
    Hotkey "WheelUp", DoubleUp, "On"
    Hotkey "WheelDown", DoubleDown, "On"
  }
  else {
    OutputDebug(toggle)
    Hotkey "WheelUp", DoubleUp, 'Off'
    Hotkey "WheelDown", DoubleDown, "Off"
  }

  return
  ; 嵌套函数:
  DoubleUp(ThisHotkey) => Send("{Volume_Up 2}")
  DoubleDown(ThisHotkey) => Send("{Volume_Down 2}")
}

MouseIsOver(WinTitle) {
  MouseGetPos , , &Win
  return WinExist(WinTitle " ahk_id " Win)
}

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")
#HotIf