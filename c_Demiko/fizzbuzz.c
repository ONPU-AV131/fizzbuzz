#include "stdio.h"
#include "stdlib.h"

void main(int argc, char *argv[]){
	int max=100;
	if(argc>1){
		max=atoi(argv[1]);
	}
	int i;
	for(i=1;i<=max;i++){
		if(i%3==0){
			printf("Fizz");
		}
		if(i%5==0){
			printf("Buzz");
		}
		if(i%3 && i%5){
			printf("%d",i);
		}
		printf("\n");
	}
}
