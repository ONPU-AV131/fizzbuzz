#include <iostream>
#include <string>

using namespace std;

int
main(int argc, char **argv) {
	int max = 100;
	string line;

	if (argc > 1) {
		string param(argv[1]);
		max = stoi(param);
	}

	for (int i = 1; i <= max; ++i) {
		line = "";
		if (i % 3 == 0) {
			line.append("Fizz");
		}
		if (i % 5 == 0) {
			line.append("Buzz");
		}

		if (line.length()) {
			cout << line << endl;
		} else {
			cout << i << endl;
		}
	}

	return 0;
}
