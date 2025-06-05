#Requires AutoHotkey v2.0

#Include <lib_console>

class Person {
  __New(info := { name: 'Pike', age: 18 }) {
    this.name := info.name
    this.age := info.age
  }
}

MouseGetPos(&x, &y)
m := Map(1, "A1", "B1", 2)


Console.Debug(1, false, "testStr", {
  a: "2",
  b: 1,
  c: {}
},
  [1, "a", { age: 18, name: "AzureHeated" }],
  Person({
    name: 'lxs',
    age: 25
  }), &x, m, Person().__New
)