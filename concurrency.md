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
