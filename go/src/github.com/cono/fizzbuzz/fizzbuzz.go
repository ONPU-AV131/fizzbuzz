package main

import (
    "fmt"
    "os"
    "strconv"
)

func main() {
    var max int = 100
    var s string
    args := os.Args

    if len(args) > 1 {
	if tmp, err := strconv.Atoi(args[1]); err == nil {
	    max = tmp
	}
    }

    for i := 1; i <= max; i++ {
	s = ""

	if i % 3 == 0 {
	    s += "Fizz"
	}
	if i % 5 == 0 {
	    s += "Buzz"
	}
	if s == "" {
	    fmt.Printf("%d\n", i)
	} else {
	    fmt.Printf("%s\n", s)
	}
    }
}
