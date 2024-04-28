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


int getNcr(int n,int r){
    int ncr = getFactorail(n) / (getFactorail(n-r) * getFactorail(r));
    return ncr;
}


int main() {


    int n;
    cout<<"Enter N: ";
    cin>>n;


    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j<=i; j++)
        {
            cout<<getNcr(i,j)<<" ";
            //cout<<"*"<<" ";
        }
        cout<<endl;
    }
    









}