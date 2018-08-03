## Hello package

    package greeting

    func Hello() string {
        return "Hello World!"
    }

---

## Hello package

### Save to

    $HOME/go/src/projects/greeting/greeting.go

---

## Hello package

### Using `greeting.Hello`

A program that uses it

    package main

    import "fmt"
    import "projects/greeting"

    func main() {
        greeting.Hello("http://www.google.com")
    }

---

## Hello package

### Using `greeting.Hello`

A program that uses it

    package main

    import "fmt"
    import "projects/greeting"

    func main() {
        greeting := greeting.Hello()
        fmt.Println(greeting)
    }
