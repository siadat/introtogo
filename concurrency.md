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
