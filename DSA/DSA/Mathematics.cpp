//
//  Mathematics.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 02/11/24.
//

#include <iostream>
#include <vector>
#include <iomanip>

using namespace std;
using std::cout;
using std::endl;



//MARK: ---------Maths----------



//MARK: CalculationOrderInDataType,Precision,overFlow
/*
 Precision Datatype => double>float>longLongInt>longInt>int>char
 Operator Precision => left to right
 overFlow           =>
 int           -> -10^9  to 10^9
 long int      -> -10^12 to 10^12
 long long int -> -10^18 to 10^18
 double        -> -10^23 to 10^23
 */
void overFlowAndPrecision(){
    cout<<7/2<<"\n";
    cout<<7/2.0<<"\n";

    int a = 7/2;
    cout<<a<<"\n";

    int b = 7/2.0;
    cout<<b<<"\n";

    double c = 7/2.0;
    cout<<c<<"\n";

    double d = 7/2;
    cout<<d<<"\n";

    double e = 7/2.0;
    cout<<e<<"\n";

    cout<<7/2*3<<"\n";
    cout<<3*7/2<<"\n";
    
    int f = 100000;
    int g = 100000;
    cout<<f*g<<"\n";
    
    long long int h = 100000;
    long long int i = 100000;
    cout<<h*i<<"\n";
    
    int j = 100000;
    int k = 100000;
    long long int l = j*k;
    cout<<l<<"\n";
    
    int m = 100000;
    int n = 100000;
    cout<<m*1LL*n<<"\n";
    
    //Precision error in double and float
    double o = 1e24;
    cout<<fixed<<setprecision(0)<<o<<"\n";
}


//MARK: Modulo
/*
 ( a + b) % M = ( ( a % M ) + ( b % M ) ) % M
 ( a * b) % M = ( ( a % M ) * ( b % M ) ) % M
 ( a – b) % M = ( ( a % M ) – ( b % M ) ) % M
 ( a / b ) % M = ( ( a % M ) / ( (b-inverse) % M ) ) % M
 */
int Modulo(int n){
    int M = pow(10,9)+7;
    int fact=1;
    for (int i=2; i<=n; i++){
        fact = (fact*i) % M;
    }
    return fact;
}


//MARK: FibenacchiIterativeNaive
int fibenacchiIterativeNaive(int n){
    int f[n+1];
    f[0] = 0;
    f[1] = 1;
    for (int i=2; i<=n; i++) {
        f[i] = f[i-1] + f[i-2];
    }
    return f[n];
}
//T.C = theta n
//A.S = theta n


//MARK: FibenacchiIterativeEfficient
int FibenacchiIterativeEfficent(int n){
    if(n==0 || n==1){
        return n;
    }
    int a = 0;
    int b = 1;
    int c = 1;
    for (int i=2; i<=n; i++) {
        c = a+b;
        a = b;
        b = c;
    }
    return c;
}
//T.C = theta n
//A.S = Big O 1


//MARK: FibenacchiRecursive
int fibenacchiRecursive(int n){
    if(n == 0 || n==1){
        return n;
    }
    return fibenacchiRecursive(n-1) + fibenacchiRecursive(n-2);
}
//T.C = theta n
//A.S = theta n


//MARK: getIntergerCount
int getIntergerCount(int n){
    int count = 0;
    while (n>0) {
        n = n/10;
        count++;
    }
    return count;
}
//T.C = theta d(digits of n)
//A.S = BigO  1


//MARK: reverseInteger
int reverseInteger(int n){
    int reverseNo = 0;
    while (n>0) {
        int lastDigit = n%10;
        reverseNo = (reverseNo*10) + lastDigit;
        n = n/10;
    }
    return reverseNo;
}
//T.C = theta d(digits of n)
//A.S = BigO  1


//MARK: checkForPalindromeInteger
bool checkForPalindromeInteger(int n){
    int rev = 0;
    int temp = n;
    
    while (temp!=0) {
        int lastDigit = n%10;
        rev = (rev*10) + lastDigit;
        temp = temp/10;
    }
    
    return n==rev ? true:false;
}
//T.C = theta d(digits of n)
//A.S = BigO  1


