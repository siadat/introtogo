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
