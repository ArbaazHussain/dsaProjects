//
//  Mathmatics.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 25/10/25.
//

import Foundation

/*
 find last digit   = n%10 (remainder)
 remove last digit = n/10 (quotient)
 
 
 
 
 */





// MARK: - swapTwoNumbers
func swapTwoNumbers(_ a: inout Int, _ b: inout Int){
    a = a+b
    b = a-b
    a = a-b
    print(a)
    print(b)
}
//Approach =
//T.C = BigO(1)
//A.S = BigO(1)


// MARK: - modulo
//modulo to find factorial
func moduloDemo(_ n: Int) -> Int {
    let M = 1_000_000_007
    var fact = 1
    for i in 2...n {
        fact = (fact * i) % M
    }
    return fact
}
//T.C = BigO(n)
//A.S = BigO(1)
/*
 ( a + b) % m = ( ( a % m ) + ( b % m ) ) % m
 ( a * b) % m = ( ( a % m ) * ( b % m ) ) % m
 ( a – b) % m = ( ( a % m ) – ( b % m ) ) % m
 ( a / b) % m = ( ( a % m ) / ( b % m ) ) % m
 */


// MARK: - fibenacchi
func fibenacchi(_ n : Int) {
    var first = 0
    var second = 1
    print(first)
    print(second)
    for _ in 2...n{
        let sum = first+second
        print(sum, separator: " ")
        first = second
        second = sum
    }
}
//Approach =
//T.C = BigO(n)
//A.S = BigO(1)


// MARK: - getIntergerCount
func getIntergerCount(_ n : inout Int) -> Int{
    var count = 0
    while n != 0 {
        count += 1
        n /= 10
    }
    return count
}
//Approach =
//T.C = BigO(d) //(total digits of n)
//A.S = BigO(1)


// MARK: - ReverseInteger
//https://leetcode.com/problems/reverse-integer/description/
func ReverseInteger(_ x: Int) -> Int {
    var tempX = x
    var rev = 0
    while tempX != 0 {
        //fetch last digit
        let lastDigit = tempX % 10
        //remove last digit
        tempX /= 10
        
        rev = (rev*10) + lastDigit
        if(rev > Int32.max || rev < Int32.min){
            return 0
        }
    }
    return rev
}
//Approach =
//T.C = BigO(d) //(total digits of n)
//A.S = BigO(1)


// MARK: - checkForPalindromeInteger
//https://leetcode.com/problems/palindrome-number/description/
func checkForPalindromeInteger(_ x : Int) -> Bool{
    // Negative numbers  cannot be palindromes
    if x < 0 {
        return false
    }
    var tempN = x
    var rev = 0
    while tempN != 0 {
        //fetch last digit
        let lastDigit = tempN % 10
        rev = (rev*10) + lastDigit
        //remove last digit
        tempN /= 10
    }
    return x == rev
}
//Approach =
//T.C = BigO(d) //(total digits of n)
//A.S = BigO(1)


// MARK: - checkForPalindromeString
func checkForPalindromeString(_ s : String) -> Bool{
    var start = 0
    var end = s.count - 1
    while start < end {
        let firstChar = s[s.index(s.startIndex, offsetBy: start)]
        let lastChar = s[s.index(s.startIndex, offsetBy: end)]
        
        if firstChar != lastChar {
            return false
        }
        start += 1
        end -= 1
    }
    return true
}
//Approach = two pointer
//T.C = BigO(l/2) //(total letter of l)
//A.S = BigO(1)


// MARK: - factorial
func factorial(_ x : Int) -> Int{
    var fact = 1
    for i in stride(from: 2, through: x, by: 1) {
        fact *= i
    }
    return fact
}
//Approach = ls
//T.C = BigO(n)
//A.S = BigO(1)


// MARK: - trailingZeroInFactorial
//https://leetcode.com/problems/factorial-trailing-zeroes/description/
func trailingZeroInFactorial(_ x: Int) -> Int{
    var ans = 0
    var i = 5
    while i<x {
        ans += x/i
        i *= 5
    }
    return ans
}
//Approach =
//T.C = BigO(log base5 n)
//A.S = BigO(1)