//MARK: checkForPalindromeString
bool checkForPalindromeString(string S)
{
    unsigned long int length = S.length();
    // Iterate over the range [0, N/2]
    for (int i = 0; i < length / 2; i++)
    {
        long int j = (length - i - 1);
        if (S[i] != S[j])
        {
            return false;
        }
    }
    return true;
}
//T.C = Big O(l)(letters of n)
//A.C = Big O(1)

//In Swift
//private func practice(_ n : String) -> Bool{
//    let length = n.count
//    if(length<=0){
//        return true
//    }
//    for i in 0...(length)/2{
//        let firstChar = n[n.index(n.startIndex, offsetBy: i)]
//        let lastChar  = n[n.index(n.startIndex, offsetBy: length-1-i)]
//        if(firstChar != lastChar){
//            return false
//        }
//
//    }
//    return true
//}


//MARK: factorialIterative
long long int factorialIterative(int n){
    long long int factorial = 1;
    for (int i=2; i<=n; i++) {
        factorial = factorial * i;
    }
    return factorial;
}
//T.C = theta n
//A.S = BigO  1

 
//MARK: trailingZeroInFactorial
int trailingZeroInFactorial(int n){
    int trailingZerocount = 0;
    for (int i=5; i<=n; i=i*5) {
        trailingZerocount = trailingZerocount + n/i;
    }
    return trailingZerocount;
}
//T.C = theta (Log n)  i.e log base5 n
//A.S = Big O 1


//MARK: trailingZeroInFactorial2
int trailingZeroInFactorial2(int n){
    int count = 0;
    while (n>0) {
        count = count + n/5;
        n = n/5;
    }
    return  count;
}
//T.C = theta (Log n)  i.e log base5 n
//A.S = Big O 1


//MARK: gcdNaive
int gcdNaive(int a, int b){
    int minNo = min(a,b);
    while(minNo>0) {
        if (a%minNo == 0 && b%minNo == 0){
            break;
        }
        minNo--;
    }
    return minNo;
}
//T.C = BigO min(a,b)
//A.S = BigO  1


//MARK: gcdEuclidIterative
//Youtube - luv
//Based on long division
int gcdEuclidIterative(int a,int b)
{
    int divident = a;
    int divsor = b;
    while (divident%divsor!=0) {
        int tempDivisor = divsor;
        divsor = divident%divsor;
        divident = tempDivisor;
    }
    return divsor;
}
//T.C = BigO log fi (min(a,b))
//A.S = BigO 1


//MARK: gcdEuclidRecursive
//Youtube - luv
//Based on long division
int gcdEuclidRecursive(int a, int b){
    //a-:divident , b-:divisor
    if (b==0){
        return a;
    }
    return gcdEuclidRecursive(b, a%b);
    //remainder->divisor
    //divisor->divident
}
//T.C = BigO log fi (min(a,b))
//A.S = BigO log fi (min(a,b))


//MARK: lcmNaive
int lcmNaive(int a, int b){
    if (a == 0 || b == 0){
        return -1;
    }
    
    int maxNo = max(a,b);
    while(true) {
        if (maxNo%a == 0 && maxNo%b == 0){
            return maxNo;
        }
        maxNo++;
    }
    return maxNo;
}
//T.C = BigO a*b - max(a,b)
//A.S = BigO  1


// a*b / gcd(a,b) = lcm(a,b)
//MARK: lcmEfficient
int lcmEfficient(int a, int b){
    return (a*b) / gcdEuclidRecursive(a, b);
}
//T.C = BigO log(min(a,b))
//A.S = BigO log(min(a,b))



//MARK: isPrimeNaive
bool isPrimeNaive(int n){
    if(n<=1){
        cout<<n<<" is neither a prime number nor a composite number."<<"\n";
        return false;
    }
    for (int i=2; i<n; i++) {
        if(n%i==0){
            return false;
        }
    }
    return true;
}
//T.C = BigO n
//A.S = BigO 1


//MARK: isPrimeEfficient
/*
 Divisors always apear in pair
 
 n = 30 -> (1,30),(2,15),(3,10),(5,6)
 if(x*y) is pair then (x*y)=n
 
 And if x<=y,
 x*x <=n
 x <= squareRoorOfn
 
 if there is a divisor y, which is >squareRootOfn then -> there must be a divisor x <= squareRootOfn
 */
