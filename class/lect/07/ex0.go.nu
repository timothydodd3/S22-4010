  1: package main
  2: 
  3: import (
  4:     "fmt"
  5:     "sync"
  6: )
  7: 
  8: var wg sync.WaitGroup
  9: 
 10: func f(from string) {
 11:     wg.Add(1)
 12:     defer wg.Done()
 13:     for i := 0; i < 3; i++ {
 14:         fmt.Printf("%s: %v\n", from, i)
 15:     }
 16: }
 17: 
 18: func main() {
 19: 
 20:     f("direct")
 21: 
 22:     go f("goroutine")
 23: 
 24:     for i := 0; i < 10; i++ {
 25:         wg.Add(1)
 26:         go func(msg string) {
 27:             defer wg.Done()
 28:             fmt.Printf("%s\n", msg)
 29:         }(fmt.Sprintf(" I am %d ", i))
 30:     }
 31: 
 32:     wg.Wait()
 33:     fmt.Printf("All Done\n")
 34: }
