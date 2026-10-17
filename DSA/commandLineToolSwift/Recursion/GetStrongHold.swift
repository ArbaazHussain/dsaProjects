//
//  Recursion.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 19/11/25.
//
import Foundation

/*
 *Core Pattern*
 powerSetRecursive
 printingSubsequences
 printingSubsequencesWhrSumIsK
 */


//MARK: -------Recursion---------
/*
The idea of Recursion is always to use the solution of the subproblems, and then use these solutions to solve the overall solutions.
*/


//MARK: -------LearnBasicRcz---------



//MARK: NtoOne
func NtoOne(n: Int){
    if n<=0 {
        return
    }
    print(n)
    NtoOne(n: n-1)
}
//T.C = BigO n
//A.S = BigO n


//MARK: OnetoN
func OnetoNNonTailRecursive(n: Int) {
    if n<=0 {
        return
    }
    OnetoNNonTailRecursive(n: n-1)
    print(n)
}
//T.C = BigO n
//A.S = BigO n

func OnetoNWithTailRecursion(n: Int, k: Int = 1) {
    if n<=0 {
        return
    }
    print(k)
    OnetoNWithTailRecursion(n: n-1, k: k+1)
}
//T.C = BigO n
//A.S = BigO n


//MARK: sumOfDigits
func sumOfDigitsGFGRecursionNonTailRecursive(n: Int) -> Int{
    if n<=0 {
        return 0
    }
    let lastDigit = n%10
    let nwithoutLastDigit = n/10
    return lastDigit + sumOfDigitsGFGRecursionNonTailRecursive(n: nwithoutLastDigit)
}
//d = total digits of S
//R.R = T(d) = T(d-1) + C
//T.C = BigO (d)
//A.S = BigO (d)

func sumOfDigitsGFGRecursionTailRecursive(n: Int, k: Int = 0) -> Int{
    if n<=0 {
        return k
    }
    let lastDigit = n%10
    let nwithoutLastDigit = n/10
    return sumOfDigitsGFGRecursionTailRecursive(n: nwithoutLastDigit,
                                                k: k+lastDigit)
}
//d = total digits of S
//R.R = T(d) = T(d-1) + C
//T.C = BigO (d)
//A.S = BigO (d)


//MARK: sumOfNaturalNo
func sumOfNaturalNoNonTailRecursive(n: Int) -> Int {
    if n<=0{
        return 0
    }
    return n + sumOfNaturalNoNonTailRecursive(n: n-1)
}
//T.C = BigO n
//A.S = BigO n

func sumOfNaturalNoTailRecursive(n: Int, k: Int = 0) -> Int {
    if n<=0{
        return k
    }
    return sumOfNaturalNoTailRecursive(n: n-1, k: n+k)
}
//T.C = BigO n
//A.S = BigO n


//MARK: factorial
func factorialNonTailRecursive(n: Int) -> Int{
    if (n<=0){
        return 1;
    }
    return  n * factorialNonTailRecursive(n: n-1);
}
//T.C = BigO n
//A.S = BigO n

func factorialTailRecursive(n: Int, k: Int = 1) -> Int{
    if n<=1 {
        return k;
    }
    return factorialTailRecursive(n: n-1, k: k*n);
}
//T.C = BigO n
//A.S = BigO n


//MARK: reverseArray
func reverseArray(_ arr: inout [Int]) {
    reverseArrayRecursion(&arr, 0, arr.count - 1)
}

private func reverseArrayRecursion(_ arr: inout [Int], _ start: Int, _ end: Int) {
    if start >= end {
        return
    }
    arr.swapAt(start, end)
    reverseArrayRecursion(&arr, start + 1, end - 1)
}
//Approach:swap first and last el
//T.C = BigO n
//A.S = BigO n


//MARK: checkForPalindromeInterger
func checkForPalindromeIntergerRecursion(n: Int) -> Bool {
    if n < 0 {
        return false
    }
    return checkForPalindromeIntergerRecursion(n: n, rev: 0, tempN: n)
}

private func checkForPalindromeIntergerRecursion(n: Int, rev: Int, tempN: Int) -> Bool {
    if tempN==0 {
        return n == rev
    }
    let lastDigit = tempN%10
    let rev = (rev*10) + lastDigit
    return checkForPalindromeIntergerRecursion(n: n, rev: rev, tempN: tempN/10)
}
//d = total digits of n
//Approach = reverse d
//R.R = T(D) = T(D-1) + C
//T.C = BigO d
//A.S = BigO d


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
//d = no of digits
//Approach = check and remove first/last char
//T.C = BigO (d*d)
//A.S = BigO (d)

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
//d = total digits of n
//Approach = check first/last char
//T.C = BigO (d+d/2) = (d)
//A.S = BigO (1)


