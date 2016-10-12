#include <iostream>
#include <cstdlib>
using namespace std;

int main(int argv, char* argc[]){
	int n=15;
	if(argv>1){
		n=atoi(argc[1]);
	}
	for(int i=1;i<=n;i++){
		if(i%3==0){
			cout << "Fizz";
		}
		if(i%5==0){
			cout << "Buzz";
		}
		if(i%3 && i%5){
			cout << i;
		}
		cout << "\n";
	}
}
