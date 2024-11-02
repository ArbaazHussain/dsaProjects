//
//  main.cpp
//  DSA
//
//  Created by ekincare on 09/08/23.
//

#include <iostream>
#include <cstdlib>
#include <cmath>
#include <vector>
#include <iomanip>
#include <set>
#include <unordered_set>
#include <stack>

using namespace std;


//MARK: ----BIT Magic--------------------------------------

//MARK: decimalToBinaryMy
/*
 Problems-
 1.Getting answer in reverse
 2.incorrect answer for input->8
 */
int decimalToBinaryMy(int n){
    int res=0;
    while (n!=0) {
        int lastDigit = n%2;
        res = (res*10)+lastDigit;
        n=n/2;
    }
    return res;
}
//T.C = theta(no of bits from last to msb)
//A.S = BigO 1


//MARK: decimalToBinary
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
int decimalToBinary(int n){
    int res=0;
    int i=0;
    while (n!=0) {
        int bit = n&1;
        res = (pow(10, i) * bit) + res;
        n=n>>1;
        i++;
    }
    return res;
    //or
    //    int answer=0;
    //    int i=0;
    //    while (n!=0) {
    //        int bit = n%2;
    //        answer = (pow(10, i) * bit) + answer;
    //        n=n/2;
    //        i++;
    //    }
    //    return answer;
}
//T.C = theta(no of bits from last to msb)
//A.S = BigO 1


//MARK: BinaryToDeciamal
int BinaryToDeciamal(int n){
    int i=0;
    int res=0;
    while (n!=0) {
        int digit = n%10;
        if (digit==1){
            res= res + pow(2,i);
        }
        n=n/10;
        i++;
    }
    return res;
}
//T.C = theta(no of digits)
//A.S = BigO 1


//MARK: isKthBitIsSet
//kth starts from 1
int isKthBitIsSet(int n,int k){
    if(k>1){
        n=n>>(k-1);
    }
    if((n&1)!=0){
        return true;
    }else{
        return false;
    }
}
/*
 or
 //kth starts from 0
 if( (n&(1<<k)) !=0) {
     return true;
 }else{
     return false;
 }
 */
//T.C =
//A.S =


//MARK: CounTotalSetBitsNaive
int CounTotalSetBitsNaive(int n){
    int count = 0;
    while (n!=0){
        if((n&1)!=0){
            count++;
        }
        n=n>>1;
    }
    return count;
    //or
    //    int count = 0;
    //    while (n!=0){
    //        if((n%2)!=0){
    //            count++;
    //        }
    //        n=n/2;
    //    }
    //    return count;
}
//T.C = theta(no of bits from last to msb)
//A.S = BigO 1


//MARK: BrainKerningams
//Function to count total set bits.
int brainKerningams(int n){
    int res = 0;
    while (n>0) {
        n=n&(n-1);
        res++;
    }
    return res;
}
//T.C = theta(no of set bits)
//A.S = BigO 1


//MARK: checkPowerOf2Naive
/*
 1.Explicitly handle zero
 2.Repeaedly devide by 2.
 */
