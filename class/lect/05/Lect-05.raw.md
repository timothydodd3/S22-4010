
m4_include(../../../setup.m4)


More On Go 
====================

Maps do not synchronize automatically.
So... Synchronization Primitives:

```Go
m4_include(safe_counter.go.nu)
m4_comment([[[
package main

import (
	"fmt"
	"sync"
	"time"
)

// SafeCounter is safe to use concurrently.
type SafeCounter struct {
	v   map[string]int
	mux sync.Mutex
}

// Inc increments the counter for the given key.
func (c *SafeCounter) Inc(key string) {
	c.mux.Lock()
	// Lock so only one goroutine at a time can access the map c.v.
	c.v[key]++
	c.mux.Unlock()
}

// Value returns the current value of the counter for the given key.
func (c *SafeCounter) Value(key string) int {
	c.mux.Lock()
	// Lock so only one goroutine at a time can access the map c.v.
	defer c.mux.Unlock()
	return c.v[key]
}

func main() {
	c := SafeCounter{v: make(map[string]int)}
	for i := 0; i < 1000; i++ {
		go c.Inc("somekey")
	}

	time.Sleep(time.Second)
	fmt.Println(c.Value("somekey"))
}
]]])
```

### A Go Core/Panic 

First the Code

```Go
m4_include(go_panic.go.nu)
m4_comment([[[
package main

import "fmt"

var mm map[string]int

func main() {
	fmt.Println("vim-go")
	mm["bob"] = 3
}
]]])
```

Then the bad output.


```
m4_include(go_panic.out)
m4_comment([[[
vim-go
panic: assignment to entry in nil map

goroutine 1 [running]:
main.main()
	/Users/philip/go/src/github.com/Univ-Wyo-Education/S22-4010/class/lect/04/go_panic.go:9 +0x71
exit status 2
]]])
```

