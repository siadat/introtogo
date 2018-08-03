## An Introduction to the Go Programming Language

Sina Siadat

* Engineer at Cafe Bazaar
* Github: @siadat
* Twitter: @sinasiadat

---

## Table of Contents

* [Why Go](/why-go.md)
* [Hello World!](/hello-world.md)
* [Concurrency](/concurrency.md)
* [Writing tests](/writing-tests.md)
* [The End](/99-fin.md)

---
## Why Go

Because Go is a **small** language!

---

## Why Go

Keywords in different languages

* 25 Go
* 26 Erlang
* 32 C
* 33 Python
* 36 Ruby
* 50 Java
* 52 Rust
* 89 Swift
* 100 C#
* 109 C++

---

## Why Go

* Because Go is a **small** language
* Which makes it **easy to read**
* And **human mistakes happen less often**

---

## Why Go

Other reasons

* Good at concurrency
* Statically typed
* Fast builds
* Great performance
* Garbage Collected: Dijkstra's On-the-fly algorithm, sub-millisecond stop-the-world
* Great tooling: gofmt, golint, go test, guru, goimports, easy AST, etc
* 100% written in Go

---
## Hello world

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
## Concurrency

* Parallelism
* Concurrency

---

## Concurrency

Goroutines are easy.

Change

    DoWork()

To

    go DoWork()

---

## Goroutines

* Think of it as **lightweight threads**
* Go runtime has its own scheduler, fewer kernel context-switch

---

## Channel

* Based on Tony Hoare's CSP (1977)
* Think of it as a **broker**
* Buffer size is the number of items it can hold

---

## Channel

* Goroutine-safe
* Connects senders and receivers
* Has a buffer size

---

## Channel

Create a channel

    ch := make(chan float64)

or

    ch := make(chan float64, 0)

---

## Channel

    ch := make(chan Work)

Where

    type Work struct {
      Name   string
      Inputs []float64
    }

or

    ch := make(chan struct{})

---

## Channel

Sending to channel

    ch <- 3.14

---

Receiving from channel

    variable := <- ch

---

## Channel

* Sender: blocked when no receiver
* Receiver: blocked when no sender

---

## Buffered Channel

    ch := make(chan int, 10)

* Sender: blocked when filled
* Receiver: blocked when empty

---

## Channel

Channels can be closed

* Receivers receive a zero-value
* Senders panic
* Closers panic

---
## Writing Tests

    package dm_test

    import "github.com/siadat/dm"

    func TestDownload(t *test.T) {
        _, err := dm.Download("url")
        if err != nil {
            t.Fatal(err)
        }
    }

---

## Writing Tests

    package dm_test

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("url")
        require.NoError(t, err)
    }

---

## Writing Tests

    package dm_test

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("url")
        require.NoError(t, err, "Download failed")
    }

---

## Writing Tests

    package dm_test

    import "fmt"

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("url")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "url"))
    }

---

## Writing Tests

    package dm_test

    import "fmt"

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("url1")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "url1"))

        _, err = dm.Download("url2")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "url2"))
    }

---

## Writing Tests

    package dm_test

    import "fmt"

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("url1")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "url1"))

        _, err = dm.Download("url2")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "url2"))

        _, err = dm.Download("url3")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "url3"))
    }

---

## Writing Tests

    package dm_test

    import "fmt"

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {

        testTable := []struct{
            url string
        }{
            {url: "url1"},
            {url: "url2"},
            {url: "url3"},
        }

        for _, tc := range testTable {
            _, err := dm.Download(tc.url)
            require.NoError(t, err, fmt.Sprintf("Downloading %s failed", tc.url))
        }
    }

---

## Writing Tests summary

* Test everything that can go wrong
* Automate tests in your Continuous Integration (CI)
* Use **test tables**
* Use **testify** from github.com/stretchr/testify

---
## Further resources

* #Must **Tour of Go** at https://tour.golang.org
* #Book **The Go Programming Language** book by D&K
* #Video **JustForFunc** YouTube series

---

## fin

* Thank you

---
