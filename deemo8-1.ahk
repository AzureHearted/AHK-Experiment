#Requires AutoHotkey v2.0
#Include <lib_function>
; 创建一个窗口更随另一个窗口，以跟随文件资源管理器为例

/**
 * ! 置顶控制
 */
class ControlAlwaysOnTop {
  ; 图标路径
  picUrl := './res/icon.ico'
  ; 偏移量
  offsetX := -180
  offsetY := 4

  removeFlag := false

  __New(targetId) {
    this.tid := targetId
    this.myGui := Gui('+ToolWindow -Caption ' '+Owner' parentId)
    this.myGui.MarginX := 0
    this.myGui.MarginY := 0

    this.pic := this.myGui.AddPicture('w24 h-1', this.picUrl)
    this.pic.OnEvent('Click', (*) => this.HandleClick())


    WinActive('ahk_id' this.tid)
    this.GetParentPos(&px, &py, &pw, &ph)

    this.myGui.Show('' 'x' (px - pw + this.offsetX) ' y' (py + this.offsetY))
    this.myGui.BackColor := "ffffff"
    WinSetTransColor("ffffff", this.myGui)

    WinSetAlwaysOnTop(true, 'ahk_id' this.tid)

    ; 类中的回调函数使用方法
    this.timerFun := ObjBindMethod(this, 'Hook')
    SetTimer(this.timerFun, 10, 0)
  }

  GetParentPos(&px := 0, &py := 0, &pw := 0, &ph := 0) {
    WinGetPos(&px, &py, &pw, &ph, 'ahk_id' this.tid)
  }

  HandleClick(*) {
    WinSetAlwaysOnTop(false, 'ahk_id' this.tid)
    OutputDebug('取消窗口置顶')
    SetTimer(this.timerFun, 0)
    this.Remove()
    return
  }

  Hook(*) {
    if (!WinExist('ahk_id' this.tid) || this.removeFlag)
    {
      OutputDebug('窗口被关闭了')
      SetTimer(this.timerFun, 0)
      return false
    }
    this.GetParentPos(&px, &py, &pw, &ph)
    x := px + pw + this.offsetX
    y := py + this.offsetY
    this.myGui.Move(x, y)
  }

  Remove() {
    this.pic.OnEvent('Click', (*) => this.HandleClick(), 0)
    this.myGui.Destroy()
    this.removeFlag := true
  }

  __Delete() {
    this.Remove()
  }
}

; * 测试
global parentId := WinExist('ahk_class CabinetWClass ahk_exe explorer.exe')
ControlAlwaysOnTop(parentId)