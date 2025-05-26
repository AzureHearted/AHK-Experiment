#Requires AutoHotkey v2.0

/**
 * 显示消息
 * @param msg 消息内容
 * @param duration 持续时间
 */
showMsg(msg, duration := 1000) {
    ToolTip(msg)
    SetTimer(() => ToolTip(), duration)
}

#HotIf GetKeyState('CapsLock', 'P')

I:: {
    showMsg('^I')
}

#HotIf