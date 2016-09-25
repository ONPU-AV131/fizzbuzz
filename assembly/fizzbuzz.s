.global _start

.text

.type fizzbuzz_sub, @function
fizzbuzz_sub:

	pushq	%rbp
	movq	%rsp, %rbp

	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	movq	$5, %r8
	divq	%r8
	cmpq	$0, %rdx
	jne	check_fizz

	movq	$buzz, 24(%rbp)
	movq	$buzz_len, 16(%rbp)

	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	movq	$3, %r8
	divq	%r8
	cmpq	$0, %rdx
	jne	return_sub

	movq	$fizzbuzz, 24(%rbp)
	movq	$fizzbuzz_len, 16(%rbp)
	jmp	return_sub

check_fizz:
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	movq	$3, %r8
	divq	%r8
	cmpq	$0, %rdx
	jne	print_number

	movq	$fizz, 24(%rbp)
	movq	$fizz_len, 16(%rbp)

	jmp	return_sub

print_number:
	movq	32(%rbp), %rax
	movq	$output_len, %rdi

next_digit:
	xorq	%rdx, %rdx
	movq	$10, %r8
	divq	%r8
	decq	%rdi
	addq	$48, %rdx
	movb	%dl, output(,%rdi,1)
	cmpq	$0, %rax
	jne	next_digit

	leaq	output(,%rdi,1), %rdx
	movq	%rdx, 24(%rbp)
	movq	$output_len, %rdx
	subq	%rdi, %rdx
	incq	%rdx
	movq	%rdx, 16(%rbp)

return_sub:
	movq	%rbp, %rsp
	popq	%rbp
	ret

_start:

# Taking amount of arguments from top of the stack
	movq	(%rsp), %rcx

	cmpq	$2, %rcx
	jb	set_default

	movq	16(%rsp), %rsi

	xorq	%rdi, %rdi
	xorq	%rax, %rax
	xorq	%rcx, %rcx

read_argument:
	movb	(%rsi, %rdi, 1), %al
	cmpq	$0, %rax
	je	fb_start

	subb	$48, %al
	js	check_argument
	cmpb	$9, %al
	jg	check_argument
	imulq	$10, %rcx
	addq	%rax, %rcx
	incq	%rdi
	cmpq	$10, %rdi
	jne	read_argument

check_argument:
	cmp	$0, %rcx
	jne	fb_start

set_default:
	movq	$100, %rcx

fb_start:
	xorq	%r9, %r9

fb_loop:
	incq	%r9
	movq	%r9, %rax

	pushq	%rcx # store countdown counter for future use
	push	%r9 # just store counter for future use
	pushq	$42 # here will be char *
	pushq	$42 # here will be length
	call	fizzbuzz_sub

	popq	%rdx
	popq	%rsi
	movq	$1, %rax
	movq	$1, %rdi
	# rsi - char *
	# rdx - length
	syscall

	popq	%r9
	popq	%rcx
	loop	fb_loop

	movq	$60, %rax
	xorq	%rdi, %rdi
	syscall
.data

output:
	.ascii "0123456789"
	output_len = . - output

	.ascii "\n"

fizz:
	.ascii "Fizz\n"
	fizz_len = . - fizz
fizzbuzz:
	.ascii "Fizz"
buzz:
	.ascii "Buzz\n"
	buzz_len = . - buzz
	fizzbuzz_len = . - fizzbuzz
