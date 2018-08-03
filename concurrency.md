## Concurrency

* Few concepts
* Goroutines: easy **paralellism**
* Channels: powerful **coordination**

---

## Goroutines

* Think of it as **lightweight threads**
* Go runtime has its own scheduler, fewer kernel context-switch

---

## Channel

* Based on Tony Hoare's CSP, 1977
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

    ch := make(chan float64)

---

## Channel

Sending to channel

    ch <- 3.14

---

Receiving from channel

    variable := <- ch

---

## Buffered Channel

* Sender: blocked when filled
* Receiver: blocked when empty

---

## Channel

Channels can be closed

* Receivers receive a zero-value
* Senders panic

---

## Example

    func f(url string) (string, error) {
        response, err := http.Get(url)
        if err != nil {
        	return "", err
        }
        body, err := ioutil.ReadAll(response.Body)
        return string(body), err
    }

---

    func main() {
        f()
    }

---

    func main() {
        go f()
        // will exit in 0s
    }

---

    func main() {
        go f()
        go f()
        go f()
    }

---

No goroute handler

---

> Do not communicate by sharing memory; instead, share memory by communicating.

---

    go f()
    go f()
    go f()
    chan
