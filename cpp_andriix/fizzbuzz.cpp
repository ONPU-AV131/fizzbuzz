#include <iostream>
#include <cstdlib>
using namespace std;

int main(int argc, char* argv[])
{
    int counter;
    if(argc>1)
    {
        counter=atoi(argv[1]);
    }
    else
    {
        counter=100;
    }
    for(int i=1;i<=counter;i++)
    {
        if(0==i%5 && 0==i%3)
        {
           cout<<"FizzBuzz"<<endl;
        }
        else if(0==i%5)
        {
            cout<<"Buzz"<<endl;
        }
        else if(0==i%3)
        {
            cout<<"Fizz"<<endl;
        }
        else
        {
        cout<<i<<endl;
        }
    }

    return 0;
}
