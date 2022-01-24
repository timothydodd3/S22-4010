module github.com/Univ-Wyo-Education/S22-4010/homework/02/merkle

go 1.17

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/02/hash v0.0.1
	github.com/pschlump/MiscLib v0.0.0-20171012162159-e4e6a3a34d5f
	github.com/pschlump/godebug v1.0.1
)

require (
	github.com/mattn/go-colorable v0.1.1 // indirect
	github.com/mattn/go-isatty v0.0.5 // indirect
	github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b // indirect
	github.com/pschlump/json v0.0.0-20180316172947-0d2e6a308e08 // indirect
	golang.org/x/crypto v0.0.0-20220112180741-5e0467b6c7ce // indirect
	golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1 // indirect
)

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/lib => ../lib

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/hash => ../hash

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/block => ../block
