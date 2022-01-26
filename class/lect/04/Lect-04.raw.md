
m4_include(../../../setup.m4)


More On Go / Fiance
====================

1st. the news
-----------------

1. Google is starting a blockchain/cryptocurrency system.
1. Atleast 30 major elections around the world have been run on the Blockchain.  This includes a number of provinces in Spain.

2nd. Purpose of a business
-------------------------

1. To make a profit for the owners of the business.

What is "Fiduciary Responsibility".  It means that you have been placed / are in a
position of legal responsibility for managing somebody else's money.

2. Definitions / Economics

"arbitrage" ::= the simultaneous buying and selling of securities, currency, or commodities in different markets or in derivative forms in order to take advantage of differing prices for the same asset.

3. How Soros broke the Bank of England.

Price Stable Cryptocurrences (or pegged cryptocurrencies)

## Reference

![soros.png](soros.png)

[Soros Broke the Bank of England](https://priceonomics.com/the-trade-of-the-century-when-george-soros-broke/)



Personal Finance
=====

Two Economies in US today.  The "high-tech" and the "traditional" economy.

```
      winner       | per_capita_income_2020 
-------------------+------------------------
 Joseph R Biden Jr |               65531.65
 Donald J Trump    |               47960.04
(2 rows)
```

An income model.

























Blockchain and Mining
====================================================


What is Mining and How is it implemented.
-----

What is proof-of-work?  What is proof-of-stake?  What is a public blockchian / private blockchain?

Diagram of blocks

Diagram of mining

What is the mining process


4. More on Go

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

