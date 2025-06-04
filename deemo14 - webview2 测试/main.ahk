#Requires AutoHotkey v2.0

#Include <WebView2\WebView2>

main := Gui("-Caption")
main.BackColor := '242424'
main.OnEvent('Close', (*) => (wvc := wv := 0))

main.Show('w' 1200 ' h' 400)
; main.Hide()

; 创建 WebView2 控件
; wvc := WebView2.CreateControllerAsync(main.Hwnd).await2()
wvc := WebView2.create(main.Hwnd)

; 使窗口获得焦点
wvc.MoveFocus(0)
; 禁止外部文件退拽到WebView窗口
wvc.AllowExternalDrop := false

wv := wvc.CoreWebView2
wv.Navigate('http://localhost:5173/')

wv.AddHostObjectToScript('ahk', { debug: (res) => OutputDebug(res) })

; main.Show('w' 1200 ' h' 400)


; OutputDebug wvc.add_AcceleratorKeyPressed(eventHandler)
