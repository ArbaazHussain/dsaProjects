//
//  Recursion.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 19/11/25.
//
import Foundation
//MARK: -------Recursion---------
/*
The idea of Recursion is always to use the solution of the subproblems, and then use these solutions to solve the overall solutions.
=============================================================================
SUBARRAY vs SUBSEQUENCE vs COMBINATION (Subset)
 Example Array: [3, 1, 2]
 
 1. SUBARRAY (Contiguous)
    - Rule: Elements must sit directly next to each other in memory.
    - Skipping: NOT allowed.
    - Order: Strict left-to-right.
    - Valid:   [3, 1] or [1, 2]
    - Invalid: [3, 2] (Skipped the 1)
 
 2. SUBSEQUENCE (Non-contiguous)
    - Rule: Can skip elements, but must keep original left-to-right order.
    - Skipping: Allowed.
    - Order: Strict left-to-right.
    - Valid:   [3, 2] (Skipped the 1, but kept order)
    - Invalid: [1, 3] (Cannot go backward to get the 3)
 
 3. COMBINATION / SUBSET (Order Agnostic)
    - Rule: Pure membership. Location and sequence do not matter at all.
    - Skipping: Allowed.
    - Order: Ignored.
    - Valid: [3, 1] and [1, 3] are considered the exact same combination.
    - DSA Tip: Usually requires sorting the array first to avoid duplicates.
 
 In In code, they are practically the same.In theory, they are slightly different.
 -----------------------------------------------------------------------------
 QUICK COMPARISON TABLE
 -----------------------------------------------------------------------------
 TERM          | SKIPPING ALLOWED? | ORDER STRICT? | VALID   | INVALID
 -----------------------------------------------------------------------------
 Subarray      | No                | Yes           | [3, 1]  | [3, 2] (skipped)
 Subsequence   | Yes               | Yes           | [3, 2]  | [1, 3] (backward)
 Combination   | Yes               | No            | [1, 3]* | N/A (order ignored)
 
 *Note: For combinations, [1, 3] and [3, 1] are exactly the same thing.
 =============================================================================
*/
let M = 1_000_000_007
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
//MARK: -------GetStrongHold---------
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
        
        if res > intMax / 10 || (res == intMax / 10 && digit > 7) {
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
        if res > intMax / 10 || (res == intMax / 10 && digit > 7) {
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
    let evenIndex = (n+1)/2
    let oddIndex = n/2
    
    let total = (binaryExponentiationRecursive(a: 5, b: evenIndex) * binaryExponentiationRecursive(a: 4, b: oddIndex)) % M
    return total
}
//MARK: -------SubsequencesPattern---------
/*
 Core Problems:
 powerSet
 printingSubsequences
 countSubsequencesWhrSumIsK
 CombinationSum1
 CombinationSum2
 */
//MARK: Power Set
//https://www.youtube.com/watch?v=b7AYbpM5YrE&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=68
func powerSetIterative(_ s: String) -> [String] {
    let chars = Array(s)
    let n = chars.count
    var result = [String]()
    // 1 << n mathematically equals 2^n. (For n=3, 1<<3 == 8)
    let totalSubsets = 1 << n
    // Loop from 0 to 7
    for i in 0..<totalSubsets {
        var currentString = ""
        // Check every bit position (0 to n-1)
        for j in 0..<n {
            // Left shift 1 by j places to isolate the j-th bit (e.g., 001, 010, 100)
            // Bitwise AND (&) checks if that bit is turned ON in our current number 'i'
            if (i & (1 << j)) != 0 {
                currentString.append(chars[j])
            }
        }
        result.append(currentString)
    }
    return result
}
//T.C = O(N * 2^N)
//A.S = O(N)
func powerSetRecursive(_ s: String) -> [String] {
    let arrS = Array(s)
    var result = [String]()
    func recurse(_ index: Int, _ currentStr: String) {
        // BASE CASE: End of string, save it and stop
        if index >= arrS.count {
            result.append(currentStr)
            return
        }
        var pickedStr = currentStr
        
        // 1. "PICK" BRANCH
        pickedStr.append(arrS[index])
        recurse(index + 1, pickedStr)
        
        // 2. BACKTRACK (Undo the pick)
        pickedStr.removeLast()
        
        // 3. "DON'T PICK" BRANCH
        recurse(index + 1, pickedStr)
    }
    recurse(0, "")
    return result
}
//T.C = O(2^N)
//A.S = O(N)
//MARK: PrintingSubsequences
//https://www.youtube.com/watch?v=AxNNVECce8c&list=LL&index=3
func printingSubsequences(_ str: [String],
                          _ index: Int = 0,
                          _ res: [String] = []) {
    // BASE CASE
    if index >= str.count {
        print(res)
        return
    }
    var pickedRes = res
    // 1. "PICK" BRANCH
    pickedRes.append(str[index])
    printingSubsequences(str, index + 1, pickedRes)
    // 2. BACKTRACK (Undo the pick)
    pickedRes.removeLast()
    // 3. "DON'T PICK" BRANCH
    printingSubsequences(str, index + 1, pickedRes)
}
 /*
  T.C = O(2^N)
  A.S = O(N)
  =============================================================================
  THE CORE BACKTRACKING PATTERN: SUBSEQUENCES
  Input: arr = [1, 2, 3]
  
  THE 4-STEP RULE AT EVERY NODE:
  1. Pick it (Go Left)
  2. Hit Base Case or Recurse
  3. Backtrack (Undo the Pick - move back up)
  4. Don't Pick it (Go Right)
  =============================================================================

                                          [ ]                                 (idx = 0, eval '1')
                                       /       \
                            1. PICK 1 /         \ 4. DON'T PICK 1
                                     /           \
                      [1]                                     [ ]             (idx = 1, eval '2')
                   /       \                               /       \
        1. PICK 2 /         \ 4. DP 2           1. PICK 2 /         \ 4. DP 2
                 /           \                           /           \
            [1,2]                 [1]                 [2]                 [ ] (idx = 2, eval '3')
           /     \               /   \               /   \               /   \
       P3 /   DP3 \          P3 / DP3 \          P3 / DP3 \          P3 / DP3 \
         /         \           /       \           /       \           /       \
     [1,2,3]     [1,2]       [1,3]     [1]       [2,3]     [2]         [3]     [ ]
     (Base)      (Base)      (Base)   (Base)     (Base)   (Base)      (Base)  (Base)
  
                                                                              (idx = 3)
  =============================================================================
 */



//MARK: Count-SubsequencesWhr...
//https://youtu.be/eQCS_v3bw0Q?si=RXWaXKElg2hGYwqP
func printingSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) {
    func recurse(_ index: Int, _ resArr: [Int], _ resSum: Int) {
        // OPTIMIZATION 1: We hit the target early!
        if resSum == k {
            print(resArr)
            return
        }
        // OPTIMIZATION 2: We exceeded the target!
        if resSum > k {
            return
        }
        // BASE CASE: We ran out of numbers without hitting the target
        if index >= arr.count {
            return
        }
        var pickedResArr = resArr
        var pickedResSum = resSum
        
        // 1. "PICK" BRANCH
        pickedResArr.append(arr[index])
        pickedResSum += arr[index]
        
        // We only pass what actually changes! (index, array, sum)
        recurse(index + 1, pickedResArr, pickedResSum)
        
        // 2. BACKTRACK (Undo the pick)
        pickedResArr.removeLast()
        pickedResSum -= arr[index]
        
        // 3. "DON'T PICK" BRANCH
        recurse(index + 1, pickedResArr, pickedResSum)
    }
    // Kick off the recursion starting at index 0 with an empty array and 0 sum
    recurse(0, [], 0)
}
//T.C = O(2^N)
//A.S = O(N)
func printingJustOneSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) -> Bool {
    func recurse(_ index: Int, _ resDs: [Int], _ resSum: Int) -> Bool {
        // OPTIMIZATION 1: We hit the target early!
        if resSum == k {
            print(resDs)
            return true
        }
        // OPTIMIZATION 2: We exceeded the target!
        if resSum > k {
            return false
        }
        // BASE CASE: Read arr.count and k directly from the parent
        if index >= arr.count {
            return false
        }
        
        var pickedResDs = resDs
        var pickedResSum = resSum
        
        // 1. "PICK" BRANCH
        pickedResDs.append(arr[index])
        pickedResSum += arr[index]
        
        // Notice how much cleaner this call is now!
        if recurse(index + 1, pickedResDs, pickedResSum) {
            // If the left branch found the answer, STOP and tell the parent "true"!
            return true
        }
        
        // 2. BACKTRACK (Undo the pick)
        pickedResDs.removeLast()
        pickedResSum -= arr[index]
        
        // 3. "DON'T PICK" BRANCH
        if recurse(index + 1, pickedResDs, pickedResSum) {
            return true
        }
        return false
    }
    // Kick off the recursion and return its final boolean result to the main program
    return recurse(0, [], 0)
}
//T.C = O(2^N)
//A.S = O(N)
func countSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) -> Int {
    func recurse(_ index: Int, _ resSum: Int) -> Int {
        // OPTIMIZATION 1: We hit the target early!
        if resSum == k {
            return 1 // We found 1 valid subsequence!
        }
        // OPTIMIZATION 2: We exceeded the target!
        if resSum > k {
            return 0
        }
        // BASE CASE: Read arr.count and k directly from the parent
        if index >= arr.count {
            return 0     // We found 0 valid subsequences.
        }
        // 1. "PICK" BRANCH
        let finalResSum = resSum + arr[index]
        let leftCount = recurse(index + 1, finalResSum)
        
        // 2. "DON'T PICK" BRANCH
        let rightCount = recurse(index + 1, resSum)
        
        // TOTAL
        return leftCount + rightCount
    }
    // Kick off the recursion starting at index 0 with a 0 sum
    return recurse(0, 0)
}
//T.C = O(2^N)
//A.S = O(N)
//MARK: CombinationSum1
//https://youtu.be/QQ9Tn2i269I?si=4u76suXf8GKZiJvm
//https://www.youtube.com/watch?v=OyZFFqQtu98&list=PLgUwDviBIf0rGlzIn_7rsaR2FQ5e6ZOL9&index=11&t=18s
//https://leetcode.com/problems/combination-sum
func combinationSum1(_ candidates: [Int], _ target: Int) -> [[Int]] {
    func recurse(_ index: Int = 0,
                 _ resArr: [Int] = [],
                 _ resSum: Int = 0) -> [[Int]] {
        
        // 1. SUCCESS: We hit the exact target
        if resSum == target {
            return [resArr]
        }
        
        // 2. FAILURE: We went over the target, or ran out of numbers
        if resSum > target || index == candidates.count {
            return []
        }
        
        var pickedResArr = resArr
        var pickedResSum = resSum
        
        pickedResArr.append(candidates[index])
        pickedResSum += candidates[index]
        
        // 3. "PICK" BRANCH: Stay on the same index, pass the new array and sum
        let leftCom = recurse(index, pickedResArr, pickedResSum)
        
        pickedResArr.removeLast()
        pickedResSum -= candidates[index]
        
        // 4. "DON'T PICK" BRANCH: Move to next index
        let RightCom = recurse(index + 1, pickedResArr, pickedResSum)
        
        return leftCom + RightCom
    }
    return recurse(0, [], 0)
}
//T.C = O(2^T)  // Where T is (target / minimum_element_in_array) causing max tree depth
//A.S = O(T)  // Where T is the max depth of the recursive call stack


