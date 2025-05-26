#Requires AutoHotkey v2.0

g := Gui('+Resize')
g.Add('Button', , '1')
g.Add('Button', , '2')
g.Add('Button', , '3')
btn4 := g.Add('Button', , '4')

event(GuiObj, MinMax, gw, gh) {
    global btn4
    x := ''
    y := ''
    w := ''
    h := ''
    btn4.GetPos(&x, &y, &w, &h)
    ToolTip('修改前 - ' . 'x:' . x . ',' . 'y:' . y)
    SetTimer(() => ToolTip(), 3000)
    btn4.Move(gw - w, gh - h)
    btn4.GetPos(&x, &y, &w, &h)
    ToolTip('修改后 - ' . 'x:' . x . ',' . 'y:' . y)
    SetTimer(() => ToolTip(), 3000)
}

g.OnEvent('Size', event)

g.Show('w370 h545')

; GuiControl('Move', '生成代码', Format("x{1} y{2}", A_GuiWidth - 74, A_GuiHeight - 30)
