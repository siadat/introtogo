## Writing Tests

    package dm_test

    import "github.com/siadat/dm"

    func TestDownload(t *test.T) {
        _, err := dm.Download("http://www.google.com")
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
        _, err := dm.Download("http://www.google.com")
        require.NoError(t, err)
    }

---

## Writing Tests

    package dm_test

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("http://www.google.com")
        require.NoError(t, err, "Download failed")
    }

---

## Writing Tests

    package dm_test

    import "fmt"

    import "github.com/siadat/dm"
    import "github.com/stretchr/testify/require"

    func TestDownload(t *test.T) {
        _, err := dm.Download("http://www.google.com")
        require.NoError(t, err, fmt.Sprintf("Downloading %s failed", "http://www.google.com"))
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
