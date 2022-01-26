

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
Per-Capita Income broken down by counties won in 2020.

```
      winner       | per_capita_income_2020 
-------------------+------------------------
 Joseph R Biden Jr |               65531.65
 Donald J Trump    |               47960.04
```


GDP Growth broken down by counties won in 2020.

```
      winner       | pct_of_growth 
-------------------+---------------
 Donald J Trump    |         9.05%
 Joseph R Biden Jr |        90.95%
```





























Blockchain and Mining
====================================================


What is Mining and How is it implemented.
-----

What is proof-of-work?  What is proof-of-stake?  What is a public blockchian / private blockchain?

Diagram of blocks

Diagram of mining

What is the mining process

<div class="pagebreak"></div>

```
  1: package mine
  2: 
  3: import "github.com/Univ-Wyo-Education/S20-4010/Assignments/02/block"
  4: 
  5: /*
  6:  import (
  7:      "encoding/hex"
  8:      "fmt"
  9:      "strings"
 10: 
 11:      block "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
 12:      "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
 13:  )
 14: */
 15: 
 16: // MineBlock implements a proof of work mining system where the first 4 digits (2 bytes) of the hex value are
 17: // 0000.  Difficulty can be increaesed by requiring more digits to be 0 or by requring some other pattern to
 18: // apear in the resulting hash.
 19: func InstructorImplementationMineBlock(bk *block.BlockType, difficulty string) {
 20:     // Pseudo-Code
 21:     //
 22:     // 1. Use an infinite loop to:
 23:     //    1. Searilize the data from the block for hasing, Call block.SerializeForSeal to do this.
 24:     //    2. Calculate the hash of the data, Call hash.HashOf to do this. This is the slow part.  What would
 25:     //      happen if we replaced the software with a hash calculator on a graphics card where you could run
 26:     //      4096 hahes at once?  What would happen if we replaced the graphics card with an ASIC - so you had
 27:     //      dedicated hardware to do the hash and you could run 4 billion hashes a second?
 28:     //    3. Convert the hash (it is []byte) to a hex string.  Use the hex.EncodeToString standard go library
 29:     //      function.
 30:     //    4. `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\r", theHashAsAString, bk.Nonce)`
 31:     //        `\r` will overwrite the same line instead of advancing to the next.
 32:     //    5. See if the first 4 characters of the hash are 0's. - if so we have met the work criteria.
 33:     //        In go this is `if theHashAsAString[0:4] == "0000" {`.  This is create a slice, 4 long from
 34:     //        character 0 with length of 4, then compare that to the string `"0000"`.
 35:     //        - Set the blcoks "Seal" to the hash
 36:     //        - `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\n", theHashAsAString, bk.Nonce)`
 37:     //          `\n` will overwrite the same *and then advance* to the next line.
 38:     //        - return
 39:     //    5. Increment the Nonce in the block, and...
 40:     //    6. Back to the top of the loop for another try at finding a seal for this block.
 41:     //
 42:     // For the genesis block, when I do this it requires 54586 trips through the loop to calculate the
 43:     // proof of work.
 44:     //
 45:     for {
 46:         // YOur Code at this point ---------------------------------------------------------------------------
 47:         // seralize the block
 48:         // hash the block
 49:         // convert hash to string. (use hex library package)
 50:         // If the first X characters of the string - match with our passed difficulty (use strings.HasPrefix?)
 51:         //         Set "Seal" field to the hash
 52:         //         Return
 53:         // Increment block Nonce
 54:     }
 55: }

```

<div class="pagebreak"></div>

4. More on Go

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

