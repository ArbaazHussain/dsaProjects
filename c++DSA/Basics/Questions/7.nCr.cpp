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

int n,r;
cout<<"Enter n: ";    
cin>>n;  
cout<<"Enter r: ";    
cin>>r;

int ncr = getFactorail(n) / (getFactorail(n-r) * getFactorail(r));
cout<<ncr;
}