//MARK: Fibenacchi
//Input Requirement n
func fibenacchiMyRecursive(_ n: Int,
                           _ a: Int = 0,
                           _ b: Int = 1,
                           _ i: Int = 2) -> Int {
    if n < 0 {
        return -1
    }
    if n == 0 || n == 1 {
        return n
    }
    var a = a
    var b = b
    let c = a + b
    a = b
    b = c
    
    if n == i {
        return c
    }
    return fibenacchiMyRecursive(n, a, b, i + 1)
}

func fibenacchiCBRecursive(_ n: Int) -> Int {
    if n < 0 {
        return -1
    }
    if n == 0 || n == 1 {
        return n
    }
    let smallInput = fibenacchiCBRecursive(n-1)
    let largeInput = fibenacchiCBRecursive(n-2)
    return smallInput + largeInput
}


//MARK: ----GetStrongHold---



//MARK: StringtoInteger(atoi)
//https://youtu.be/ne_Ki_sdRSk?si=JpNtCYPMEAY0vOnq
//https://leetcode.com/problems/string-to-integer-atoi
func myAtoiIterative(_ s: String) -> Int {
    let sArray = Array(s)
    let n = sArray.count
    var index = 0
    var sign = 1
    var res = 0
    
    let intMax = Int(Int32.max) // 2147483647
    let intMin = Int(Int32.min) // -2147483648
    
    // STEP 1: Skip leading spaces
    while index < n && sArray[index] == " " {
        index += 1
    }
    
    // STEP 2: Check for a single sign
    if index < n && (sArray[index] == "+" || sArray[index] == "-") {
        sign = sArray[index] == "-" ? -1 : 1
        index += 1
    }
    
    // STEP 3: Process digits and clamp
    while index < n, let digit = sArray[index].wholeNumberValue {
        let resThreshold = intMax / 10
        if res > resThreshold || (res == resThreshold && digit > 7) {
            return sign == 1 ? intMax : intMin
        }
        
        res = (res * 10) + digit
        index += 1
    }
    
    // The sign integer elegantly handles the math here
    return res * sign
}

func myAtoiRecursive(_ s: String) -> Int {
    let chars = Array(s)
    let n = chars.count
    var index = 0
    var sign = 1
    
    // ==========================================
    // 1. ITERATIVE SETUP (Industry Standard)
    // ==========================================
    // Skip spaces
    while index < n && chars[index] == " " {
        index += 1
    }
    
    // Check sign
    if index < n && (chars[index] == "+" || chars[index] == "-") {
        sign = chars[index] == "-" ? -1 : 1
        index += 1
    }
    
    let intMax = Int(Int32.max)
    let intMin = Int(Int32.min)
    
    // ==========================================
    // 2. PURE RECURSIVE DIGIT PARSER
    // ==========================================
    func parseDigits(_ i: Int, _ res: Int) -> Int {
        // Base Case 1: Reached the end of the string
        if i == n { return res * sign }
        
        // Base Case 2: Hit a non-digit character (returns current accumulated result)
        guard let digit = chars[i].wholeNumberValue else {
            return res * sign
        }
        
        // Base Case 3: The exact clamp check
        let resThreshold = intMax / 10
        if res > resThreshold || (res == resThreshold && digit > 7) {
            return sign == 1 ? intMax : intMin
        }
        
        // Recursive Step: Do the math and move to the next index
        let newRes = (res * 10) + digit
        return parseDigits(i + 1, newRes)
    }
    
    // Start the recursion from wherever the setup left off
    return parseDigits(index, 0)
}


//MARK: binaryExponentiation || powerRecursive
//https://youtu.be/J63JPxqmyzg?si=dQBdQBrGUX0OEUp4
//https://leetcode.com/problems/powx-n?__cf_chl_rt_tk=dA3Vyz0CxAhPKLBccY3xpODFy9Li5xKptJHTrASJSYw-1786525687-1.0.1.1-dSuPGrRAgCbKICCcuk3W.uDdjc.sI3x4giUsdotrgYk
/*
 If n is even -> F(x,n) = F(x,n/2) * F(x,n/2)
 if n is odd  -> F(x,n) = F(x,n/2) * F(x,n/2) * x
 */
func binaryExponentiationRecursive(a: Int, b: Int) -> Int{
    if b==0{
        return 1
    }
    let recCall = binaryExponentiationRecursive(a: a, b: b/2)
    let squared = (recCall * recCall) % M
    
    if b%2 == 0 {
        return squared
    }else{
        return (a * squared) % M
    }
}


//MARK: CountGoodNumbers
//https://youtu.be/rYLRgdj0n4s?si=biEr-BmKkAkQNMMZ
//https://leetcode.com/problems/count-good-numbers
func countGoodNumbersIterative(_ n: Int) -> Int {
    let noOfEvenIndex = (n+1)/2
    let noOfOddIndex = n/2
    
    let total = (binaryExponentiationRecursive(a: 5, b: noOfEvenIndex) * binaryExponentiationRecursive(a: 4, b: noOfOddIndex)) % M
    return total
}


