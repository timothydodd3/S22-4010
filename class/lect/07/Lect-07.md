
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



Last Part on Go
======================

Goroutines
------------------------------

Go routes allow you to create parallel running code.


```
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

```





Go Interfaces
------------------------------

Two uses for interfaces (Actually more than 2 but 2 primary uses).

1. Variable parameter list functions.
2. Interfaces to sets of functions.

## Variable parameter list functions.

```Go
func vexample(a int, b ...interface{}) {
	for pos, bVal := range b {
		switch v := bVal.(type) {
		case int:
			fmt.Printf("It's an int, %d at %d\n", v, pos)
		case []int:
			fmt.Printf("It's a slice of int\n")
		default:
			fmt.Printf("It's a something else\n")
		}
	}
}

```

## Interfaces to sets of functions.

```Go
type InterfaceSpecType interface {
	DoFirstThing(p1 int, p2 int) error
	DoSomethingElse() error
}

type ImplementationType struct {
	AA int
	BB int
}

var _ InterfaceSpecType = (*ImplementationType)(nil)

func NewImplementationType() InterfaceSpecType {
	return &ImplementationType{
		AA: 1,
		BB: 2,
	}
}

func (xy *ImplementationType) DoFirstThing(p1 int, p2 int) error {
	// ... do something ...
	return nil
}

func (xy *ImplementationType) DoSomethingElse() error {
	// ... do something ...
	return nil
}

func Demo() {
	var dd InterfaceSpecType
	dd = NewImplementationType()
	_ = dd.DoSomethingElse()
}
```

Go Channels
------------------------------

We will come back to this later.


Go Weaknesses
------------------------------

What are the limitations of using Go

1. No objects - Use interfaces instead.  No inheritance.
2. Executables are big



