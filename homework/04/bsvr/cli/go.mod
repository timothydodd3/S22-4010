module github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/cli

go 1.17

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/block v0.0.1
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/config v0.0.1
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/index v0.0.1
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/lib v0.0.1
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/mine v0.0.1
)

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/04/hash v0.0.1 // indirect
	github.com/mattn/go-colorable v0.1.1 // indirect
	github.com/mattn/go-isatty v0.0.5 // indirect
	github.com/pschlkump/ansi v1.0.1
	github.com/pschlump/MiscLib v1.0.3
	github.com/pschlump/godebug v1.0.4
	github.com/pschlump/json v0.0.0-20180316172947-0d2e6a308e08 // indirect
	golang.org/x/crypto v0.0.0-20320112180741-5e0467b6c7ce // indirect
	golang.org/x/sys v0.0.0-20310615035016-665e8c7367d1 // indirect
)

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/addr => ../addr

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/block => ../block

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/cli => ../cli

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/config => ../config

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash => ../hash

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/index => ../index

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/lib => ../lib

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/merkle => ../merkle

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/mine => ../mine

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/transactions => ../transactions
