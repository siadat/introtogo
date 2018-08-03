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

    func TestDownload(t *test.T) {
        _, err := dm.Download("http://www.google.com")
        if err != nil {
            t.Fatal(err)
        }
    }

(Same code without the import lines)

---

## Writing Tests

    func TestDownload(t *test.T) {
        _, err := dm.Download("url1")
        if err != nil {
            t.Fatal(err)
        }

        _, err := dm.Download("url2")
        if err != nil {
            t.Fatal(err)
        }
    }

---

## Writing Tests

    func TestDownload(t *test.T) {

        testTable := []struct{
            url string
        }{
            {url: "url1"},
            {url: "url2"},
        }

        for _, tc := range testTable {
            _, err := dm.Download(tc.url)
            if err != nil {
                t.Fatal(err)
            }
        }
    }

---

## Writing Tests

    func TestDownload(t *test.T) {

        testTable := []struct{
            url string
        }{
            {url: "url1", err: nil},
            {url: "url2", err: nil},
            {url: "badURL", err: fmt.Errorf("failed")},
        }

        for _, tc := range testTable {
            _, err := dm.Download(tc.url)
            if err != tc.err {
                t.Fatal(err)
            }
        }
    }

---

## Writing Tests

Using testify

    import "github.com/stretchr/testify/require"

Replace

    if err != tc.err {
        t.Fatal(err)
    }

With

    require.NoError(t, err)

---

## Writing Tests summary

* Use **test tables**
* Use **testify** from github.com/stretchr/testify
* Test everything that can go wrong
* Automate tests in your Continuous Integration (CI)

---
