//
//  SubsequencesPattern.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 04/10/26.
//

import Foundation


//MARK: -------SubsequencesPattern---------
/*
 Core Problems:
 
 powerSet
 printingSubsequences
 countSubsequencesWhrSumIsK
 CombinationSum1
 * CombinationSum2
 
 */
/*
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
 
  4. PERMUTATION (All Possible Arrangements)
    - Rule: Rearranging all items into every possible sequence.
    - Skipping: Not Allowed (result.count == arr.count)
    - Order: Ignored (Highly fluid) (every rearrangement creates a brand new permutation)
    - Valid: [1, 2, 3]
    - Invalid: [3, 1] (Illegal! Missing the element 2).
  
  In In code SUBSEQUENCE and COMBINATION/SUBSET they are practically the same.In theory, they are slightly different.[3, 1] and [1, 3] are considered the exact same combination.
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
//T.C = O(2^N * N)
//A.S = O(N)


//MARK: PrintingSubsequences
//https://youtu.be/p4bP_FIXGWw?si=l0iIw5hXpVbKVzpu
//https://www.youtube.com/watch?v=AxNNVECce8c&list=LL&index=3
func printingSubsequences1<T>(_ str: [T],
                          _ index: Int = 0,
                          _ res: [T] = []) {
    // BASE CASE
    if index >= str.count {
        print(res)
        return
    }
    var pickedRes = res
    // 1. "PICK" BRANCH
    pickedRes.append(str[index])
    printingSubsequences1(str, index + 1, pickedRes)
    // 2. BACKTRACK (Undo the pick)
    pickedRes.removeLast()
    // 3. "DON'T PICK" BRANCH
    printingSubsequences1(str, index + 1, pickedRes)
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
func printingSubsequences2(_ str: [String]) -> [[String]] {
    var result = [[String]]()
    func recurse(_ index: Int,
                 _ res: [String]){
        // BASE CASE
        if index >= str.count {
            result.append(res)
            return
        }
        var pickedRes = res
        // 1. "PICK" BRANCH
        pickedRes.append(str[index])
        recurse(index+1, pickedRes)
        // 2. BACKTRACK (Undo the pick)
        pickedRes.removeLast()
        // 3. "DON'T PICK" BRANCH
        recurse(index+1, pickedRes)
    }
    recurse(0, [])
    return result
}
// T.C = O(2^N)
// A.S = O(N)

func printingSubsequences3(_ str: [String],
                     _ index: Int = 0,
                     _ res: [String] = []) -> [[String]] {
    
    // BASE CASE: Return an array containing this specific subsequence
    if index >= str.count {
        return [res]
    }
    
    var pickedRes = res
    
    // 1. "PICK" BRANCH
    pickedRes.append(str[index])
    let pickedSubsequences = printingSubsequences3(str, index + 1, pickedRes)
    
    // 2. BACKTRACK (Undo the pick)
    pickedRes.removeLast()
    
    // 3. "DON'T PICK" BRANCH
    let notPickedSubsequences = printingSubsequences3(str, index + 1, pickedRes)
    
    // Combine the results from both branches and return them up the chain
    return pickedSubsequences + notPickedSubsequences
}
// T.C = O(2^N)
// A.S = O(N)
/*
 FINAL RETURNED ARRAY
               [ ["A","B","C"], ["A","B"], ["A","C"], ["A"], ["B","C"], ["B"], ["C"], [] ]
                                                   ▲
                                                   │ (Root adds Left + Right)
                                                   │
                             ┌─────────────────────┴─────────────────────┐
                             │                                           │
        [ ["A","B","C"], ["A","B"], ["A","C"], ["A"] ]      [ ["B","C"], ["B"], ["C"], [] ]
                             ▲                                           ▲
                             │ (Adds Left + Right)                       │ (Adds Left + Right)
                             │                                           │
               ┌─────────────┴─────────────┐               ┌─────────────┴─────────────┐
               │                           │               │                           │
  [ ["A","B","C"], ["A","B"] ]   [ ["A","C"], ["A"] ]  [ ["B","C"], ["B"] ]      [ ["C"], [] ]
               ▲                           ▲               ▲                           ▲
               │ (Adds L+R)                │ (Adds L+R)    │ (Adds L+R)                │ (Adds L+R)
        ┌──────┴──────┐             ┌──────┴──────┐ ┌──────┴──────┐             ┌──────┴──────┐
        │             │             │             │ │             │             │             │
 [["A","B","C"]] [["A","B"]]   [["A","C"]]     [["A"]]     [["B","C"]] [["B"]]       [["C"]]    [[]]
    (Base Case)   (Base Case)   (Base Case) (Base Case)    (Base Case)(Base Case)  (Base Case)(Base Case)
 */


