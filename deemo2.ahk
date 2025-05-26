#Requires AutoHotkey v2.0

K:: {
    SendText('按键K')
}

unlock := false

R:: {
    global unlock
    unlock := !unlock
    Hotkey('K', unlock ? 'on' : 'off')
    msg := "热键K已" . (unlock ? '开启' : '关闭')
    ToolTip(msg)
}
