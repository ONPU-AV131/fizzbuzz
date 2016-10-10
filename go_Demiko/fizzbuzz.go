package main

import "fmt"
import "os"
import "strconv"

func main() {
	n:=20
	if len(os.Args)>1{
		n,_=strconv.Atoi(os.Args[1])
	}
	for i:=1;i<=n;i++ {
		if i%3==0 {
			fmt.Print("Fizz")
		}
		if i%5==0 {
			fmt.Print("Buzz")
		}
		if (i%3>0 && i%5>0) {
			fmt.Print(i)
		}
		fmt.Println()
	}
}
