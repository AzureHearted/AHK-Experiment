#Requires AutoHotkey v2.0

/**
 * ! 判断窗口是否置顶
 * @param {Integer} hwnd 窗口id
 */
IsAlwaysOnTop(hwnd := 0) {
  exStyle := WinGetExStyle(hwnd ? ('ahk_id' hwnd) : 'A')   ;获取扩展样式
  return exStyle & 0x8
}