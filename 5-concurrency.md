## Concurrency

* Goroutines: paralellism
* Channels: coordination

---

## Goroutines

* Go runtime has its own scheduler, fewer kernel context-switch
* Lightweight, initial stack of 8kb
* Grows as required

---

    f := func() {
        time.Sleep(time.Second)
    }
    f()

---

    f := func() {
        time.Sleep(time.Second)
    }()

    go f()

---

    go f()
    go f()
    go f()

---

No goroute handler

---

> Do not communicate by sharing memory; instead, share memory by communicating.

---

    go f()
    go f()
    go f()
    chan
