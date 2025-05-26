#Requires AutoHotkey v2.0

fn(&n){
  n++
}

num1 := 0

OutputDebug(num1)
fn(&num1)
OutputDebug(num1)