func trailingZeroInFactorial1(_ x: Int) -> Int{
    var tempN = x
    var ans = 0
    while tempN/5 > 0 {
        ans += tempN/5
        tempN /= 5
    }
    return ans
}
//Approach =
//T.C = BigO(log base5 n)
//A.S = BigO(1)


//MARK: gcdNaive
func gcdNaive(_ a: Int, _ b: Int) -> Int{
    var min = min(a,b)
    while min>0 {
        if(a%min==0 && b%min==0){
            break
        }
        min -= 1
    }
    return min
}
//T.C = BigO min(a,b)
//A.S = BigO  1


//gcdEuclidIterative

//gcdEuclidRecursive

//MARK: lcmNaive
func lcmNaive(_ a: Int, _ b: Int) -> Int{
    if a == 0 || b == 0 {
        return -1
    }
    var lcm = max(a,b)
    // Keep increasing lcm until it is divisible by both numbers
    while true {
        if lcm % a == 0 && lcm % b == 0 {
            return lcm
        }
        lcm += 1
    }
}
//T.C = BigO ()
//A.S = BigO  1


//lcmEfficient


//MARK: isPrime
func isPrimeNaive(_ x: Int) -> Bool{
    if x<=1{
        return false
    }
    for _ in 2..<x {
        if x%2 == 0 {
            return false
        }
    }
    return true
}
//T.C = BigO n
//A.S = BigO 1


func isPrimeEfficient(_ x: Int) -> Bool{
    if x<=1{
        return false
    }
    for i in stride(from: 2, through: Int(Double(x).squareRoot()), by: 1) {
        if x%i == 0 {
            return false
        }
    }
    return true
}
//T.C = BigO sqrt(n)
//A.S = BigO 1
//Approach:
/*
 Divisors always apear in pair
 
 n = 30 -> (1,30),(2,15),(3,10),(5,6)
 if(x*y) is pair then (x*y)=n
 
 And if x<=y,
 x*x <=n
 x <= squareRoorOfn
 
 if there is a divisor y, which is >squareRootOfn then -> there must be a divisor x <= squareRootOfn
 */


//MARK: primeFactor
func primeFactorStNaiveOne(_ n: Int) {
    for i in 2...n {
        if n % i == 0 {
            if isPrimeEfficient(i) {
                print(i, terminator: " ")
            }
        }
    }
}
//Approach: factors which are prime
// T.C = BigO(n * sqrt(n))
// A.S = BigO(1)


func primeFactorStNaiveTwo(_ n: Int) {
    for i in stride(from: 1, through: Int(Double(n).squareRoot()), by: 1) {
        if n % i == 0 {
            if isPrimeEfficient(i) {
                print(i, terminator: " ")
            }
            if (n/i) != i {
                if isPrimeEfficient(n / i) {
                    print(n / i, terminator: " ")
                }
            }
        }
    }
}
//Approach: Divisors always appear in pair + Divisors which are prime
// T.C = BigO(sqrt(n) * (2 * sqrt(n)))
// A.S = BigO(1)


func primeFactorStNaiveThree(_ x: Int) {
    if(x<=1){
        return;
    }
    var tempX = x
    for i in stride(from: 2, through: tempX, by: 1) {
        if tempX%i==0{
            print(i, separator: " ")
            while tempX%i == 0 {
                //put print code here if need to print common factors as well.
                tempX /= i
            }
        }
    }
}
//T.C = BigO (n*logn)
//A.S = BigO 1
//Approach:
/*
1.Prime factorization school method
2.Smallest divisor(divisor except 1) of a number is always prime number -> Here we have not added for prime check for i as because - when we starts with i=2, we completely divide n by 2 and hence furter multiples of i cannot devide n
*.This solution will iterate less time for some numbers:(n=780 -- 13 iteration).But it will iterate n times for prime numbers,So this is not efficient.
 */


