## Hello World

A complete program at $GOPATH/src/github.com/siadat/hellopkg/hello.go

    [1] package main
    [4]
    [4] import "fmt"
    [4]
    [2] func main() {
    [3]     fmt.Println("hello world")
    [2] }

---

Build and run

    $ go run hello.go
    hello world

---

(explain the package creation and dm return values)

    [3] package dm
    [3]
    [1] func Download(url string) (string, error) {
    [2]     return "", fmt.Errorf("not implemented")
    [1] }

---

Package `dm` is located at

    $HOME/go/src/github.com/siadat/dm/dm.go

---

A program that uses it

    package main

    import "fmt"
    import "github.com/siadat/dm"

    func main() {
        dm.Download("http://www.google.com")
    }

---

A program that uses it

    package main

    import "fmt"
    import "github.com/siadat/dm"

    func main() {
        html, err := dm.Download("http://www.google.com")
        if err != nil {
            panic(err)
        }
        fmt.Println(html)
    }

---

## Pointers

* No pointer arithmatics
* C-style operators `*` and `&`

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
