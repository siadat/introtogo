## Tools: gofmt

From

```go
type Struct struct{
Short int
Looooooooong int
}
```

To

```go
type Struct struct {
	Short        int
	Looooooooong int
}
```

---

## Tools: goimports

From

```go
require.NoError(t, err)
```

To

```go
import "github.com/stretchr/testify/require"

// ...

require.NoError(t, err)
```
