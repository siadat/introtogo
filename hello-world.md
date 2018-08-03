## Hello World

A complete program at $GOPATH/src/hellopkg/hello.go

    package main

    import "fmt"

    func main() {
        fmt.Println("hello world!")
    }

---

### Build and run

    $ go run hello.go
    hello world!

---

### Create a package

    package dm

    func Download(url string) (string, error) {
        return "", fmt.Errorf("not implemented")
    }

---

### Save to

    $HOME/go/src/projects/dm/dm.go

---

### Using `dm.Download`

A program that uses it

    package main

    import "fmt"
    import "projects/dm"

    func main() {
        dm.Download("http://www.google.com")
    }

---

### Using `dm.Download`

A program that uses it

    package main

    import "fmt"
    import "projects/dm"

    func main() {
        html, err := dm.Download("http://www.google.com")
        if err != nil {
            panic(err)
        }
        fmt.Println(html)
    }

---

## Struct

* Data
* Behavior

---

## Struct

Struct definition

    type Work struct {
        State  string
        Inputs []float64
    }

---

## Struct

Method definition

    func (w Work) Perform() {
        // ...
    }

---

## Struct

Method definition, pointer receiver

    func (w *Work) Perform() {
        w.State = "new-state"
    }

---

## Slices

* An abstraction on top of arrays


    var s []int // a "slice of ints"
    var s [10]int // an "array of ints"

---

## Slices

* Can grow
* Passed by reference

---

## Interface

* Behavior, only

---

fmt.Print says:

* "I need a value that has method `func (T) Write([]byte) (int, error)"
* "I don't care about its concrete types"
* It can be

---

## Interface

    type Work {
        Perform()
    }

---

## Pointers

* No pointer arithmatics
* C-style operators `*` and `&`

---
