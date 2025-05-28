#Requires AutoHotkey v2.0
#Include <archive>

; 压缩包解压
arc := archive.reader('./测试压缩包2.zip')
arc.extract_all()
