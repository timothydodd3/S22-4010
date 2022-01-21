  1: package main
  2: 
  3: import "fmt"
  4: 
  5: var aSlice = []string{"abc", "def", "ghi"}
  6: var aMap = map[string]int{
  7:     "alice": 22,
  8:     "bob":   23,
  9:     "tom":   25,
 10: }
 11: 
 12: func main() {
 13:     for i := 0; i < 5; i++ {
 14:         fmt.Printf("Loop 1: %d\n", i)
 15:     }
 16:     fmt.Printf("\n")
 17: 
 18:     for i, v := range aSlice {
 19:         fmt.Printf("Loop 2: at:%d ->%s<-\n", i, v)
 20:     }
 21:     fmt.Printf("\n")
 22: 
 23:     for key, val := range aMap {
 24:         fmt.Printf("Loop 3: key:%s ->%v<-\n", key, val)
 25:     }
 26: }
