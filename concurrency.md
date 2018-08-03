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
