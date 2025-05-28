#Requires AutoHotkey v2.0

Persistent(1)

; DirCreate与OnExit的使用：创建目录并在退出脚本时删除(此方法对意外退出无效)
DirCreate('测试')
OnExit((*) => DirDelete('测试'))