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

* Go is a **small** language
* Few features
* Go is **easy to read**

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

## Concurrency

Anonymous functions. Just change

```go
func() {
    // ...
}()
```

To

```go
go func() {
    // ...
}()
```

---

## Concurrency: quiz

What is the output of this program?

```go
func main() {
  for i := 0; i < 10; i++ {
  	go func() {
  		fmt.Println(i)
  	}()
  }
}
```

---

## Concurrency: quiz

Output

```

```

---

## Concurrency: quiz

```go
func main() {
  var wg sync.WaitGroup
  for i := 0; i < 10; i++ {
  	wg.Add(1)
  	go func() {
  		defer wg.Done()
  		fmt.Println(i)
  	}()
  }
  wg.Wait()
}
```

---

## Concurrency: quiz

Output

```
10
10
10
10
10
10
10
10
10
7
```

---

## Concurrency: quiz

```go
func main() {
  var wg sync.WaitGroup
  for i := 0; i < 10; i++ {
  	wg.Add(1)
  	go func(i int) {
  		defer wg.Done()
  		fmt.Println(i)
  	}(i)
  }
  wg.Wait()
}
```

---

## Concurrency: quiz

Output

```
1
9
6
7
4
5
2
8
3
0
```

---

## Goroutines

* Think of it as **lightweight threads**
* Go runtime has its own scheduler
* Fewer kernel context switches

---

## Channel

![Channel](/goroutine-broker.png)

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

## Channel

Receiving from channel, until it is closed

```go
for variable := range ch {
  // ...
}
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

## Concurrency: quiz (using channels)

```go
func main() {
	ch := make(chan struct{})
	for i := 0; i < 10; i++ {
		go func(i int) {
			defer func() {
				ch <- struct{}{}
			}()
			fmt.Println(i)
		}(i)
	}

	for i := 0; i < 10; i++ {
		<-ch
	}
}
```

---

## Concurrency: quiz (using channels)

Output

```
0
9
6
7
8
3
2
4
1
5
```

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

---

## Writing Tests

Using testify, replace

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

* Thank you!

Slides at [gitpitch.com/siadat/introtogo](https://gitpitch.com/siadat/introtogo)

---
