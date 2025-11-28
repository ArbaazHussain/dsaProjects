//
//  Recursion.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 19/11/25.
//

import Foundation


//MARK: -------Recursion---------
//The idea of Recursion is always to use the solution of the subproblems, and then use these solutions to solve the overall solutions.


//MARK: NtoOne
func NtoOne(n: Int){
    if n==0 {
        return
    }
    print(n)
    NtoOne(n: n-1)
}
//T.C = theta n
//A.S = theta n


//MARK: OnetoN
func OnetoNNonTailRecursive(n: Int) {
    if n==0 {
        return
    }
    OnetoNNonTailRecursive(n: n-1)
    print(n)
}
//T.C = theta n
//A.S = theta n


func OnetoNWithTailRecursion(n: Int, k: Int) { //pass k as 1
    if n==0 {
        return
    }
    print(k)
    OnetoNWithTailRecursion(n: n-1, k: k+1)
}
//T.C = theta n
//A.S = theta n


//MARK: factorial
func factorialNonTailRecursive(n: Int) -> Int{
    if (n==0){
        return 1;
    }
    return  n * factorialNonTailRecursive(n: n-1);
}
//T.C = theta n
//A.S = theta n



func factorialTailRecursive(n: Int, k: Int = 1) -> Int{ //pass k as 1
    if n==0 || n==1{
        return k;
    }
    return factorialTailRecursive(n: n-1, k: k*n);
}
//T.C = theta n
//A.S = theta n


//MARK: sumOfNaturalNo
func sumOfNaturalNoNonTailRecursive(n: Int) -> Int {
    if n==1 || n==0 {
        return n
    }
    return n + sumOfNaturalNoNonTailRecursive(n: n-1)
}
//T.C = theta n
//A.S = theta n


func sumOfNaturalNoTailRecursive(n: Int, k: Int = 0) -> Int { //pass k as 0
    if n==0 {
        return k
    }
    return sumOfNaturalNoTailRecursive(n: n-1, k: n+k)
}
//T.C = theta n
//A.S = theta n


//MARK: checkForPalindromeInterger
func checkForPalindromeIntergerRecursion(n: Int) -> Bool {
    return checkForPalindromeIntergerRecursion(n: n, rev: 0, tempN: n)
}
private func checkForPalindromeIntergerRecursion(n: Int, rev: Int, tempN: Int) -> Bool {
    if tempN==0 {
        return (n == rev) ? true : false
    }
    let lastDigit = tempN%10
    let rev = (rev*10) + lastDigit
    return checkForPalindromeIntergerRecursion(n: n, rev: rev, tempN: tempN/10)
}
//D = total digits of n
//R.R = T(D) = T(D-1) + C
//T.C = theta D
//A.S = theta D


//MARK: checkForPalindromeString
func checkForPalindromeStringRecursionNaive(_ s: String) -> Bool {
    var sTemp = s
    return checkForPalindromeStringRecursionNaive(s, &sTemp)
}
private func checkForPalindromeStringRecursionNaive(_ s: String, _ sTemp: inout String) -> Bool {
    // Base cases
    if sTemp.count <= 1 {
        return true
    }
    // Compare first and last characters
    let first = sTemp.first!
    let last = sTemp.last!
    if first != last {
        return false
    }
    // Remove first and last characters and recurse
    sTemp.removeFirst()
    sTemp.removeLast()
    return checkForPalindromeStringRecursionNaive(s, &sTemp)
}


func checkForPalindromeStringRecursionEfficient(_ s: String) -> Bool {
    let chars = Array(s)       // convert once
    return checkForPalindromeStringRecursionEfficient(chars, 0, chars.count - 1)
}
private func checkForPalindromeStringRecursionEfficient(_ chars: [Character], _ start: Int, _ end: Int) -> Bool {
    if start >= end {
        return true
    }
    if chars[start] != chars[end] {
        return false
    }
    return checkForPalindromeStringRecursionEfficient(chars, start + 1, end - 1)
}


//MARK: sumOfDigits
func sumOfDigitsGFGRecursionNonTailRecursive(n: Int) -> Int{
    if n<=0 {
        return 0
    }
    let lastDigit = n%10
    let nwithoutLastDigit = n/10
    return lastDigit + sumOfDigitsGFGRecursionNonTailRecursive(n: nwithoutLastDigit)
}
//N = total digits of S
//R.R = T(D) = T(D-1) + C
//T.C = theta D
//A.S = theta D


func sumOfDigitsGFGRecursionTailRecursive(n: Int, k: Int = 0) -> Int{
    if n<=0 {
        return k
    }
    let lastDigit = n%10
    let nwithoutLastDigit = n/10
    return sumOfDigitsGFGRecursionTailRecursive(n: nwithoutLastDigit,
                                                k: k+lastDigit)
}


//MARK: Fibenacchi
//Input Requirement n
func fibenacchiMyRecursive(_ n: Int,
                           _ a: Int = 0,
                           _ b: Int = 1,
                           _ c: Int = 0,
                           _ i: Int = 2) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    var a = a
    var b = b
    var c = c
    
    c = a + b
    a = b
    b = c
    
    if n == i {
        return c
    }
    return fibenacchiMyRecursive(n, a, b, c, i + 1)
}

func fibenacchiCBRecursive(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    let smallInput = fibenacchiCBRecursive(n-1)
    let largeInput = fibenacchiCBRecursive(n-2)
    return smallInput + largeInput
}

//MARK: binaryExponentiation || powerRecursive
//https://youtu.be/J63JPxqmyzg?si=dQBdQBrGUX0OEUp4
/*
 If n is even -> F(x,n) = F(x,n/2) * F(x,n/2)
 if n is odd  -> F(x,n) = F(x,n/2) * F(x,n/2) * x
 */
func binaryExponentiationRecursive(a: Int, b: Int) -> Int{
    if b==0{
        return 1
    }
    let recCall = binaryExponentiationRecursive(a: a, b: b/2)
    if b%2 == 0 {
        return recCall * recCall
    }else{
        return a * recCall * recCall
    }
}


/*
 Revision: 19Nov
 binaryExponentiation
 */
