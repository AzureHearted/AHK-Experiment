#Requires AutoHotkey v2.0

#Include ../lib/Neutron.ahk
neutron := NeutronWindow().OnEvent('Close', (neutron) => ExitApp)

; neutron.Show("w800 h600", "Template")
neutron.Show("w" 800 "h" 600, "标题")
neutron.Load('https://www.autohotkey.com/boards/viewtopic.php?t=76865')