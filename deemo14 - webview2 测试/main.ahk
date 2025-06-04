#Requires AutoHotkey v2.0

#Include <WebView2\WebView2>

main := Gui('Resize')
main.OnEvent('Close', (*) => (wvc := wv := 0))
main.Show('w' 1200 ' h' 400)

wvc := WebView2.CreateControllerAsync(main.Hwnd).await2()
wv := wvc.CoreWebView2
wv.Navigate('http://localhost:5173/')
wv.AddHostObjectToScript('ahk', { debug: (res) => OutputDebug(res) })

; wv.OpenDevToolsWindow()
