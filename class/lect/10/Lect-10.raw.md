m4_include(../../../setup.m4)

Lecture 10 - Go Concurrency / Start of Smart Contracts
=======================================================================

News
=====

1. European Space Agency Funds Blockchain Project Recording Satellite Data
2. Accounting in space
3. 3.6B in bitcoin ceased because it was be laundered by a married couple.

Reading
======

Consensus Algorithms, PoW, PoS and better ones: [https://medium.com/coinbundle/consensus-algorithms-dfa4f355259d](https://medium.com/coinbundle/consensus-algorithms-dfa4f355259d)





Concurrency in Go
=======================================================================

## Go routines

A Go Routine:

```
	go func( a int ) {
		fmt.Printf ( "a=%d\n", a )
	}( 12 )
```

10 Go Routines:

```
m4_include(go-r.go.nu)
m4_comment([[[
package main

import "fmt"

func main() {
	for i := 0; i < 10; i++ {
		go func(a int) {
			fmt.Printf("a=%d\n", a)
		}(12 + i)
	}
}
]]])
```

With NO output - Why?

```
m4_include(go-r2.go.nu)
m4_comment([[[
package main

import (
	"fmt"
	"sync"
)

func main() {
    var wg sync.WaitGroup
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(a int) {
			defer wg.Done()
			fmt.Printf("a=%d\n", a)
		}(12 + i)
	}
    wg.Wait()
}
]]])
```

And OUTPUT!!!!

```
m4_include(go_r2.out)
m4_comment([[[
$ go run go-r2.go
a=17
a=19
a=12
a=21
a=13
a=16
a=14
a=20
a=15
a=18
]]])
```










m4_comment([[[ ==================================================================================================== ]]])

## locks

```
m4_include(locks.go.nu)
m4_comment([[[

package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	messages := make(chan int)
	var wg sync.WaitGroup

	// you can also add these one at
	// a time if you need to

	wg.Add(3)
	go func() {
		defer wg.Done()
		time.Sleep(time.Second * 3)
		messages <- 1
	}()
	go func() {
		defer wg.Done()
		time.Sleep(time.Second * 2)
		messages <- 2
	}()
	go func() {
		defer wg.Done()
		time.Sleep(time.Second * 1)
		messages <- 3
	}()
	go func() {
		for i := range messages {
			fmt.Println(i)
		}
	}()

	wg.Wait()
	time.Sleep(time.Second * 1)
}
]]])
```

Output:

```
m4_include(locks.out)
m4_ omment([[[
3
2
1
]]])
```

Also "map"'s are not concurrency protected.  You have to lock/unlock them
yourself.

Problems like this are easy to find.  There is a "race detector" built into
go and you can run it as a part of your tests.

You should decide if you need to protect a map.  Why? When?


```
m4_include(atomic.go.nu)
m4_comment([[[
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"sync/atomic"
	"time"
)

func main() {
	state := make(map[int]int)
	mutex := &sync.Mutex{}

	var nRead uint64
	var nWrite uint64

	const randRange = 15

	for ii := 0; ii < 100; ii++ {
		go func() {
			total := 0
			for {
				key := rand.Intn(randRange)
				mutex.Lock()
				total += state[key]
				mutex.Unlock()
				atomic.AddUint64(&nRead, 1)
				time.Sleep(time.Millisecond)
			}
		}()
	}
	for jj := 0; jj < 50; jj++ {
		go func() {
			for {
				key := rand.Intn(randRange)
				val := rand.Intn(100)
				mutex.Lock()
				state[key] = val
				mutex.Unlock()
				atomic.AddUint64(&nWrite, 1)
				time.Sleep(time.Millisecond)
			}
		}()
	}

	time.Sleep(time.Second * 1)

	nReadTotal := atomic.LoadUint64(&nRead)
	nWriteTotal := atomic.LoadUint64(&nWrite)

	mutex.Lock()
	fmt.Printf("ReadOps: %d\nWriteOps: %d\nFinal State: %+v\n", nReadTotal, nWriteTotal, state)
	mutex.Unlock()
}
]]])
```

The Output (run twice - it will produce non-deterministic output!):

```
$ go run atomic.go
ReadOps: 81881
WriteOps: 40936
Final State: map[10:70 3:81 9:81 12:55 5:67 1:38 6:89 14:28 0:40 8:13 4:11 13:19 2:40 11:23 7:30]
$ go run atomic.go
ReadOps: 82500
WriteOps: 41250
Final State: map[2:34 10:2 4:28 5:80 14:42 0:46 3:55 1:65 12:63 9:10 13:50 7:17 6:19 11:91 8:14]
```










m4_comment([[[ ==================================================================================================== ]]])

## channels

```
m4_include(chan.go.nu)
m4_comment([[[
package main

import (
	"fmt"
	"os"
	"sync"
	"time"
)

func main() {
	msg := make(chan string)
	msg2 := make(chan string)
	var wg sync.WaitGroup
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(n int) {
			for {
				time.Sleep(time.Millisecond * 50)
				msg <- fmt.Sprintf("ping:%d", n)
			}
		}(i)
	}
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(n int) {
			for {
				time.Sleep(time.Millisecond * 55)
				msg2 <- fmt.Sprintf("PONG:%d", n)
			}
		}(i)
	}
	nMsg := 0
	for {
		select {
		case out := <-msg:
			nMsg++
			fmt.Printf("%s\n", out)
		case out := <-msg2:
			nMsg++
			fmt.Printf("%s\n", out)
		}
		if nMsg > 100 {
			os.Exit(0)
		}
	}
	wg.Wait()
}
]]])
```



Output (Again - non-deterministic output!):

```
m4_include(chan.out)
m4_comment([[[
$ go run chan.go
ping:1
ping:6
ping:0
ping:5
ping:9
ping:7
ping:8
ping:2
ping:3
ping:4
PONG:3
PONG:5
PONG:4
PONG:8
PONG:7
PONG:1
PONG:2
PONG:9
PONG:6
PONG:0
ping:1
...
]]])
```




















Consensus
============


m4_comment([[[ TODO - xyzzy ]]])











m4_comment([[[

Economics of Wealth
======================

1. How is Wealth Created

	Measurability is In other fields.

2. Where is blockchain in this

	1. Financial Instruments
	2. Productivity in Industry

3. What is "Risk" - and the Risk Myth


## Stocks, ICOs, Bonds, etc...

Terms with explanation:

1. Cash - this is what you buy your pizza with.
2. Stock  - partial ownership in a company.
2. what is a P&L - financial statement of income and expenses that shows if the company is making or loosing money.
2. Long on Cash, Long in a Stock - this means that you have lots of cash, or that you own some of a stock.
1. "Take a position in"... - to purchase stock in.
2. Real Estate - Investing
2. What is Inflation?
2. REIT (Real Estate Investment Trust) - legally required to pay out 80% of profits to investors.
2. What is a Derivative
2. Dividends - Payment of profit to investors as "income" or a reward for owning the stock.
2. What is the "Yield"
2. ICOs (Initial Coin Offering)
2. Cost of "going public"

2. Price to Earnings Radio - a P/E ratio is the cost of share of the company divided by Earnings of that particular share of a company.
2. High speed trading
2. What is a basis point (BPS), Example 50 BSP = 0.5%
2. Stock Buy Back
2. Index Fund
2. Insider Trading
2. Bonds
2. "Industrial Staker Sale"
2. Proof-of-Work, Proof-of-Stake
2. "Consumer Token Sale"
2. Junk Bonds - non investment grade bond.  Bonds are rated for default risk.
2. Mutual Fund
2. Asset Allocation
2. Expense Ratio for a Mutual Fund
2. Prospectus
2. Pro-Forma
2. KYI - Know Your Investor (See SEC 506(d))
2. Certified Investor
2. Going public - Make a public offering.  Cost etc.
2. Money Laundering

]]])

