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

Because Go is a **small** language

---

## Why Go

Keyword count in different languages

* 25 Go
* 32 C
* 33 Python
* 50 Java
* 52 Rust
* 89 Swift
* 100 C#
* 109 C++

---

## Why Go

Because Go is **easy to read** (explicit, gofmt)

---

## Why Go

More reasons?

* Good at concurrency
* Statically typed
* Fast builds
* Great performance
* Garbage Collected: Dijkstra's On-the-fly algorithm
* Good tooling: gofmt, golint, etc
* 100% written in Go

---
## Hello world

```go
package main

import "fmt"

func main() {
    fmt.Println("hello world!")
}
```

A complete program at

    $GOPATH/src/hellopkg/hello.go

---

### Build and run

```shell
$ go run hello.go
hello world!
```

---
## Concurrency

* Parallelism
* Concurrency

---

## Concurrency

Goroutines are easy. Just change

```go
DoWork()
```

To

```go
go DoWork()
```

---

## Goroutines

* Think of it as **lightweight threads**
* Go runtime has its own scheduler
* Fewer kernel context switches

---

## Channel

* Think of it as a **broker**
* Buffer size = number of items it can hold
* Based on Tony Hoare's CSP (1977)

---

## Channel

Create a channel

```go
ch := make(chan float64)
```

or

```go
ch := make(chan float64, 0)
```

---

## Channel

```go
ch := make(chan Work)
```

Where

```go
type Work struct {
  State   string
  Inputs []float64
}
```

---

## Channel

```go
ch := make(chan struct{})
```

---

## Channel

Sending to channel

```go
ch <- 3.14
```

---

## Channel

Receiving from channel

```go
variable := <- ch
```

---

## Buffered Channel

```go
ch := make(chan int, 10)
```

---

## Buffered Channel

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

```go
package dm_test

import "testing"
import "github.com/siadat/dm"

func TestDownload(t *testing.T) {
    _, err := dm.Download("http://bing.com")
    if err != nil {
        t.Fatal(err)
    }
}
```

---

## Writing Tests

```shell
$ go test
PASS
ok      github.com/siadat/dm    0.002s
```

---

## Writing Tests

Let's focus on the test

```go
    _, err := dm.Download("http://bing.com")
    if err != nil {
        t.Fatal(err)
    }
```

---

## Writing Tests

```go
    _, err := dm.Download("http://bing.com")
    if err != nil {
        t.Fatal(err)
    }

    _, err := dm.Download("http://google.com")
    if err != nil {
        t.Fatal(err)
    }
```

---

## Writing Tests

```go
    testTable := []struct{
        url string
    }{
        {url: "http://bing.com"},
        {url: "http://google.com"},
    }

    for _, tc := range testTable {
        _, err := dm.Download(tc.url)
        if err != nil {
            t.Fatal(err)
        }
    }
```

---

## Writing Tests

```go
    testTable := []struct{
        url string
        err error
    }{
        {url: "http://bing.com", html: "1", err: nil},
        {url: "http://google.com", html: "2", err: nil},
        {url: "badURL", html: "", err: fmt.Errorf("failed")},
    }

    for _, tc := range testTable {
        html, err := dm.Download(tc.url)
        if err != tc.err {
            t.Fatal(err)
        }
        if tc.html != html {
            t.Fatal("mismatching html")
        }
    }
```

---

## Writing Tests

Using testify

```go
import "github.com/stretchr/testify/require"
```

Replace

```go
    if err != tc.err {
        t.Fatal(err)
    }
```

With

```go
    require.NoError(t, err)
```

---

## Writing Tests

Replace

```go
    if html != tc.html {
        t.Fatal("mismatching html")
    }
```

With

```go
    require.Equal(t, tc.html, html)
```

---

## Writing Tests summary

* Use **test tables**
* Use **testify** from github.com/stretchr/testify
* Test everything that can go wrong
* Automate tests in your Continuous Integration (CI)

---
## Further resources

* **Tour of Go** at https://tour.golang.org
* **The Go Programming Language** book
* **Communicating Sequential Processes** Tony Hoare (1977)
* **JustForFunc** YouTube series

---

## fin

* Thank you

---
