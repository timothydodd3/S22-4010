  1: package main
  2: 
  3: type InterfaceSpecType interface {
  4:     DoFirstThing(p1 int, p2 int) error
  5:     DoSomethingElse() error
  6: }
  7: 
  8: type InterfaceOtherType interface {
  9:     DoSomethingElse() error
 10:     DoSomethingSpecial(in int) error
 11: }
 12: 
 13: type ImplementationType struct {
 14:     AA int
 15:     BB int
 16: }
 17: 
 18: // Verify at compile time that the implementation type
 19: // is a valid implementation of the interface.
 20: var _ InterfaceSpecType = (*ImplementationType)(nil)
 21: 
 22: // Validate 2nd interface spec.
 23: var _ InterfaceOtherType = (*ImplementationType)(nil)
 24: 
 25: func NewImplementationType() InterfaceSpecType {
 26:     return &ImplementationType{
 27:         AA: 1,
 28:         BB: 2,
 29:     }
 30: }
 31: 
 32: func (xy *ImplementationType) DoFirstThing(p1 int, p2 int) error {
 33:     // ... do something ...
 34:     return nil
 35: }
 36: 
 37: func (xy *ImplementationType) DoSomethingElse() error {
 38:     // ... do something ...
 39:     return nil
 40: }
 41: 
 42: func (xy *ImplementationType) DoSomethingSpecial(in int) error {
 43:     // ... do something ...
 44:     return nil
 45: }
 46: 
 47: func Demo() {
 48:     var dd InterfaceSpecType
 49:     dd = NewImplementationType()
 50:     _ = dd.DoSomethingElse()
 51: }
 52: 
 53: func main() {
 54:     Demo()
 55: }
