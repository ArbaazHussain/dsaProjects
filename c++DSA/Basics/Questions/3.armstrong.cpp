#include <iostream>
using namespace std;


int main() {


int n;
cout<<"Enter a number: ";    
cin>>n;    


int temp = n;
int sum = 0;


while (temp>0)
{
    int lastDigit = temp%10;
    int cube = lastDigit * lastDigit * lastDigit;
    sum = sum + cube;
    temp = temp/10;
}


if (sum == n){
    cout<<"armstrong number";
}else{
    cout<<"not a armstrong number";
}


}