int checkPowerOf2Naive(int n){
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
//T.C =
//A.S =


//MARK: checkPowerOf2Efficient
/*
 power of 2 has only 1 set bit.
 */
int checkPowerOf2Efficient(int n){
    if(n==0){
        return false;
    }
    return ((n&(n-1))==0);
}
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
 
 Doubt-:Not working fine for {1,7,2,3,3,1}
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


//MARK: printPowerSetForString
void printPowerSetForString(string s){
    int n = s.length();
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


//MARK: ***GFGProblems***

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





//MARK: ----Recursion--------------------------------------

//MARK: NtoOne
void NtoOne(int n)
{
    if(n==0){
        return;
    }
    cout<<n<<"\n";
    NtoOne(n-1);
}
//T.C = theta n
//A.S = theta n


//MARK: OnetoN-NonTailRecursive
void OnetoN(int n)
{
    if(n==0){
        return;
    }
    OnetoN(n-1);
    cout<<n<<"\n";
}
//T.C = theta n
//A.S = theta n


//MARK: OnetoN-TailRecursion
void OnetoNWithTailRecursion(int n, int k)
{
    if(n==0){
        return;
    }
    cout<<k<<"\n";
    OnetoNWithTailRecursion(n-1, k+1);
}
//T.C = theta n
//A.S = theta n


//MARK: factorial-NonTailRecursive
int factorialNonTailRecursive(int n){
    if (n==0){
        return 1;
    }
    return  n * factorialNonTailRecursive(n-1);
}
//T.C = theta n
//A.S = theta n


//MARK: factorial-TailRecursive
int factorialTailRecursive(int n, int k){
    if (n==0 || n==1){
        return k;
    }
    return factorialTailRecursive(n-1,k*n);
}
//T.C = theta n
//A.S = theta n


//MARK: sumOfNaturalNo-NonTailRecursive
int sumOfNaturalNo(int n)
{
    if(n==0){
        return 0;
    }
    return n+sumOfNaturalNo(n-1);
}
//T.C = theta n
//A.S = theta n


//MARK: sumOfNaturalNo-TailRecursive
int sumOfNaturalNoTailRecursive(int n, int k)
{
    if(n==0){
        return k;
    }
    return sumOfNaturalNoTailRecursive(n-1, k+n);
}
//T.C = theta n
//A.S = theta n


//MARK: checkForPalindromeIntergerRecursion
bool checkForPalindromeIntergerRecursion(int n, int rev, int nOrg)
{
    /*
     //Input Requirements
     n=input
     k=0
     nOrg=input
     */
    if(n==0){
        return nOrg==rev ? true : false;
    }
    int lastDigit = n%10;
    rev=(rev*10)+lastDigit;
    return checkForPalindromeIntergerRecursion(n/10, rev, nOrg);
}
//D = total digits of n
//R.R = T(D) = T(D-1) + C
//T.C = theta D
//A.S = theta D


//MARK: checkForPalindromeStringRecursion
bool checkForPalindromeStringRecursion(string S)
{
    if(S.length()==1 || S.empty()){
        return true;
    }
    if (S[0] != S[S.length()- 1])
    {
        return false;
    }
    S.erase(S.begin());
    S.pop_back();
    return checkForPalindromeStringRecursion(S);
}
//D = total digits of S
//R.R = T(D) = T(D-2) + C
//T.C = theta D
//A.S = theta D


//MARK: checkForPalindromeStringRecursionGFG
bool checkForPalindromeStringRecursionGFG(string S, int start, int end)
{
    /*
     //Input Requirements
     S    =input string
     start=0
     end  =S.length() - 1
     */
    
    if(start>=end){
        return true;
    }
    
    if (S[start] != S[end])
    {
        return false;
    }
    return checkForPalindromeStringRecursionGFG(S, start+1, end-1);
}
//N = total digits of S
//R.R = T(D) = T(D-2) + C
//T.C = theta D
//A.S = theta D


//MARK: sumOfDigitsMyRecursion
int sumOfDigitsMyRecursion(int n,int k){
    if(n==0){
        return k;
    }
    int lastDigit = n%10;
    n=n/10;
    return sumOfDigitsMyRecursion(n, k+lastDigit);
}
//N = total digits of S
//R.R = T(D) = T(D-1) + C
//T.C = theta D
//A.S = theta D


//MARK: sumOfDigitsGFGRecursion
int sumOfDigitsGFGRecursion(int n){
    if(n==0){
        return 0;
    }
    return n%10+sumOfDigitsGFGRecursion(n/10);
}
//N = total digits of S
//R.R = T(D) = T(D-1) + C
//T.C = theta D
//A.S = theta D


//MARK: FibenacchiMyRecursion
int FibenacchiMyRecursive(int n, int a, int b, int c, int i){
    /*
     //Input Requirements
     n    = input n
     a    = 0
     b    = 1
     c    = 0
     i    = 2
     */
    if(n==0 || n==1){
        return n;
    }
    c=a+b;
    a=b;
    b=c;
    if(n==i){
        return c;
    }
    return FibenacchiMyRecursive(n, a, b, c, i+1);
}
//T.C =
//A.S =


//MARK: FibenacchiCBRecursion
int FibenacchiCBRecursion(int n){
    if(n==0 || n==1){
        return n;
    }
    int smallInput = FibenacchiCBRecursion(n-1);
    int smallInput2 = FibenacchiCBRecursion(n-2);
    return smallInput+smallInput2;
}
//T.C =
//A.S =


//MARK: binaryExponentiation || powerRecursive
//Youtube - luv
/*
 If n is even -> F(x,n) = F(x,n) * F(x,n)
 if n is odd  -> F(x,n) = F(x,n) * F(x,n) * x
 */
int powerRecursive(int x, int n){
    if(n==0){
        return 1;
    }
    int temp = powerRecursive(x, n/2);
    temp = temp*temp;
    
    if(n%2==0){
        return temp;
    }else{
        return temp*x;
    }
    /*
     //For
     
     long long int M = pow(10,9)+7
     int temp = work(N, R/2);
     temp = ((temp%M)*(temp%M))%M;
     
     if(R%2==0){
     return (temp)%M;
     }else{
     return (temp*N)%M;
     }
     */
}
//T.C = theta log n
//A.S = theta log n


//MARK: ropeCuttingMaxCutsMyNaive
int ropeCuttingMaxCutsMyNaive(int n, int a, int b, int c){

    int res= INT_MAX;

    int myArray[6] = {a, b, c, a+b, a+c, c+b};
    int chosenIndex = -1;

    for (int i=0; i<6; i++){
        if(n%myArray[i] == 0){
            if(myArray[i] < res){
                res=myArray[i];
                chosenIndex=i;
            }
        }
    }

    if(chosenIndex==-1){
        res=-1;
    }
    else if(chosenIndex<3){
        res = n/res;
    }else{
        res = 2;
    }
    return res;
}


//MARK: ropeCuttingMaxCutsGFG
int ropeCuttingMaxCutsGFG(int n, int a, int b, int c){
    if(n==0){
        return 0;
    }
    if(n<0){
        return -1;
    }
    int res = max(ropeCuttingMaxCutsGFG(n-a, a, b, c),
                  max(ropeCuttingMaxCutsGFG(n-b, a, b, c),
                      ropeCuttingMaxCutsGFG(n-c, a, b, c)));
    
    if(res == -1)
        return -1;
    
    return res + 1;
}
//T.C = Big O(3^n)
//A.S =


//MARK: printPowerSetRecursion
void printPowerSetRecursion(string s, string current, int i){
    if(i==s.length()){
        cout<<current<<"\n";
        return;
    }
    
    printPowerSetRecursion(s, current, i+1);
    current = current+s[i];
    printPowerSetRecursion(s, current, i+1);
}


//MARK: towerOfHanoi
void towerOfHanoi(int n, char a, char b, char c){
    if(n==1){
        cout<<"Move 1 from"<<a<<"to"<<c<<"\n";
        return;
    }
    towerOfHanoi(n-1, a, c, b);
    cout<<"Move "<<n<<" From"<<a<<"to"<<c<<"\n";
    towerOfHanoi(n-1, b, a, c);
}


//MARK: josePhus
int josePhus(int n, int k){
    /*
     if we want the circle to starts from 1 then add 1 to the final result.
     */
    if(n==1){
        return 0;
    }else{
        return (josePhus(n-1, k)+k)%n;
    }
}


//MARK: subsetSumMyIterative
int subsetSumMyIterative(int arr[], int n, int sum){
    int res=0;
    if(sum==0){
        return 1;
    }
    for (int i=0; i<n; i++){
        for (int j=0; j<n; j++){
            if(arr[i]+arr[j]==sum && i!=j){
                res++;
            }
        }
    }
    return res/2;
}


//MARK: subsetSumMyRecursion
int subsetSumMyRecursion(vector<int>vect, vector<int>currentVect, int i, int sum, int res){
    /*
     vect        = set
     currentVect = subset
     i           = 0
     sum         = sum
     res         = 0
     */
    
    if(i==vect.size()){
        int currentSum=0;
        for(int i=0;i<currentVect.size(); i++){
            if(!currentVect.empty()){
                currentSum=currentSum+currentVect[i];
            }
        }
        if(sum==currentSum){
            res++;
        }
        return res;
    }
    
    int res1 = subsetSumMyRecursion(vect, currentVect, i+1, sum, res);
    currentVect.push_back(vect[i]);
    int res2 = subsetSumMyRecursion(vect, currentVect, i+1, sum, res);
    return res1+res2;
}
/*
private func subsetSumMyRecursionSwift(_ arr:[Int], _ currentArray:[Int], _ i: Int, _ sum: Int, _ res:Int) -> Int{
    var newRes = res
    let arrayCount = arr.count
    if(arrayCount==i){
        var total = 0
        if(!currentArray.isEmpty){
            currentArray.forEach { i in
                total += i
            }
        }
        if(total==sum){
            newRes += 1
        }
        return newRes
    }
    
    let first = practice2(arr, currentArray, i+1, sum, newRes)
    let newCurrentArray = currentArray+[arr[i]]
    let seconnd = practice2(arr, newCurrentArray, i+1, sum, newRes)
    
    return first+seconnd
}
*/



//MARK: **GFGProblems**




//MARK: countTotalDigitsInNumber
int countDigits(int n)
{
    if(n/10==0){
        return 1;
    }
    return 1+countDigits(n/10);
}


//MARK: digitalRoot
int tempDigitalRoot(int n)
{
    if(n==0){
        return 0;
    }
    int lastDigit = n%10;
    n = n/10;
    return lastDigit + tempDigitalRoot(n);
}

int digitalRoot(int n)
{
    int z = tempDigitalRoot(n);
    if(z/10==0){
        return z;
    }else{
        return digitalRoot(z);
    }
}


//MARK: josephusIterative
int josephusIterative(int n, int k)
{
    int ans = 0;
    for(int i = 2; i <= n; i++){
        ans = (ans + k)%i;
    }
    return ans+1;
}





//MARK: ----Array--------------------

//MARK: arrayBasic
void arrayBasic(){
    //Fixed Array-:
    int fixedArray[100];
    int fixedArray2[] = {2,2,1,3,2};
    int sizeOfArray = sizeof(fixedArray2)/sizeof(fixedArray2[5]); //le
    
    
    //Dynamic Array-:
    //allocate
    int *dynamicArray = new int[3];
    //deallocate
    delete[] dynamicArray;
    //remove pointer
    dynamicArray=NULL;
    
    
    //Vectors-:
    vector<int> vectorArray{10, 5, 2, 3, 6};
    vector<int> currentVectorArray{};
    int sizeOfVectorArray = vectorArray.size();
}


//MARK: insertElementInFixedArray
void insertElementInFixedArray(int arr[], int cap, int occupied, int x, int pos){
    if(pos>cap || pos<=0){
        cout<<"invalid position"<<endl;
        return;
    }
    if(cap==occupied){
        cout<<"no space"<<endl;
        return;
    }
    int index=pos-1;
    for (int i=occupied-1; i>=index; i--) {
        arr[i+1] = arr[i];
    }
    arr[pos-1] = x;
    //Avoid this block for time complexity
    for (int i=0; i<cap; i++) {
        cout<<arr[i]<<endl;
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deleteElementInFixedArray
void deleteElementInFixedArray(int arr[], int cap, int x){
    int index=-1;
    //searching the element
    for (int i=0; i<cap; i++){
        if(arr[i]==x){
            index=i;
            break;
        }
    }
    if(index==-1){
        cout<<"element to be deleted is not present"<<endl;
        return;
    }
    for (int i=index; i<cap; i++) {
        if(i<cap-1){
            arr[i]=arr[i+1];
        }else{
            arr[i]=0;
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<cap; i++) {
        cout<<arr[i]<<endl;
    }
}
//T.C = BigO(n), if delete the last element then T.C is Big0(1)
//A.S = BigO(1)


//MARK: largestElementIndex
int largestElementIndex(int arr[], int n){
    int largestIndex=0;
    for (int i=1; i<n; i++) {
        if(arr[i]>arr[largestIndex]){
            largestIndex=i;
        }
    }
    return largestIndex;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: secondlargestElementIndexNaive
int secondlargestElementIndexNaive(int arr[], int n){
    int largestIndex=largestElementIndex(arr, n);
    
    int secondLargestIndex=-1;
    
    for (int i=0; i<n; i++) {
        if(arr[i]!=arr[largestIndex]){
            if(secondLargestIndex==-1){
                secondLargestIndex=i;
            }
            else if(arr[i]>arr[secondLargestIndex]){
                secondLargestIndex=i;
            }
        }
    }
    return secondLargestIndex;
}
//T.C = BigO(n^2)
//A.S = BigO(1)


//MARK: secondlargestElementIndexEfficient
int secondlargestElementIndexEfficient(int arr[], int n){
    int largest= 0;
    int secondLargest = -1;
    for (int i=1; i<n; i++) {
        if(arr[i]>arr[largest]){
            secondLargest=largest;
            largest=i;
        }else if(arr[i]<arr[largest]){
            if(arr[i]>arr[secondLargest]){
                secondLargest=i;
            }
        }
    }
    return secondLargest;
} //T.C = Theta(n)
//A.S = BigO(1)


//MARK: isArraySortedInIncreasing
int isArraySortedInIncreasing(int arr[], int n){
    for (int i=1; i<n; i++) {
        if(arr[i-1]>arr[i]){
            return false;
        }
    }
    return true;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: reverseArray1
void reverseArray1(int arr[], int n){
    for (int i=0; i<n/2; i++) {
        int j=n-i-1;
        int temp=arr[i];
        arr[i]=arr[j];
        arr[j]=temp;
    }
    //Avoid this for T.C
    for (int j=0; j<n; j++) {
        cout<<arr[j]<<" ";
    }
}
//T.C = BigO(n) - i.e(n/2)
//A.S = BigO(1)


//MARK: reverseArray2
void reverseArray2(int arr[], int n){
    int start=0;
    int end=n-1;
    while (start<end) {
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        
        start++;
        end--;
    }
    //Avoid this for T.C
    for (int j=0; j<n; j++) {
        cout<<arr[j]<<" ";
    }
}
//T.C = BigO(n) - i.e(n/2)
//A.S = BigO(1)


//MARK: removeDuplicateeGfgNaive
int removeDuplicateSortedArrayGfgNaive(int a[],int n){
    int temp[n];
    
    temp[0]=a[0];
    int res=1;
    
    for (int i=1; i<n; i++) {
        if(temp[res-1]!=a[i]){
            temp[res]=a[i];
            res++;
        }
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<res; i++) {
        a[i]=temp[i];
    }
    return res;
}
//T.C = Theta(n)
//A.S = Theta(n)


//MARK: removeDuplicateeEfficient
void removeDuplicateSortedArrayEfficient(int arr[],int n){
    int res = 1;
    for (int i=1; i<n; i++) {
        if(arr[i] != arr[res-1]){
            arr[res] = arr[i];
            res++;
        }
    }
}
//T.C = Theta(n)
//A.S = BigO (1)


//MARK: moveZerosToEnd
void moveZerosToEndMyNaive(int arr[], int n) {
    int temp[n];
    int newN=0;
    int zeroInsertionAtLastCount=0;
    for (int i=0; i<n; i++) {
        if(arr[i]!=0){
            temp[newN]=arr[i];
            newN++;
        }else{
            temp[(n-1)-zeroInsertionAtLastCount]=0;
            zeroInsertionAtLastCount++;
        }
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<temp[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = Theta(n)


//MARK: moveZerosToEndGfgNaive
void moveZerosToEndGfgNaive(int arr[], int n) {
    for (int i=0; i<n; i++) {
        if(arr[i]==0){
            for (int j=i+1; j<n; j++) {
                if(arr[j]!=0){
                    int temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                    break;
                }
            }
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n^2)
//A.S = BigO (1)


//MARK: moveZerosToEndEfficient
void moveZerosToEndEfficient(int arr[], int n) {
    int count=0;
    for (int i=0; i<n; i++) {
        if(arr[i]!=0){
            int temp=arr[i];
            arr[i]=arr[count];
            arr[count]=temp;
            
            count++;
        }
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = BigO (1)


//MARK: leftRotateArrayByOne
void leftRotateArrayByOne(int arr[], int n) {
    int firstElement=arr[0];
    for (int i=0; i<n-1; i++) {
        arr[i]=arr[i+1];
    }
    arr[n-1]=firstElement;
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = BigO (1)



//MARK: LeftRotateArraybyDPlacesGfgEfficient
/*
 if(d==n) { no change }
 else if(d>n) {d = d-n}
 */
void LeftRotateArraybyDPlacesGfgEfficient(int arr[], int d, int n){
    if(n==d){
        return;
    }
    int temp[d];
    
    for (int i=0; i<d; i++) {
        temp[i]=arr[i];
    }
    for (int i=0; i<n-d; i++) {
        arr[i]=arr[i+d];
    }

    for (int i=0; i<d; i++) {
        arr[n-d+i]=temp[i];
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = Theta(d)


//MARK: LeftRotateArraybyDPlacesGfgEfficient(Reversal Algorithm)
void LeftRotateArrayReverse(int arr[], int low, int high)
{
    while(low < high)
    {
        swap(arr[high], arr[low]);
        low++;
        high--;
    }
}
void LeftRotateArraybyDPlacesGfgReversal(int arr[], int d, int n){
    LeftRotateArrayReverse(arr, 0, d - 1);
    LeftRotateArrayReverse(arr, d, n - 1);
    LeftRotateArrayReverse(arr, 0, n - 1);
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(2n)  i.e=(d+(n-d)+n)
//A.S = Big0 (1)


//MARK: leadersInArrayNaive
void leadersInArrayNaive(int arr[], int n){
    for (int i=0; i<n; i++) {
        bool isLeader=true;
        for (int j=i; j<n; j++) {
            if(arr[j]>arr[i]){
                isLeader=false;
                break;
            }
        }
        if(isLeader){
            cout<<arr[i]<<" ";
        }
    }
}
//T.C = Big0 (n^2)
//A.S = Big0 (1)


//MARK: leadersInArrayEfficient
void leadersInArrayEfficient(int arr[], int n){
    int currentLeader = arr[n - 1];
    cout<<currentLeader<<" ";
    
    for(int i=n-2; i>=0; i--)
    {
        if(arr[i]>currentLeader)
        {
            currentLeader=arr[i];
            cout<<currentLeader<<" ";
        }
    }
}
//T.C = Theta(n)
//A.S = Big0 (1)


//MARK: maximumDifferenceProblemWithOrderNaive
int maximumDifferenceProblemWithOrderNaive(int A[], int n){
    int max=INT_MIN;;
    for(int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            if(j>i && ((A[j]-A[i])>max)){
                max=A[j]-A[i];
            }
        }
    }
    return max;
}
//T.C = Theta(n^2)
//A.S = Big0 (1)


//MARK: maximumDifferenceProblemWithOrderEfficient
int maximumDifferenceProblemWithOrderEfficient(int A[], int n){
    
    return 0;
}
//T.C = Theta(n)
//A.S = Big0 (1)


//MARK: frequenciesInSortedArrayMy
void frequenciesInSortedArrayMy(int arr[], int n){
    for (int i=0; i<n; i++) {
        int count=1;
        for (int j=i+1; i<n; j++) {
            if(arr[j]>arr[i]){
                cout<<arr[i]<<" "<<count<<endl;
                i=(j-1);
                break;
            }
            if(arr[i]==arr[j]){
                count++;
            }
        }
    }
}
//T.C = Theta(n^2)
//A.S = Big0 (1)


//MARK: frequenciesInSortedArrayGfg
void frequenciesInSortedArrayGfg(int arr[], int n)
{
    int freq = 1, i = 1;
    while(i < n)
    {
        while(i < n && arr[i] == arr[i - 1])
        {
            freq++;
            i++;
        }
        cout<<arr[i - 1] << " " << freq << endl;
        i++;
        freq = 1;
    }
    if(n==1 || arr[n-1]!=arr[n-2])
        cout<<arr[n-1] + " " + 1;
}

//T.C = Theta(n)
//A.S = Big0 (1)

//Swift code
/*
 func practice(arr: inout [Int]){
     var freq = 1
     if(arr.count==1){
         print("\(arr[0]) \(freq)")
     }
     for i in 1..<arr.count{
         if(arr[i-1] != arr[i]){
             print("\(arr[i-1]) \(freq)")
             freq = 1
         }else{
             freq += 1
         }
        
         if(i == arr.count-1){
             if(arr[i-1]==arr[i]){
                 print("\(arr[i]) \(freq)")
             }else{
                 print("\(arr[i]) \(freq)")
             }
         }
     }
 }
 //T.C = Theta(n)
 //A.S = Big0 (1)
 */


//Top 50 Array Coding Problems for Interviews
//https://www.geeksforgeeks.org/top-50-array-coding-problems-for-interviews/
int peakElement(int arr[], int n){
    for(int i=0; i<n; i++) {
        if(n==1){
            return 1;
        }
        if(i==0){
            if(arr[i]>arr[i+1]){
                return i;
            }
        }else if(i==n-1){
            if(arr[i]>arr[i+1]){
                return i;
            }
        }
        if(arr[i]>arr[i-1] && arr[i]>arr[i+1]){
            return i;
        }
    }
    return -1;
}


pair<long long, long long> getMinMax(long long a[], int n) {
    long int max = a[0];
    long int min = a[0];
    
    for (int i=1; i<n; i++) {
        if(a[i]>max){
            max = a[i];
        }
        if(a[i]<min){
            min = a[i];
        }
    }
    return std::make_pair(min, max);
}

int kthSmallest(int arr[], int l, int r, int k) {
    //code here
    return 0;
}

int findFrequency(vector<int> v, int x){
    int n = v.size();
    int count = 0;
    for (int i=0; i<n;i++) {
        if(v[i]==x){
            count++;
        }
    }
    return count;
}

//Sort an array of 0s, 1s and 2s
void sort012(int a[], int n)
{
    // code here
}

vector<int> subarraySum(vector<int>arr, int n, long long s)
{
    for (int i=1; i<=n; i++) {
        int count = arr[i-1];
        if(count == s){
            cout<<i<<" "<<endl;
            vector<int> resultVector{i};
            return resultVector;
        }
        for (int j=i+1; j<=n; j++) {
            if(count>s){
                count = 0;
                break;
            }
            count = count + arr[j-1];
            if(count == s){
                cout<<i<<" "<<j<<endl;
                vector<int> resultVector{i,j};
                return resultVector;
            }
        }
    }
    vector<int> resultVector{-1};
    return resultVector;
}

void segregateElements(int arr[],int n)
{
    int count=0;
    for (int i=0; i<n; i++) {
        if(arr[i]>=0){
            int temp = arr[count];
            arr[count] = arr[i];
            arr[i] = temp;
            count++;
        }
    }
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}

int doUnion(int a[], int n, int b[], int m)  {
    unordered_set<int> s;
    for (int i=0; i<n; i++) s.insert(a[i]);
    for (int j=0; j<m; j++) s.insert(b[j]);
    
//    for (int k=0; k<s.size(); k++) {
//        cout<<a[k]<<endl;
//    }
    return s.size();
}



//MARK: LinkedList ------------------
struct Node{
    int data;
    Node *next;
    
    Node(int x){
        data = x;
        next = NULL;
    }
};

void printLinkedlist(Node *head){
    Node *curr = head;
    while (curr != NULL) {
        cout<<curr->data<<" ";
        curr = curr->next;
    }
}



//MARK: Stack --------------------
struct MyStackUsingVector{
    vector<int> v;
    
    void push(int x){
        v.push_back(x);
    }
    
    int pop(){
        int res=v.back();
        v.pop_back();
        return res;
    }
    
    int peek(){
        return v.back();
    }
    
    int size(){
        return v.size();
    }
    
    bool isEmpty(){
        return v.empty();
    }
};

void MyStackUsingSTL(){
    stack<int> stack;
    
    stack.push(21);// The values pushed in the stack should be of the same data which is written during declaration of stack
    stack.push(22);
    stack.push(24);
    stack.push(25);
    int num=0;
    stack.push(num);
    stack.pop();
    stack.pop();
    stack.pop();

    while (!stack.empty()) {
        cout << stack.top() <<" ";
        stack.pop();
    }
}

//MARK: Practice--------------------------
int main()
{
    //    int n = 8;
    
    //    int array1[4] =  {30,10,8,2};
    //    int sizeOfArray = sizeof(array1)/sizeof(int);
    
    //    vector<int> vectorArray{1,2,7,5};
    //    vector<int> y =  leadersInArray(array2, sizeOfArray);
    
    //    int tempArray[n];
    //    std::fill(tempArray,tempArray+n,0);
    
    //    string s = "geeksforgeeks";
    //    string g = "forgeeksgeeks";
    //    string k = "checkThePush";
    
    //    sort(g.begin(), g.end());
    //    cout<<s<<endl;
    //    cout<<g<<endl;
    return 0;
}
