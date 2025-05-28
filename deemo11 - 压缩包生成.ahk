#Requires AutoHotkey v2.0
#Include <archive>

; 压缩包生成
arc := archive.writer('测试压缩包1.zip', , ,)
arc.add('./res')
arc.close()