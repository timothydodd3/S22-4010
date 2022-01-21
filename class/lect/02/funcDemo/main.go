package main

import "fmt"

func Qs(ss []string) (rv []string) {

	partition := func(arr []string, low, high int) ([]string, int) {
		pivot := arr[high]
		i := low
		for j := low; j < high; j++ {
			if arr[j] < pivot {
				arr[i], arr[j] = arr[j], arr[i]
				i++
			}
		}
		arr[i], arr[high] = arr[high], arr[i]
		return arr, i
	}

	var quickSort func(arr []string, low, high int) []string
	quickSort = func(arr []string, low, high int) []string {
		if low < high {
			var p int
			arr, p = partition(arr, low, high)
			arr = quickSort(arr, low, p-1)
			arr = quickSort(arr, p+1, high)
		}
		return arr
	}

	rv = quickSort(ss, 0, len(ss)-1)
	return
}

func main() {
	r := Qs([]string{"def", "ghi", "abc", "ddd", "zzz"})
	fmt.Printf("%v\n", r)
}