bool isPrimeEfficient(int n){
    if(n<=1){
        cout<<n<<" is neither a prime number nor a composite number."<<"\n";
        return false;
    }
    //(i*i<=n) = (i<=squareRootOfN)
    for (int i=2; i*i<=n; i++) {
        if(n%i==0){
            return false;
        }
    }
    return true;
}
//T.C = BigO sqrt(n)
//A.S = BigO 1


//MARK: isPrimeEfficientMore
bool isPrimeEfficientMore(int n){
    if(n<=1){
        cout<<n<<" is neither a prime number nor a composite number."<<"\n";
        return false;
    }
    if (n==2 || n==3){
        return true;
    }
    if(n%2==0 || n%3==0){
        return false;
    }
    for (int i=5; i<=sqrt(n); i=i+6) {
        if(n%i==0 || n%(i+2)==0){
            return false;
        }
    }
    return true;
}
//T.C = BigO sqrt(n)
//A.S = BigO 1


//MARK: primeFactorStNaiveOne-UniqueElements
void primeFactorStNaiveOne(int n){
    for (int i = 2; i<=n; i++) {
        if(n%i==0){
            if(isPrimeEfficientMore(i)){
                cout<<i<<" ";
            }
        }
    }
}
//T.C = BigO (n*sqrt(n))
//A.S = BigO 1


//MARK: primeFactorStNaiveTwo-UniqueElements
// Divisors always apear in pair
void primeFactorStNaiveTwo(int n){
    for (int i = 1; i*i<=n; i++) {
        if(n%i==0){
            if(isPrimeEfficientMore(i)){
                cout<<i<<" ";
            }
            if(n/i != i){
                if(isPrimeEfficientMore(n/i)){
                    cout<<n/i<<" ";
                }
            }
        }
    }
}
//T.C = BigO (sqrt(n)*(2*sqrt(n)))
//A.S = BigO 1


//MARK: primeFactorStNaiveThree-UniqueElements
/*
 Prime factorization school method
1.Smallest diviosor(divisor except 1) of a number is always prime number -> Here we have not added for prime check for i as because - when we starts with i=2, we completely divide n by 2 and hence furter multiples of i cannot devide n
2.This solution will iterate less time for some numbers:(n=780 -- 13 iteration).But it will iterate n times for prime numbers,So this is not efficient.
 */
void primeFactorStNaiveThree(int n){
    if(n<=1){
        return;
    }
    for (int i = 2; i<=n; i++) {
        if (n%i==0) {
            cout<<i<<" ";
            while (n%i==0) {
                n = n/i;
            }
        }
    }
}
//T.C = BigO (n*logn)
//A.S = BigO 1


//MARK: primeFactorStEfficient-UniqueElements
/*
 Prime factorization school method
 1.Divisors appear in pair = 30: (1,30) (2,15) (3,10) (5,6)
 2.Smallest diviosor(divisor except 1) of a number is always prime number. -> Here we have not added for prime check for i as because - when we starts with i=2, we completely divide n by 2 and hence furter multiples of i cannot devide n.
 */
void primeFactorStEfficient(int n){
    if(n<=1){
        return;
    }
    for (int i = 2; i*i<=n; i++) {
        if (n%i==0) {
            cout<<i<<" ";
            while (n%i==0) {
                n = n/i;
            }
        }
    }
    //if (n is primeNo) or (becomes prime no at last) then there will be no divisors <=sqrt(n). So, adding this check.
    if (n!=1) {
        cout<<n<<" ";
    }
}
//T.C = BigO (sqrtN*logn)
//A.S = BigO 1


//MARK: primeFactorMyNaive-NonUniqueElements
void primeFactorMyNaive(int n){
    if(n<=1){
        cout<<n<<" is neither a prime number nor a composite number."<<"\n";
        return;
    }
    int divident = n;
    int i = 2;
    while(divident!=1) {
        if(isPrimeEfficientMore(i)){
            if(divident%i==0){
                cout<<i<<"\n";
                divident = divident/i;
                i=2;
            }else{
                i++;
            }
        }else{
            i++;
        }
    }
}
//T.C =
//A.S =


//MARK: primeFactorGFGNaive-printMultiples
void primeFactorGFGNaivePrintMultiples(int n){
    if(n<=1){
        return;
    }
    for (int i=2; i<=n; i++) { //theta n
        if(isPrimeEfficientMore(i)){ //BigO sqrt(n)
            int x=i;
            while (n%x==0) { //BigO log n
                cout<<i<<"\n";
                x = x*i;
            }
        }
    }
}
//T.C = BigO (n Logn)   i.e n*sqrt(n)*log(n)
//A.S = BigO 1


