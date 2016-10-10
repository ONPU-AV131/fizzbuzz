:-initialization(main).

main:-
	current_prolog_flag(argv,A),
	last(A,N),
	number_atom(N1,N),
	fizzbuzz(N1),
	halt.
main:-
	fizzbuzz(30),
	halt.

fizzbuzz1(N,M):-N>M.
fizzbuzz1(N,_):-
	mod(N,3)=:=0,
	write('Fizz'),
	false.
fizzbuzz1(N,_):-
	mod(N,5)=:=0,
	write('Buzz'),
	false.
fizzbuzz1(N,_):-
	mod(N,3)*mod(N,5)>0,
	write(N),
	false.
fizzbuzz1(N,M):-
	nl,
	N1 is N+1,
	fizzbuzz1(N1,M).

fizzbuzz(N):-
	N>0,
	fizzbuzz1(1,N).
