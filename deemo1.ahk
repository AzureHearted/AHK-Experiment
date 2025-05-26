; AHK v2 窗口测试
#Requires AutoHotkey v2.0.18+
win := Gui('',"deemo1") 
win.AddButton('', '确认').OnEvent('Click', (*) => ExitApp())
win.Show('w500 h200')
win.Show()