#Requires AutoHotkey v2.0

#Include ../lib/Neutron.ahk
neutron := NeutronWindow().OnEvent('Close', (neutron) => ExitApp).Load('index.html')
neutron.Show("w800 h600", "Template")