//MARK: primeFactorGfgEfficient-printMultiples
/*
 Prime factorization school method
 1.Divisors appear in pair = 30: (1,30) (2,15) (3,10) (5,6)
 2.Smallest diviosor(divisor except 1) of a number is always prime number. -> Here we have not added for prime check for i as because - when we starts with i=2, we completely divide n by 2 and hence furter multiples of i cannot devide n.
 3.A number can be written as multiplications of power of prime factors
 12 = 2^2 * 3
 450= 2 * 3^2 * 5^2
 13 = 13^1
 */
void primeFactorGfgEfficientPrintMultiples(int n){
    if(n<=1){
        return;
    }
    for (int i=2; i*i<=n; i++) {
        while (n%i==0) {
            cout<<i<<"\n";
            n = n/i;
        }
    }
    //if (n is primeNo) or (becomes prime no at last) then there will be no divisors <=sqrt(n). So, adding this check.
    if (n>1){
        cout<<n<<"\n";
    }
}
//T.C = BigO (sqrtN*logn)
//A.S = BigO 1


//MARK: allDivisorsOfNumberEfficient
void allDivisorsOfNumberEfficient(int n){
    if(n<=0){
        cout<<"invalidInput";
    }
    for (int i=1; i<=sqrt(n); i++) {
        if(n%i==0){
            cout<<i<<"\n";
            if(i!=(n/i)){
                cout<<n/i<<"\n";
            }
        }
    }
}
//T.C = theta sqrt(n)
//A.S = theta 1


//MARK: allDivisorsOfNumberInSortedEfficient
void allDivisorsOfNumberInSortedEfficient(int n){
    if(n<=0){
        cout<<"invalidInput";
    }
    
    //from 1(inclusive) to sqrt(n)(exclusive)
    for (int i=1; i<sqrt(n); i++) {
        if(n%i==0){
            cout<<i<<"\n";
        }
    }
    //from sqrt(n)(inclusive) to 1(inclusive)
    for (int i=sqrt(n); i>=1; i--) {
        if(n%i==0){
            cout<<n/i<<"\n";
        }
    }
}
//T.C = theta sqrt(n)
//A.S = theta 1


//MARK: allPrimeNumbersUptoGivenNumberNaive
void allPrimeNumbersUptoGivenNumberNaive(int n){
    for (int i=2; i<=n; i++) {
        if(isPrimeEfficientMore(i)){
            cout<<i<<"\n";
        }
    }
}
//T.C = BigO n*sqrt(n)
//A.S = theta 1


//MARK: seive-allPrimeNumbersLessThanGivenNumberNaive
//Smallest diviosor(divisor except 1) of a number is always prime number.
void seive(int n){
    vector<bool>isPrime(n+1,true);
    for (int i=2; i<=n; i++) {
        if(isPrime[i]){
            cout<<i<<" ";
            for (int j=i*2; j<=n; j=j+i){
                if(j%i==0){
                    isPrime[j] = false;
                }
            }
        }
    }
}
//A.S = Big O(n*log(log(n)))
//T.C = theta n
/*
 //T.C if we ignore  if(isPrime[i])
 -> n/2 + n/3 + n/4 + n/5 + n/n
 ->n(1/2 + 1/3 + 1/4 + 1/5 + 1/1)   // (1/2 + 1/3 + 1/4 + 1/5 + 1/1) = logn
 ->Big O(n(Logn))
 
 
 //T.C if we dont ignore  if(isPrime[i])
 -> n/2 + n/3 + n/5 + n/7 + n/n
 ->n(1/2 + 1/3 + 1/5 + 1/7 + 1/1)   // (1/2 + 1/3 + 1/5 + 1/7 + 1/1) = log(Log n)
 ->Big O(n*log(log(n)))
 */


//MARK: powerNaive
long long int powerNaive(int a, int n){
    long long int res = 1;
    for (int i=0; i<n; i++) {
        res = res*a;
    }
    return res;
}
//T.C = theta n
//A.S = theta 1


