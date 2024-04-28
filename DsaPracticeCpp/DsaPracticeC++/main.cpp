//
//  main.cpp
//  DsaPracticeC++
//
//  Created by ekincare on 20/11/23.
//

#include <iostream>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;
long long int M = pow(10,9)+7;

//MARK: --------------------------
void powerSetPrint(string s, string current, int i){
    if(i==s.length()){
        cout<<current<<"\n";
        return ;
    }
    powerSetPrint(s, current, i+1);
    current= current+s[i];
    powerSetPrint(s, current, i+1);
}

vector <string> powerSet(vector<string>currentVect, string s, string current, int i)
{
    if(i==s.length()){
        currentVect.push_back(current);
        return currentVect;
    }
    vector<string> a = powerSet(currentVect, s, current, i+1);
    current = current+s[i];
    vector<string> b = powerSet(currentVect, s, current, i+1);
    
    vector<string> mergedVect(a.size() + b.size());
    merge(a.begin(), a.end(), b.begin(), b.end(), mergedVect.begin());
    
    return mergedVect;
}

long long toh(int N, char A, char B, char C) {
    if(N==1){
        cout<<"move disk "<<N<< " from rod "<<A<<" to rod "<<B<<"\n";
        return 0;
    }
    toh(N-1, A, B, C);
    cout<<"move disk "<<N<<" from rod "<<A<<" to rod "<<B<<"\n";
    toh(N-1, B, C, A);
    return (pow(2, N)-1);
}

int tempJosephus(int n, int k)
{
    if(n==1){
        return 0;
    }
    else{
        return ((tempJosephus(n-1, k)+k)%n);
    }
}

int josephus(int n, int k){
    return 1+tempJosephus(n, k);
}


bool isSparse(int n)
{
    int lastBit=n&1;
    n=n>>1;
    while (n>0) {
        int secondLastBit = n&1;
        if(lastBit==1 && secondLastBit==1){
            return false;
        }
        lastBit=secondLastBit;
        n=n>>1;
    }
    return true;
}

int main(){
    //    for (int i=1; i<=20; i++) {
    //
    //    }
   
    cout<<isSparse(0);
    
    int myArray[3] = {1,2,3};
    int arrayZize = sizeof(myArray)/sizeof(myArray[0]); //length calculation
    

    //    vector<string> currentArray{};
    //    string s = "abc";
    //    vector<string> res = powerSet(currentArray, s, "", 0);
    //    for(int i=0;i<res.size(); i++){
    //        cout<<res[i]<<"\n";
    //    }
    return 0;
}


