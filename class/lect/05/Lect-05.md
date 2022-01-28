

<style>
.pagebreak { page-break-before: always; }
.half { height: 200px; }
</style>
<style>
.pagebreak { page-break-before: always; }
.half { height: 200px; }
.markdown-body {
	font-size: 12px;
}
.markdown-body td {
	font-size: 12px;
}
</style>


# Lecture 05 - News, Stocks, Go






## News

1. Crypto Crash....

New York Times, Today, Fri Jan 28 06:18:24 MST 2022 <br>
[https://www.nytimes.com/2022/01/27/opinion/cryptocurrency-subprime-vulnerable.html](https://www.nytimes.com/2022/01/27/opinion/cryptocurrency-subprime-vulnerable.html)

"Recent developments in El Salvador, which adopted Bitcoin as legal
tender a few months ago, seem to bolster the skeptics: Residents
attempting to use the currency find themselves facing huge transaction
fees. Still, crypto has been effectively marketed: It manages both
to seem futuristic and to appeal to old-style goldbug fears that
the government will inflate away your savings, and huge past gains
have drawn in investors worried about missing out. So crypto has
become a large asset class even though nobody can clearly explain
what legitimate purpose it’s for."

2. Turkey - attempting to support the Lyra - ForEx down to 7.55B, 
with $10-11b a month in foreign gas purchases.  An inflation forcast
from the CBT (Central Bank of Turkey) of 22.3% - and - desperate 
measures.  If a country can't support its own currency how do you
expect Teather to support it's?

3. Facebooks, Deim project offically shuts down.
[https://www.washingtonpost.com/technology/2022/01/28/facebook-cryptocurrency-diem/](https://www.washingtonpost.com/technology/2022/01/28/facebook-cryptocurrency-diem/)

"...so that it would be pegged to the U.S. dollar to create more stability..."

"...16 percent of Americans have invested in or traded cyptocurrencies..."

From: [https://www.forbes.com/sites/teresaghilarducci/2020/08/31/most-americans-dont-have-a-real-stake-in-the-stock-market/?sh=5783d5331154](https://www.forbes.com/sites/teresaghilarducci/2020/08/31/most-americans-dont-have-a-real-stake-in-the-stock-market/?sh=5783d5331154)

"...via the Federal Reserve from 2016, shows a relatively small
share of American families (14%) are directly invested in individual
stocks but a majority (52%) have some market investment mostly from
owning retirement accounts such as 401(k)s."



## An example of Arbitrage

Stocks v.s. Realest - over - Democrat v.s. Republican.

![growth-d-vs-r.png](growth-d-vs-r.png)






More On Go 
====================

Maps do not synchronize automatically.
So... Synchronization Primitives:

```Go
  1: package main
  2: 
  3: import (
  4:     "fmt"
  5:     "sync"
  6:     "time"
  7: )
  8: 
  9: // SafeCounter is safe to use concurrently.
 10: type SafeCounter struct {
 11:     v   map[string]int
 12:     mux sync.Mutex
 13: }
 14: 
 15: // Inc increments the counter for the given key.
 16: func (c *SafeCounter) Inc(key string) {
 17:     c.mux.Lock()
 18:     // Lock so only one goroutine at a time can access the map c.v.
 19:     c.v[key]++
 20:     c.mux.Unlock()
 21: }
 22: 
 23: // Value returns the current value of the counter for the given key.
 24: func (c *SafeCounter) Value(key string) int {
 25:     c.mux.Lock()
 26:     // Lock so only one goroutine at a time can access the map c.v.
 27:     defer c.mux.Unlock()
 28:     return c.v[key]
 29: }
 30: 
 31: func main() {
 32:     c := SafeCounter{v: make(map[string]int)}
 33:     for i := 0; i < 1000; i++ {
 34:         go c.Inc("somekey")
 35:     }
 36: 
 37:     time.Sleep(time.Second)
 38:     fmt.Println(c.Value("somekey"))
 39: }


```

### A Go Core/Panic 

First the Code

```Go
  1: package main
  2: 
  3: import "fmt"
  4: 
  5: var mm map[string]int
  6: 
  7: func main() {
  8:     fmt.Println("vim-go")
  9:     mm["bob"] = 3
 10: }


```

Then the bad output.


```
vim-go
panic: assignment to entry in nil map

goroutine 1 [running]:
main.main()
	/Users/philip/go/src/github.com/Univ-Wyo-Education/S22-4010/class/lect/04/go_panic.go:9 +0x71
exit status 2


```



## Stock Stuff








What is a Stock?

What is a Dividend?

SEC Reg(D)?

SEC Enforcement of Securities Laws.

Wyoming Laws on Stocks.

What is a NFT - and is it a security?

What is a Bond?  What is a Fixed Coupon v.s. a Variable Capon?

What is Yield?

How are dividends payed?

Other Investments (Gold, Diamonds, Houses, Apartments)