//MARK: powerRecursivee
//Youtube - luv
long long int powerRecursivee(int a, int b){
    if(b==0){
        return 1;
    }
    long long int recCall = powerRecursivee(a, b/2);
    if(b%2==0){
        return recCall * recCall;
    }else{
        return a * recCall * recCall;
    }
}
//T.C = theta log b
//A.S = theta log b


//MARK: powerIterative
//Youtube - luv
long long powerIterative(long long a,long long b){
    long long ans = 1;
    while (b) {
        if (b&1) {
            ans = ans * a;
        }
        a *= a;
        b >>= 1;
    }
    return ans;
}
//T.C =
//A.S =



//MARK: ------GFGProblems------



//MARK: absoluteValue
int absoluteValue(int I) {
    if(I>=0){
        return I;
    }else{
        return I*(-1);
    }
}


//MARK: cToF
//cToF = (C * 9.0) / 5.0 + 32
double cToF(int C)
{
    return (C * 9.0) / 5.0 + 32;
}


//MARK: quadraticEq
vector<int> quadraticEq(int a,int b, int c)
{
    vector<int> vec {};
    int d = (b*b)-(4*a*c);
    double sqrt_val = sqrt(abs(d));
    if(d>0){
        int x = double(-b+sqrt_val)/(2*a);
        int y = double(-b-sqrt_val)/(2*a);
        vec.clear();
        vec.insert(vec.begin(),x,y);
        return vec;
    }else if(d==0){
        int x = double(-b/(2*a));
        vec.clear();
        vec.insert(vec.begin(),x,x);
        return vec;
    }else{
        //int x = double(-b/(2*a));
        //int y = double(sqrt(-d)/(2*a));
        vec.clear();
        cout<<"Imaginary";
        vec.insert(vec.begin(),-1);
        return vec;
    }
}


//MARK: digitsInFactorial
/*
 n!                = 1*2*3*4*5...*n
 log base 10 (a*b) = log(a)+log(b)
 log base 10 (n!)  = log(1)+log(2)+log(3)+log(4)+log(5)...+log(n)
 No of Digits     = floor(log(n!)) + 1
 */
int digitsInFactorial(int N)
{
    long double logValue = 0;
    for (int i=1; i<=N; i++) {
        logValue += log10(i);
    }
    return floor(logValue)+1;
}


//MARK: exactly3Divisors
int exactly3DivisorMyNaive(int N)
{
    int numberOfThreeDivisors = 0;
    for (int i=1; i<=N; i++) {
        if(isPrimeEfficientMore(i)){
            if((i*i)<=N){
                numberOfThreeDivisors++;
                cout<<i*i<<" ";
            }
        }
    }
    cout<<endl;
    return numberOfThreeDivisors;
}


//MARK: exactly3DivisorsEfficient
int exactly3DivisorsEfficient(int n)
{
    int count = 0;
    for (int i = 2; i<= sqrt(n); i++) {
        if (isPrimeEfficientMore(i)) {
            if (i * i <= n) {
                count++;
            }
        }
    }
    return count;
}


//MARK: termOfGP
//termOfGP = a*(r^n-1) ... where a = first term and r = common ratio,n=term position
double termOfGP(int A,int B,int N)
{
    double r = (double)B/(double)A;
    return floor(A*(pow(r,N-1)));
}


//MARK: sumUnderModulo
/*
 ( a + b) % m = ( ( a % m ) + ( b % m ) ) % m
 ( a * b) % m = ( ( a % m ) * ( b % m ) ) % m
 ( a – b) % m = ( ( a % m ) – ( b % m ) ) % m
 ( a / b) % m = ( ( a % m ) / ( b % m ) ) % m
 */
long long sumUnderModulo(long long a,long long b)
{
    const unsigned int M = 1000000007;
    return ((a%M) + (b%M)) % M;
}


//MARK: multiplicationUnderModulo
int multiplicationUnderModulo(long long a,long long b)
{
    const unsigned int M = 1000000007;
    return  ((a%M) * (b%M) ) %M;
}


//MARK: modInverse
int modInverse(int a, int m)
{
    for (int i=1; i<m; i++) {
        if(((a%m)*(i%m)%m)==1){
            return i;
        }
    }
    return -1;
}




//MARK: ---------MainFunction----------



//int main()
//{
//    cout<<"Mathematics"<<endl;
//    cout<<endl;
//    return 0;
//}