//MARK: CombinationSum2
//https://youtu.be/bfKwLi6jtDk?si=OwMe7D8MCo2a6IG6
//https://youtu.be/G1fRTGRxXU8?si=Qbe6n6r-ekDSAE26
//https://leetcode.com/problems/combination-sum-ii
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let arr = candidates.sorted()
    func recurse(_ index: Int, _ resArr: [Int], _ resSum: Int) -> [[Int]]{
        // OPTIMIZATION 1: We hit the target early! Stop this branch.
        if resSum == target {
            return [resArr]
        }
        // OPTIMIZATION 2: We exceeded the target. This branch is dead.
        if resSum > target {
            return []
        }
        // BASE CASE: We ran out of numbers without hitting the target.
        if index >= arr.count {
            return []
        }
        
        var pickedResArr = resArr
        var pickedResSum = resSum
        
        // 1. "PICK" BRANCH
        pickedResArr.append(arr[index])
        pickedResSum += arr[index]
        
        // We only pass what actually changes! (index, array, sum)
        let leftSeq = recurse(index + 1, pickedResArr, pickedResSum)
        
        // 2. BACKTRACK (Undo the pick)
        pickedResArr.removeLast()
        pickedResSum -= arr[index]
        
        // --- NEW DUPLICATE SKIP LOGIC ---
        // Keep moving nextIndex forward as long as:
        // 1. It is still within the array bounds
        // 2. The number at nextIndex is exactly the same as the number we just skipped!
        var nextIndex = index + 1
        while nextIndex < arr.count && arr[nextIndex] == arr[index] {
            nextIndex += 1
        }
        // 3. "DON'T PICK" BRANCH
        let rightSeq = recurse(nextIndex, pickedResArr, pickedResSum)
        return leftSeq+rightSeq
    }
    // Kick off the recursion starting at index 0 with an empty array and 0 sum
    return recurse(0, [], 0)
}
//this can be also done using SET and without sorting as a bruteforce solution.
//T.C = O(2^N)
//A.S = O(N)
//MARK: subsetSums1
//https://www.youtube.com/watch?v=rYkfBRtMJr8&list=PLgUwDviBIf0rGlzIn_7rsaR2FQ5e6ZOL9&index=13&t=10s
func subsetSums1(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    func recurse(_ index: Int, _ currentStr: Int){
        // BASE CASE: End of string, save it and stop
        if index >= nums.count{
            result.append(currentStr)
            return
        }
        var currentStr = currentStr
        
        // 1. "PICK" BRANCH
        currentStr += nums[index]
        recurse(index+1, currentStr)
        
        // 2. BACKTRACK (Undo the pick)
        currentStr -= nums[index]
        
        // 3. "DON'T PICK" BRANCH
        recurse(index+1, currentStr)
    }
    recurse(0, 0)
    return result.sorted()
}
//T.C = O(2^N)
//A.S = O(N)
//MARK: subsets2
//https://youtu.be/RIn3gOkbhQE?si=CsidffeeKgKf6qxx
//https://leetcode.com/problems/subsets-ii
func subsets2(_ nums: [Int]) -> [[Int]] {
    let arr = nums.sorted()
    func recurse(_ index: Int, _ resArr: [Int]) -> [[Int]]{
        // BASE CASE
        if index >= arr.count {
            return [resArr]
        }
        var pickedResArr = resArr
        // 1. "PICK" BRANCH
        pickedResArr.append(arr[index])
        
        // We only pass what actually changes!
        let leftSeq = recurse(index + 1, pickedResArr)
        
        // 2. BACKTRACK (Undo the pick)
        pickedResArr.removeLast()
        
        // --- NEW DUPLICATE SKIP LOGIC ---
        // Keep moving nextIndex forward as long as:
        // 1. It is still within the array bounds
        // 2. The number at nextIndex is exactly the same as the number we just skipped!
        var nextIndex = index + 1
        while nextIndex < arr.count && arr[nextIndex] == arr[index] {
            nextIndex += 1
        }
        // 3. "DON'T PICK" BRANCH
        let rightSeq = recurse(nextIndex, pickedResArr)
        return leftSeq+rightSeq
    }
    // Kick off the recursion starting at index 0 with an empty array and 0 sum
    return recurse(0, [])
}
//T.C = O(2^N)
//A.S = O(N)


