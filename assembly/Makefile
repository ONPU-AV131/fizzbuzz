DEBUG=-g

name:
	echo "GNU Assembler"
exe: fizzbuzz.s
	as -o fizzbuzz.o fizzbuzz.s
	ld -o fizzbuzz fizzbuzz.o

debug: fizzbuzz.s
	as $(DEBUG) -o fizzbuzz.o fizzbuzz.s
	ld -o fizzbuzz fizzbuzz.o
clean:
	rm -rf fizzbuzz.o fizzbuzz
