package main

import (
    "fmt"
    "os"
    "strconv"
)

func fizzbuzz(c chan string) {
    i := 1

    for {
	s := ""
	if i % 3 == 0 {
	    s += "Fizz"
	}
	if i % 5 == 0 {
	    s += "Buzz"
	}
	if s == "" {
	    c <- strconv.Itoa(i)
	} else {
	    c <- s
	}

	i++
    }
}

func main() {
    var max int = 100
    args := os.Args

    if len(args) > 1 {
	if tmp, err := strconv.Atoi(args[1]); err == nil {
	    max = tmp
	}
    }

    c := make(chan string)
    go fizzbuzz(c)
    for i := 1; i <= max; i++ {
	fmt.Println(<-c)
    }
}