//MARK: printAllPermutations
/*
 permutations(arrangements) of [1,2,3] (order matters)
 Total permutations = 3! = 6
 [1, 2, 3] [1, 3, 2] [2, 1, 3] [2, 3, 1] [3, 1, 2] [3, 2, 1]
 
 combinations of [1,2,3] (order does NOT matter)
 [] [1] [2] [3] [1, 2] [1, 3] [2, 3] [1, 2, 3]
 */
//https://www.youtube.com/watch?v=YK78FU5Ffjw&t=405s
//https://leetcode.com/problems/permutations/description/
func printAllPermutations(_ nums: [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    var ds: [Int] = []
    var freq: [Int] = Array(repeating: 0, count: nums.count)
    recurPermute(nums, &ds, &ans, &freq)
    return ans
}
private func recurPermute(_ nums: [Int],
                          _ ds: inout [Int],
                          _ ans: inout [[Int]],
                          _ freq: inout [Int]) {
    if ds.count == nums.count {
        ans.append(ds)
        return
    }
    for i in 0..<nums.count {
        if freq[i] == 0 {
            ds.append(nums[i])
            freq[i] = 1
            recurPermute(nums, &ds, &ans, &freq)
            freq[i] = 0
            ds.removeLast()
        }
    }
}
/*
 //Approach = recursion
 //T.C = O(n!*n)
 //A.S = O(n)
 =============================================================================
 RECURSION TREE: PERMUTATIONS (Visited Array / freq Pattern)
 Input: nums = [1, 2, 3]

 Rule: At EVERY node, a loop runs from i = 0 to 2.
 It only branches if freq[i] == 0 (meaning the number is unused).
 =============================================================================
 
                              [ ]
                           /   |   \
                         /     |     \
                 i=0(Pick 1) i=1(Pick 2) i=2(Pick 3)
                     /         |         \
                  [1]         [2]         [3]
                 /   \       /   \       /   \
               i=1   i=2   i=0   i=2   i=0   i=1
              (2)    (3)   (1)   (3)   (1)   (2)
              /       \     /       \     /       \
          [1,2]     [1,3] [2,1]   [2,3] [3,1]    [3,2]
            |         |     |       |     |        |
           i=2       i=1   i=2     i=0   i=1      i=0
           (3)       (2)   (3)     (1)   (2)      (1)
            |         |     |       |     |        |
        [1,2,3]   [1,3,2] [2,1,3] [2,3,1][3,1,2] [3,2,1]
         (Save)    (Save)  (Save)  (Save) (Save)  (Save)
 =============================================================================
*/
