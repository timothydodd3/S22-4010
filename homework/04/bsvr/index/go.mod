module github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/index

go 1.17

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/block v0.0.2
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/lib v0.0.2
)

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash v0.0.1 // indirect
	github.com/mattn/go-colorable v0.1.1 // indirect
	github.com/mattn/go-isatty v0.0.5 // indirect
	github.com/pschlump/MiscLib v1.0.3
	github.com/pschlump/godebug v1.0.4
	github.com/pschlump/json v0.0.0-20180316172947-0d2e6a308e08 // indirect
	golang.org/x/sys v0.0.0-20220209214540-3681064d5158
)

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/block => ../block

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/cli => ../cli

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/config => ../config

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash => ../hash

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/index => ../index

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/lib => ../lib

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/merkle => ../merkle

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/mine => ../mine

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/transactions => ../transactions

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/ansi => ../ansi
