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

From terminal

    $ go run hello.go

Output

    hello world

---

Alternative 1:

    $ go build hello.go
    $ ./hello

Alternative 2:

    $ go install github.com/siadat/hellopkg
    $ $GOPATH/bin/hellopkg

Alternative 3:

    $ go install
    $ $GOPATH/bin/hellopkg

Alternative 4:

    $ go install .
    $ $GOPATH/bin/hellopkg

Alternative 5:

    $ go install ./...
    $ $GOPATH/bin/hellopkg

Alternative 6:

    $ go install github.com/siadat/hellopkg/...
    $ $GOPATH/bin/hellopkg

Alternative 7:

Downloading and installing from the Internet

    $ go get github.com/siadat/hellopkg
    $ $GOPATH/bin/hellopkg

---

A library package at $GOPATH/src/github.com/siadat/dm/dm.go

    [3] package dm
    [3]
    [1] func Download(url string) (string, error) {
    [2]     return "", fmt.Errorf("not implemented")
    [1] }

A program that uses it

    [7] package main
    [7]
    [6] import "fmt"
    [2] import "github.com/siadat/dm"
    [6]
    [3] func main() {
    [1]     s, err := dm.Download("http://www.google.com")
    [4]     if err != nil {
    [4]         panic(err)
    [4]     }
    [5]     fmt.Println(s)
    [3] }

---

## Struct

* Data
* Behavior

---

## Struct

Struct definition

    type Work struct {
        Name string
        Inputs []float64
    }

---

## Struct

Method definition

    func (w Work) Perform() {
        // ...
    }

---

## Interface

* Behavior, only

---

## Interface

    type Work {
        Perform()
    }
