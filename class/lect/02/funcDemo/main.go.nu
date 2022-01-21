  1: package main
  2: 
  3: import "fmt"
  4: 
  5: func Qs(ss []string) (rv []string) {
  6: 
  7:     partition := func(arr []string, low, high int) ([]string, int) {
  8:         pivot := arr[high]
  9:         i := low
 10:         for j := low; j < high; j++ {
 11:             if arr[j] < pivot {
 12:                 arr[i], arr[j] = arr[j], arr[i]
 13:                 i++
 14:             }
 15:         }
 16:         arr[i], arr[high] = arr[high], arr[i]
 17:         return arr, i
 18:     }
 19: 
 20:     var quickSort func(arr []string, low, high int) []string
 21:     quickSort = func(arr []string, low, high int) []string {
 22:         if low < high {
 23:             var p int
 24:             arr, p = partition(arr, low, high)
 25:             arr = quickSort(arr, low, p-1)
 26:             arr = quickSort(arr, p+1, high)
 27:         }
 28:         return arr
 29:     }
 30: 
 31:     rv = quickSort(ss, 0, len(ss)-1)
 32:     return
 33: }
 34: 
 35: func main() {
 36:     r := Qs([]string{"def", "ghi", "abc", "ddd", "zzz"})
 37:     fmt.Printf("%v\n", r)
 38: }
