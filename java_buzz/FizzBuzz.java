import java.util.Optional;

public class FizzBuzz {
	public static String fizzBuzzInJava8(int number) {
		String result = Optional.of(number)
			.map(n -> (n % 3 == 0 ? "Fizz" : "") + (n % 5 == 0 ? "Buzz" : ""))
			.get();
		return result.isEmpty() ? Integer.toString(number) : result;
	}

	public static void main (String[] args){
        int max = 100;
        if(args.length > 0){
            max = Integer.parseInt(args[0]);
        }

        for(int i = 1; i <= max; i++){
            System.out.println(fizzBuzzInJava8(i));
        }
	}

}
