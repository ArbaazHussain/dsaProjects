#include <iostream>
#include <cmath>
using namespace std;

//Check if number is prime or not.

int main() {


label:


int n;
bool isPrime = true;
cout<<"enter no"<<endl;
cin>>n;


for (int i = 2; i <=sqrt(n); i++)
{
    if (n % i == 0) {;
    isPrime = false;
    cout<<"It is not a prime"<<endl;
        break;
    }
}


if (isPrime == true) { 
    cout<<"It is a prime"<<endl;
}


goto label;


}