//MARK: Count-SubsequencesWhr...
//https://youtu.be/QQ9Tn2i269I?si=4u76suXf8GKZiJvm
//https://youtu.be/eQCS_v3bw0Q?si=RXWaXKElg2hGYwqP
//https://leetcode.com/problems/combination-sum
func printingSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) {
    func recurse(_ index: Int, _ resArr: [Int], _ resSum: Int) {
        // OPTIMIZATION: Prune the tree (ONLY works if all numbers are positive!)
        if resSum > k {
            return
        }
        // BASE CASE: We reached the end of the array
        if index >= arr.count {
            // Check if the completed path hits our target
            if resSum == k {
                print(resArr)
            }
            return
        }
        var pickedResArr = resArr
        var pickedResSum = resSum
        
        // 1. "PICK" BRANCH
        pickedResArr.append(arr[index])
        pickedResSum += arr[index]
        
        recurse(index + 1, pickedResArr, pickedResSum)
        
        // 2. BACKTRACK (Undo the pick)
        pickedResArr.removeLast()
        pickedResSum -= arr[index]
        
        // 3. "DON'T PICK" BRANCH
        recurse(index + 1, pickedResArr, pickedResSum)
    }
    // Kick off the recursion
    recurse(0, [], 0)
}
// T.C = O(2^N)
// A.S = O(N)

func getSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) -> [[Int]] {
    func recurse(_ index: Int, _ resArr: [Int], _ resSum: Int) -> [[Int]] {
        // OPTIMIZATION: Prune the tree (ONLY works if all numbers are positive!)
        if resSum > k {
            return []
        }
        // BASE CASE: We reached the end of the array
        if index >= arr.count {
            // Check if the completed path hits our target
            if resSum == k {
                return [resArr]
            }
            return []
        }
        var pickedResArr = resArr
        var pickedResSum = resSum
        
        // 1. "PICK" BRANCH
        pickedResArr.append(arr[index])
        pickedResSum += arr[index]
        
        let res1 = recurse(index + 1, pickedResArr, pickedResSum)
        
        // 2. BACKTRACK (Undo the pick)
        pickedResArr.removeLast()
        pickedResSum -= arr[index]
        
        // 3. "DON'T PICK" BRANCH
        let res2 = recurse(index + 1, pickedResArr, pickedResSum)
        
        return res1 + res2
    }
    // Kick off the recursion
    let res = recurse(0, [], 0)
    return res
}
// T.C = O(2^N)
// A.S = O(N)

func printingJustOneSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) -> Bool {
    func recurse(_ index: Int, _ resDs: [Int], _ resSum: Int) -> Bool {
        
        // OPTIMIZATION: Prune the tree (ONLY works if all numbers are positive!)
        if resSum > k {
            return false
        }
        
        // BASE CASE: We reached the end of the array
        if index >= arr.count {
            if resSum == k {
                print(resDs)
                return true // Tell the parent we found it!
            }
            return false
        }
        
        var pickedResDs = resDs
        var pickedResSum = resSum
        
        // 1. "PICK" BRANCH
        pickedResDs.append(arr[index])
        pickedResSum += arr[index]
        
        if recurse(index + 1, pickedResDs, pickedResSum) {
            return true // Stop completely if left branch found it
        }
        
        // 2. BACKTRACK (Undo the pick)
        pickedResDs.removeLast()
        pickedResSum -= arr[index]
        
        // 3. "DON'T PICK" BRANCH
        if recurse(index + 1, pickedResDs, pickedResSum) {
            return true // Stop completely if right branch found it
        }
        
        return false // Neither branch found it
    }
    
    // Kick off the recursion
    return recurse(0, [], 0)
}
// T.C = O(2^N)
// A.S = O(N)

func countSubsequencesWhrSumIsK(_ arr: [Int], _ k: Int) -> Int {
    func recurse(_ index: Int, _ resSum: Int) -> Int {
        // OPTIMIZATION: Prune the tree (ONLY works if all numbers are positive!)
        if resSum > k {
            return 0
        }
        // BASE CASE: We reached the end of the array
        if index >= arr.count {
            if resSum == k {
                return 1 // We found 1 valid subsequence!
            }
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
// T.C = O(2^N)
// A.S = O(N)


//MARK: CombinationSum1
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
    func recurse(_ index: Int, _ currentSum: Int){
        // BASE CASE: End of string, save it and stop
        if index >= nums.count{
            result.append(currentSum)
            return
        }
        var currentStr = currentSum
        
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


//MARK: CombinationSum3
//https://leetcode.com/problems/combination-sum-iii
func combinationSum3(_ k: Int, _ n: Int) -> [[Int]]  {
    var arr = [Int]()
    for i in 1...9 {
        arr.append(i)
    }
    func recurse(_ index: Int,
                 _ currArr: [Int],
                 _ currSum: Int) -> [[Int]] {
        if currArr.count == k && currSum == n {
            return [currArr]
        }
        if currSum > n || currArr.count > k ||  index >= arr.count {
            return []
        }
                
        var pickedRes = currArr
        var pickedResSum = currSum
        // 1. "PICK" BRANCH
        pickedRes.append(arr[index])
        pickedResSum += arr[index]
        let res1 = recurse(index+1, pickedRes, pickedResSum)
        
        // 2. BACKTRACK (Undo the pick)
        pickedRes.removeLast()
        pickedResSum -= arr[index]
        let res2 = recurse(index+1, pickedRes, pickedResSum)
        
        return res1 + res2
    }
    return recurse(0, [], 0)
}


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
