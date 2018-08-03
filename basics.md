## Hello Struct

* Data
* Behavior

---

## Hello Struct

Struct definition

    type Work struct {
        State  string
        Inputs []float64
    }

---

## Hello Struct

Method definition

    func (w Work) Perform() {
        // ...
    }

---

## Hello Struct

Method definition, pointer receiver

    func (w *Work) Perform() {
        w.State = "new-state"
    }

---

## Hello Slice

* An abstraction on top of arrays


    var s []int // a "slice of ints"
    var s [10]int // an "array of ints"

---

## Hello Slice

* Can grow
* Passed by reference

---

## Hello Interface

* Behavior, only

---

fmt.Print says:

* "I need a value that has method `func (T) Write([]byte) (int, error)"
* "I don't care about its concrete types"
* It can be

---

## Hello Interface

    type Work {
        Perform()
    }

---

## Hello Pointer

* No pointer arithmatics
* C-style operators `*` and `&`

---
