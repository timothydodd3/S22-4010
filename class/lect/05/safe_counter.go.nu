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
