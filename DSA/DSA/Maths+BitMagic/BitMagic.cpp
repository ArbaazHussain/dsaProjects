//
//  BitMagic.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 03/11/24.
//

#include <iostream>

using namespace std;
using std::cout;
using std::endl;


//MARK: --------BIT MAGIC----------



//MARK: decimalToBinary
string decimalToBinaryStv(int n){
    string res = "";
    while (n!=0) {
        int lastDigit = n%2;
        if(lastDigit == 1){
            res+= '1';
        }else{
            res+= '0';
        }
        n=n/2;
    }
    reverse(res.begin(), res.end());
    return res;
}
//here we do not use integer to return as it gives incorrect answer for input -> whose (LSB) is 0
//T.C = log n
//A.S = log n


//Youtube - loveBabbar
/*
 1.
 if(no&1 == 1){
 no is odd
 }else{
 no is even
 }
 
 2.
 Make Numbers-:
 int answer = 0
 same flow = (answer*10) + digit
 reverse flow = (10^i * digit) + answer
 */
int decimalToBinaryLb(int n){
    int res=0;
    int i=0;
    while (n!=0) {
        int lastBit = n&1;
        res = (pow(10, i) * lastBit) + res;
        n=n>>1;
        i++;
    }
    return res;
}
//T.C = theta(no of bits from last to msb)
//A.S = BigO 1


//MARK: BinaryToDeciamal
int BinaryToDeciamal(int n){
    int i=0;
    int res=0;
    while (n!=0) {
        int lastDigit = n%10;
        if (lastDigit==1){
            res= res + pow(2,i);
        }
        n=n/10;
        i++;
    }
    return res;
}
//T.C = theta(no of digits)
//A.S = BigO 1


//MARK: checkIfNumberIsOdd
bool checkIfNumberIsOdd(int n){
    if((n&1)==1){
        return true;
    }else{
        return false;
    }
}
//T.C = BigO 1
//A.S = BigO 1


//MARK: swapTwoNumbers
void swapTwoNumbersBitwise(int a, int b){
    a=a^b;
    b=a^b;
    a=a^b;
}
//swapTwoNumbers without third variable
//T.C = BigO 1
//A.S = BigO 1


//MARK: CounTotalSetBit
//https://www.geeksforgeeks.org/problems/set-bits0143/1
int CounTotalSetBitsNaive(int n){
    int count = 0;
    while (n!=0){
        if((n&1)==1){
            count++;
        }
        n=n>>1;
    }
    return count;
}
//Approach - decimalToBinaryStv
//T.C = theta(no of bits from lsb to msb)
//A.S = BigO 1


int brainKerningams(int n){
    int res = 0;
    while (n>0) {
        n=n&(n-1);
        res++;
    }
    return res;
}
//When we subtract 1 from a number the all trailing zero becomes one and last set bit becomes zero.
//T.C = theta(no of set bits)
//A.S = BigO 1


//MARK: isKthBitIsSet
//k>=1
int isKthBitIsSetUsingLeftShift(int n,int k){
    if((n&(1<<k)) !=0) {
        return true;
    }else{
        return false;
    }
}
//T.C = 1
//A.S = 1


int isKthBitIsSetUsingRightShift(int n,int k){
    if(((n>>k)&1) != 0) {
        return true;
    }else{
        return false;
    }
}
//T.C = 1
//A.S = 1


//MARK: setIthBit
//k>=1
int setIthBit(int n,int k){
    return n|(1<<k);
}
//or + leftShift
//T.C = 1
//A.S = 1


//MARK: clearIthBit
//k>=1
int clearIthBit(int n,int k){
    return n&(~(1<<k));
}
//AND + ~leftShift
//T.C = 1
//A.S = 1


//MARK: toggleIthBit
//k>=1
int toggleIthBit(int n,int k){
    return n^(1<<k);
}
//XOR + leftShift
//T.C = 1
//A.S = 1


//MARK: removeLastSetBit
//k>=1
int removeLastSetBit(int n){
    return n&(n-1);
}
//& + n-1
//T.C = 1
//A.S = 1


//MARK: checkPowerOfTwo
//https://www.geeksforgeeks.org/problems/power-of-2-1587115620/0
int checkPowerOfNaive(int n){
    if(n==0){
        return false;
    }
    while (n!=1) {
        if(n%2!=0){
            return false;
        }
        n=n/2;
    }
    return true;
}
/*
 1.Explicitly handle zero
 2.Repeatedly devide by 2 and if n does not devide by 2 then its not a power of two
 */
//T.C = theta log n
//A.S = BigO 1



int checkPowerOf2Efficient(int n){
    if(n==0){
        return false;
    }
    return ((n&(n-1))==0);
}
//Approach - power of 2 has only 1 set bit.
//T.C = theta 1
//A.S = BigO  1


//MARK: oneOddOccurringNaive
//function to find first element which appears odd times.
int oneOddOccurringNaive(int arr[], int n){
    for (int i=0; i<n; i++) {
        int count = 0;
        for (int j=0; j<n; j++) {
            if(arr[i]==arr[j]){
                count++;
            }
        }
        if(count%2!=0){
            return arr[i];
        }
    }
    return -1;
}
//T.C = theta n^2
//A.S = BigO  1


