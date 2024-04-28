#include <iostream>
using namespace std;


int getFactorail(int num){

    int factorial = 1;

    for (int i = 2; i <=num; i++)
    {
        factorial = factorial * i;
    }
    return factorial;
}


int main() {

int n;
cout<<"Enter a number: ";    
cin>>n;  

cout<< getFactorail(n);

}