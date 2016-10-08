#include <unistd.h>
#include <stdio.h>

int main (int argc, char *argv[]){
	char *cmd;
	char *run="python ~/fizzbuzz/python/fizzbuzz.py";
	if(argc>1){
		asprintf(&cmd,"%s %s",run,argv[1]);
	}
	else{
		asprintf(&cmd,"%s",run);
	}
	system(cmd);
}