//MARK: oneOddOccurringEfficient
/*
 ^ = xor(operator)
 x^0 = x
 x^y = y^x
 x^(y^z) = (x^y)^z
 x^x = 0
 
 x^x^x.....(odd  times) = x
 x^x^x.....(even times) = 0
 
 This only works when given array has only one Odd Occurring element.
 */
int oneOddOccurringEfficient(int arr[], int n){
    int res= arr[0];
    for (int i=1; i<n; i++) {
        res = res^arr[i];
    }
    return res;
}
//T.C = theta n
//A.S = BigO 1


//MARK: twoOccurringNaive
/*
 //function to find first two element which appears odd times.
 
 Doubt -: Not working fine for {2,2,1,3,2,3};
 Solution(May be)-:
 ------------------
 int totalCount=0;
 for (int i=0; i<n; i++){
     if(totalCount>=2){
         return;
     }
     int count = 0;
     for (int j=0; j<n; j++) {
         if(arr[i]==arr[j]){
             count++;
         }
     }
     if(count%2!=0){
         totalCount++;
         cout<<arr[i]<<endl;
     }
 }
 --------------------
 */
void twoOccurringNaive(int arr[], int n){
    for (int i=0; i<n; i++) {
        int count = 0;
        for (int j=0; j<n; j++) {
            if(arr[i]==arr[j]){
                count++;
            }
        }
        if(count%2!=0){
            cout<<arr[i]<<"\n";
        }
    }
}
//T.C = theta n^2
//A.S = BigO  1


//MARK: twoOccurringEfficient
void twoOccurringEfficient(int arr[], int n){
    
}
//T.C =
//A.S =


//MARK: printPowerSetForStringMy
void printPowerSetForStringMy(string s){
    long long int length  = s.length();
    int subsetCount = pow(2, length);
    for (int i=0; i<subsetCount; i++) {
        int tempI = i;
        for (int j=0; j<length; j++) {
            int lastBit = tempI&1;
            if (lastBit == 1) {
                cout<<s[j];
            }
            tempI=tempI>>1;
        }
        cout<<endl;
    }
}


//MARK: printPowerSetForString
void printPowerSetForString(string s){
    long long int n = s.length();
    int pSize = (1<<n);
    for (int i=0; i<pSize; i++) {
        for (int j=0; j<n; j++) {
            if((i&(1<<j))!=0){
                cout<<s[j];
            }
        }
        cout<<"\n";
    }
}
//T.C = (theta 2^n * n)
//A.S = BigO 1


//MARK: printPowerSetArrayofIntegers
void printPowerSetArrayofIntegers(int arr[], int n){
    int size = pow(2, n);
    for (int i=0; i<size; i++) {
        for (int j=0; j<n; j++) {
            if((i&(1<<j))!=0){
                cout<<"-"<<arr[j]<<"-";
            }
        }
        cout<<"\n";
    }
}


//MARK: bitwiseOfTwoNumber
int bitwiseOfTwoNumber(int a, int b){
    int res=0;
    int i=0;
    while (a!=0 || b!=0) {
        int aLastBit = a&1;
        int bLastBit = b&1;
        res = (pow(10, i) * (aLastBit^bLastBit)) + res;
        a=a>>1;
        b=b>>1;
        i++;
    }
    return BinaryToDeciamal(res);
}
//T.C = theta [(no of bits in max(a,b))] + [no of digits of res]
//A.S = BigO 1


//MARK: -------GFGProblems-------

//MARK: findFirstSetBit
//Function to find position of first set bit in the given number.
unsigned int findFirstSetBit(int n)
{
    int i=1;
    while (n>0) {
        if((n&1)==1){
            return i;
        }
        n=n>>1;
        i++;
    }
    return 0;
}


//MARK: rightMostDiffBit
//Function to find the first position with different bits.
int rightMostDiffBit(int m, int n)
{
    int i=1;
    while(m>0 || n>0){
        int mBit = m&1;
        int nBit = n&1;
        if(mBit!=nBit){
            return i;
        }
        m=m>>1;
        n=n>>1;
        i++;
    }
    return -1;
}


//MARK: bitDifference
// Function to find number of bits needed to be flipped to convert A to B
int bitDifference(int m, int n){
    int i=0;
    while(m>0 || n>0){
        int mBit = m&1;
        int nBit = n&1;
        if(mBit!=nBit){
            i++;
        }
        m=m>>1;
        n=n>>1;
    }
    return i;
}


//MARK: isSparse
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


//MARK: binaryToGreycode
int binaryToGreycode(int n)
{
    return n^(n>>1);
}


//MARK: grayToBinary
int grayToBinary(int n)
{
    int inv = 0;
    // Taking xor until n becomes zero
    while(n>0){
        inv ^= n;
        n = n >> 1;
    }
//    for (; n; n = n >> 1){
//        inv ^= n;
//    }
    return inv;
}


//MARK: --------STV--------






//MARK: ----------MainFunction-----------

//int main()
//{
//    cout<<CounTotalSetBitsNaive(13);
//    cout<<endl;
//    return 0;
//}


string decimalToBinaryBrute(int n){
    string res = "";
    while (n!=0) {
        int lastDigit = n%2;
        if(lastDigit == 1){
            res+= '1';
        }else{
            res+= '0';
        }
        n=n/2;
    }
    reverse(res.begin(), res.end());
    return res;
}
//T.C = log n
//A.S = log n
