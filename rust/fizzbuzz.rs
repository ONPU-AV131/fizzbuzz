use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let mut max = 101;

    if args.len() > 1 {
        let arg = args[1].parse::<i32>();
	if arg.is_ok() {
	    max = arg.unwrap() + 1;
	}
    }

    for n in 1..max {
	if n % 15 == 0 {
	    println!("FizzBuzz");
	} else if n % 3 == 0 {
	    println!("Fizz");
	} else if n % 5 == 0 {
	    println!("Buzz");
	} else {
	    println!("{}", n);
	}
    }
}