func primeFactorStEfficient(_ x: Int) {
    if(x<=1){
        return;
    }
    var tempX = x
    for i in stride(from: 2, through: Int(Double(tempX).squareRoot()), by: 1) {
        if tempX%i==0{
            print(i, separator: " ")
            while tempX%i == 0 {
                //put print code here if need to print common factors as well.
                tempX /= i
            }
        }
    }
    //if (n is primeNo) or (becomes prime no at last) then there will be no divisors <=sqrt(n). So, adding this check.
    if (tempX != 1) {
        print(tempX)
    }
}
//T.C = BigO (sqrtN*logn)
//A.S = BigO 1
//Approach:
/*
 1.Prime factorization school method
 2.Divisors appear in pair = 30: (1,30) (2,15) (3,10) (5,6)
 3.Smallest diviosor(divisor except 1) of a number is always prime number. -> Here we have not added for prime check for i as because - when we starts with i=2, we completely divide n by 2 and hence furter multiples of i cannot devide n.
 */


//MARK: allDivisorsOfNumber
func allDivisorsOfNumberEfficient(_ n: Int) {
    if n <= 0 {
        print("invalidInput")
        return
    }
    let limit = Int(Double(n).squareRoot())
    for i in stride(from: 1, through: limit, by: 1) {
        if n % i == 0 {
            print(i)
            if i != (n/i) {
                print(n/i)
            }
        }
    }
}
//T.C = BigO (sqrt(n))
//A.S = BigO (1)


func allDivisorsOfNumberInSortedEfficient(_ n: Int) {
    if n <= 0 {
        print("invalidInput")
        return
    }
    let limit = Int(Double(n).squareRoot())
    
    //from 1(inclusive) to sqrt(n)(exclusive)
    for i in stride(from: 1, to: limit, by: 1) {
        if n % i == 0 {
            print(i)
        }
    }
    //from sqrt(n)(inclusive) to 1(inclusive)
    for i in stride(from: limit, through: 1, by: -1) {
        if n % i == 0 {
            print(n / i)
        }
    }
}
//T.C = BigO (sqrt(n))
//A.S = BigO (1)


//MARK: seive-allPrimeNumbersLessThanGivenNumberNaive
//https://www.youtube.com/watch?v=T8PaMnb0GPo&t=688s
//Smallest diviosor(divisor except 1) of a number is always prime number.
func seive(_ n: Int) {
    if n < 2 {
        print("No primes")
        return
    }
    var isPrime = Array(repeating: true, count: n + 1)
    
    for i in stride(from: 2, through: n, by: 1) {
        if isPrime[i] {
            print(i, terminator: " ")
            for j in stride(from: i * 2, through: n, by: i) {
                isPrime[j] = false
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



//MARK: power


//MARK: digitsInFactorial
func digitsInFactorial(_ n: Int) -> Int{
    var logValue : Double = 0
    for i in 1...n {
        logValue += log10(Double(i))
    }
    return Int(floor(logValue + 1))
}
//T.C = BigO (n)
//A.S = BigO (1)
//Approach: floor(log(n!)) + 1
/*
 n!                = 1*2*3*4*5...*n
 log base 10 (a*b) = log(a)+log(b)
 log base 10 (n!)  = log(1)+log(2)+log(3)+log(4)+log(5)...+log(n)
 No of Digits     = floor(logBase10(n!)) + 1
 */


//MARK: hasExactlyThreeDivisors
func hasExactlyThreeDivisors(_ n: Int) -> Bool {
    if n < 4 { return false }  // smallest with 3 divisors is 4
    let root = Int(Double(n).squareRoot())
    
    // n must be a perfect square
    if root * root != n {
        return false
    }
    // root must be prime
    if isPrimeEfficient(root) {
        return true
    }else{
        return false
    }
}
//T.C = BigO (sqrt(n))
//A.S = BigO (1)
//Approach: A number has exactly three divisors if it is the square of a prime number.







/*
 Revision: 25Oct:
 checkForPalindromeString
 hcf efficient
 prime factors
 seive
 */


