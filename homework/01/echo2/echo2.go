package main

// Your Name - it is important if you want to get credit for your assignment.
// Assignment 1.4 echo command line arguments and parse arguments.

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"os"
)

type ConfigData struct {
	Name  string
	Value string
}

func main() {
	var Cfg = flag.String("cfg", "cfg.json",
		"config file for this call")

	// Parse CLI arguments to this, --cfg <name>.json
	flag.Parse()

	fns := flag.Args()
	//  ^---------------- Note the := declares fns

	if Cfg == nil {
		fmt.Printf("--cfg is a required parameter\n")
		os.Exit(1)
	}

	gCfg, err := ReadConfig(*Cfg)
	// ^ nd ^ ------------------ Multiple return values
	if err != nil {
		fmt.Fprintf(os.Stderr,
			"Unable to read confguration: %s error %s\n",
			*Cfg, err)
		os.Exit(1)
	}

	fmt.Printf("Congiguration: %+v\n", gCfg)
	//                         ^------------------->
	//               Format in print shows field names
	fmt.Printf("JSON: %+v\n", IndentJSON(gCfg))

	for ii, ag := range fns {
		//     ^------ Declare in scope of 'for'
		//        ^------ Loop over the 'fns' slice
		if ii < len(fns) {
			fmt.Printf("%s ", ag)
		} else {
			fmt.Printf("%s", ag)
		}
	}
	fmt.Printf("\n")
}

func ReadConfig(filename string) (rv ConfigData, err error) {
	var buf []byte
	buf, err = ioutil.ReadFile(filename)
	if err != nil {
		fmt.Printf("Error: %s\n", err)
		return
	}
	err = json.Unmarshal(buf, &rv)
	if err != nil {
		fmt.Printf("Error: %s\n", err)
		return
	}
	return
}

func IndentJSON(v interface{}) string {
	s, err := json.MarshalIndent(v, "", "\t")
	if err != nil {
		return fmt.Sprintf("Error:%s", err)
	} else {
		return string(s)
	}
}
