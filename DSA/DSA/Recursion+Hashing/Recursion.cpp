//
//  Recursion.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 05/11/24.
//

#include <iostream>
#include <vector>

using namespace std;
using std::cout;
using std::endl;



//MARK: -------Recursion---------
//The idea of Recursion is always to use the solution of the subproblems, and then use these solutions to solve the overall solutions.


//MARK: NtoOne-TailRecursion
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
//pass k as 1
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
    if(n==1){
        return 1;
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


//MARK: sumOfDigitsMyRecursion-TailRecursive
int sumOfDigitsMyRecursionTailRecursive(int n,int k){
    if(n==0){
        return k;
    }
    int lastDigit = n%10;
    n=n/10;
    return sumOfDigitsMyRecursionTailRecursive(n, k+lastDigit);
}
//N = total digits of S
//R.R = T(D) = T(D-1) + C
//T.C = theta D
//A.S = theta D


//MARK: sumOfDigitsGFGRecursion-NonTailRecursive
int sumOfDigitsGFGRecursionNonTailRecursive(int n){
    if(n==0){
        return 0;
    }
    return n%10+sumOfDigitsGFGRecursionNonTailRecursive(n/10);
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
 If n is even -> F(x,n) = F(x,n/2) * F(x,n/2)
 if n is odd  -> F(x,n) = F(x,n/2) * F(x,n/2) * x
 */
long long int powerRecursive(int a, int b){
    if(b==0){
        return 1;
    }
    long long int recCall = powerRecursive(a, b/2);
    if(b%2==0){
        return recCall * recCall;
    }else{
        return a * recCall * recCall;
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
//T.C = theta log b
//A.S = theta log b



//MARK: -------Recursion SQ---------



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


//MARK: subsetSumProblemMyIterative
int subsetSumProblemMyIterative(int arr[], int n, int sum){
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
int subsetSumProblemMyRecursion(vector<int>vect, vector<int>currentVect, int i, int sum, int res){
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
    
    int res1 = subsetSumProblemMyRecursion(vect, currentVect, i+1, sum, res);
    currentVect.push_back(vect[i]);
    int res2 = subsetSumProblemMyRecursion(vect, currentVect, i+1, sum, res);
    return res1+res2;
}
/*
 //In Swift
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


//MARK: subsetSumProblemGfgRecursion
int subsetSumProblemGfgRecursion(){
    return 0;
}


//MARK: printingAllPermunations
void printingAllPermunations(){
}



//MARK: -------GFGProblems-------



//MARK: powerOfNumbers % M (M = 1e9+7)
long long powerOfNumbers(int N,int R)
{
    int M = 1e9+7;
    if(R==0){
        return 1;
    }
    int updatedPower = R/2;
    long long temp = powerOfNumbers(N, updatedPower);
    temp = ((temp%M) * (temp%M)) % M;
    if (R % 2 == 0) {
        return temp;
    } else {
        return ((temp%M) * (N%M)) % M;
    }
}


//MARK: countTotalDigitsInNumber
int countDigits(int n)
{
    if(n/10==0){
        return 1;
    }
    return 1+countDigits(n/10);
}

int countDigits2(int n)
{
    if(n==0){
        return 0;
    }
    return 1+countDigits2(n/10);
}


//MARK: powerSet
void powerSetRecursionHelper(string s, string current, int i, vector<string>& myStrings) {
    // Base case: If we have considered all characters
    if (i == s.length()) {
        myStrings.push_back(current);  // Add the current subset to the list
        return;
    }
    // Recursive case: exclude the current character
    powerSetRecursionHelper(s, current, i + 1, myStrings);
    // Recursive case: include the current character
    current = current + s[i];
    powerSetRecursionHelper(s, current, i + 1, myStrings);
}

//Function to return the lexicographically sorted power-set of the string.
vector <string> powerSet(string s)
{
    vector<string> myStrings;
    powerSetRecursionHelper(s, "", 0, myStrings);  // Start recursion
    return myStrings;  // Return all generated subsets
}


//MARK: toh
long long toh(int n, int from, int to, int aux) {
    // Your code here
    return 0;
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


//MARK: isLucky
bool isLucky(int n) {
    // code here
    return false;
}


//MARK: possibleWords
vector<string> possibleWords(int a[], int N)
{
    return {};
}


//MARK: -------Main function-------
//int main()
//{
//    cout<<"arbaaz";
//    cout<<endl;
//    return 0;
//}
