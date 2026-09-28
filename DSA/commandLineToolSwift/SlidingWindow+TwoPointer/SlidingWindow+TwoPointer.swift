//
//  SlidingWindow+TwoPointer.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 24/01/26.
//

import Foundation


//MARK: Templates:
//https://youtu.be/9kdHxplyl5I?si=9EPnFDXTiNNLFA8u


//MARK: Pattern 1 - ConstantWindow

//Find maximum sum with consecutive k elements
func constantWindow(_ nums: [Int], k: Int) -> Int {
    var sum = Int.min
    let n = nums.count
    guard n >= k else { return sum }
    var currentSum = 0
    for i in 0..<k{
        currentSum += nums[i]
    }
    sum = max(currentSum, sum)
    var i = 1
    var j = k
    while j < n {
        currentSum -= nums[i-1]
        currentSum += nums[j]
        i += 1
        j += 1
        sum = max(currentSum, sum)
    }
    return sum
}
//Approach = sw + tp
// T.C - BigO(n)
// A.S - BigO(1)

/*
 Confusion: why no Sliding Window for these two
 longestSubarraywithsumK
 subArraySumEqualsK
 
 
 Note: Why Sliding Window Works in constantWindow but Not in longestSubarraywithsumK
 
 ✅ Fixed-size window — Maximum sum of K consecutive elements
 Window size: K (constant).
 Algorithm  : keep a running windowSum of the current K elements → when you slide, add new element, remove old element,Works for any numbers (positive, zero, negative).
 Reason     : you never make decisions based on whether the sum went up or down — the window is fixed, so negatives don't break anything.

 
 ❌ Variable-size window — Longest subarray with sum = K
 Window size : is variable.
 Algorithm   : Typical sliding-window logic assumes: expanding (right++) makes the sum increase, shrinking (left++) makes the sum decrease. That assumption holds only when all numbers are non-negative.
 Reason      :Sliding window fails because when the sum becomes too large, it shrinks the window — but removing a negative number can increase the sum, which breaks the logic.
 Use          : Prefix Sum + HashMap for correct O(N) solution with negatives.
 
 
 ✅ Fixed window: sum is just a measurement
 ❌ Variable window: sum is used for decisions
 */


//MARK: Pattern 2 -Longest Subarray/Substring with <contition>
/*
 //Return lenght of Subarray
 Brute  : Generate  subarrays
 Better : Sliding Window +
 Optimal: Sliding Window + condition
 */

func longestSubarrayWithSumLessThanEqualToKBetter(_ nums: [Int], k: Int) -> Int {
    var left = 0, right = 0
    var sum = 0
    var maxLen = 0
    
    while right < nums.count {
        sum += nums[right]
        // shrink until sum <= k
        while sum > k && left <= right {
            sum -= nums[left]
            left += 1
        }
        // now sum <= k, update answer
        let len = (right-left)+1
        maxLen = max(maxLen, len)
        right += 1
    }
    return maxLen
}
//Approach = sw + tp
// T.C - BigO(2n)
// A.S - BigO(1)


func longestSubarrayWithSumLessThanEqualToKOptimal(_ nums: [Int], k: Int) -> Int {
    var left = 0, right = 0
    var sum = 0
    var maxLen = 0
    
    while right < nums.count {
        sum += nums[right]
        if sum > k {
            sum -= nums[left]
            left += 1
        }
        // now sum <= k, update answer
        if sum <= k{
            let len = (right-left)+1
            maxLen = max(maxLen,len)
        }
        right += 1
    }
    return maxLen
}
//Approach = sw + tp
// T.C - BigO(n)
// A.S - BigO(1)



//MARK: Pattern 3 - No Of Subarrays with <contition>
/*
 //Solved using Pattern 2
 */


//MARK: Pattern 4 - shortest/minimum window with <contition>



//MARK: ---------------------------------------



//MARK: maximumPointsYouCanObtain
//Pattern - 1
//maximumPointsYouCanObtain from k cards
//https://youtu.be/pBWCOCS636U?si=y4Gh_Um_rEbCtd9Z
//https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards
func maximumPointsYouCanObtain(_ cardPoints: [Int], _ k: Int) -> Int {
    var sum = Int.min
    let n = cardPoints.count
    guard n >= k else { return sum }
    var currentSum = 0
    var i = 0
    var j = n-1
    while i < k{
        currentSum += cardPoints[i]
        i += 1
    }
    i -= 1
    sum = max(currentSum, sum)
    
    while i >= 0 {
        currentSum -= cardPoints[i]
        i -= 1
        currentSum += cardPoints[j]
        j -= 1
        sum = max(currentSum, sum)
    }
    return sum
}
//Approach = sw + tp
// T.C - BigO(2K)
// A.S - BigO(1)


//MARK: lengthOfLongestSubstring
//https://leetcode.com/problems/longest-substring-without-repeating-characters
func lengthOfLongestSubstringBrute(_ s: String) -> Int {
    let n = s.count
    let sArray = Array(s)
    var res = 0
    
    for i in 0..<n {
        var hashTable = [Character:Int]()
        var currentCount = 0
        for j in i..<n{
            let currentString = sArray[j]
            if let count = hashTable[currentString], count > 0 {
                break
            }
            currentCount += 1
            hashTable[currentString, default: 0] += 1
            res = max(currentCount, res)
        }
    }
    return res
}
//Approach = find all substring
// T.C - BigO(n^2)
// A.S - BigO(1)


func lengthOfLongestSubstringOptimal(_ s: String) -> Int {
    let n = s.count
    let sArray = Array(s)
    var maxlen = 0
    var left = 0
    var right = 0
    
    var hashTable = [Character:Int]()
    while right<n {
        let currentChar = sArray[right]
        if let seenIndex = hashTable[currentChar], seenIndex >= left  {
            left = seenIndex + 1
        } else {
            let len = (right-left) + 1
            maxlen = max(len, maxlen)
        }
        hashTable[currentChar] = right
        right += 1
    }
    return maxlen
}
//Approach = sw + tp
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: maxConsecutiveOnesIII
//https://leetcode.com/problems/max-consecutive-ones-iii
//Longest subarray with atmost k zero
func maxConsecutiveOnesIIIBrute(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var maxLen = 0
    for i in 0..<n{
        var zerosCount = 0
        for j in i..<n {
            let current = nums[j]
            if current == 0{
                zerosCount += 1
            }
            if zerosCount <= k{
                let len = (j-i) + 1
                maxLen = max(maxLen,len)
            }else{
                break
            }
        }
    }
    return maxLen
}
//Approach = find all subArrays
// T.C - BigO(n^2)
// A.S - BigO(1)


func maxConsecutiveOnesIIIBetter(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var maxLen = 0
    var left = 0
    var right = 0
    var zeroCount = 0
    while right < n {
        let current = nums[right]
        if current == 0{
            zeroCount += 1
        }
        // shrink until zeroCount > k
        while zeroCount > k {
            if nums[left] == 0 {
                zeroCount -= 1
            }
            left += 1
        }
        // now zeroCount <= k, update answer
        let len = (right-left) + 1
        maxLen = max(len,maxLen)
        right += 1
    }
    return maxLen
}
//Approach = sw + tp
// T.C - BigO(2n)
// A.S - BigO(1)


func maxConsecutiveOnesIIIOptimal(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var maxLen = 0
    var left = 0
    var right = 0
    var zeroCount = 0
    while right < n {
        let current = nums[right]
        if current == 0{
            zeroCount += 1
        }
        if zeroCount > k {
            if nums[left] == 0 {
                zeroCount -= 1
            }
            left += 1
        }else{
            // now zeroCount <= k, update answer
            let len = (right-left) + 1
            maxLen = max(len,maxLen)
        }
        right += 1
    }
    return maxLen
}
//Approach = sw + tp + leftShrinkOptimization
// T.C - BigO(2n)
// A.S - BigO(1)


//MARK: fruitsInBasket
//https://leetcode.com/problems/fruit-into-baskets
func fruitsInBasketBrute(_ fruits: [Int]) -> Int {
    let n = fruits.count
    var maxLen = 0
    for i in 0..<n {
        var uniqueElements = Set<Int>()
        for j in i..<n{
            let currentElement = fruits[j]
            uniqueElements.insert(currentElement)
            if uniqueElements.count <= 2 {
                let length = (j - i) + 1
                maxLen = max(length,maxLen)
            }else{
                break
            }
        }
    }
    return maxLen
}
//Approach = find all subArray
// T.C - BigO(n^2)
// A.S - BigO(3)


func fruitsInBasketBetter(_ fruits: [Int]) -> Int {
    let n = fruits.count
    var maxLen = 0
    var left = 0
    var right = 0
    var hashTable = [Int:Int]()
    while right < n {
        let currentElement = fruits[right]
        hashTable[currentElement , default: 0] += 1
        if hashTable.count > 2{
            while hashTable.count > 2 {
                let currentLeft = fruits[left]
                hashTable[currentLeft]? -= 1
                if hashTable[currentLeft] == 0 {
                    hashTable[currentLeft] = nil   // setting nil removes the key
                }
                left += 1
            }
        }else{
            let length = (right-left) + 1
            maxLen = max(maxLen, length)
        }
        right += 1
    }
    return maxLen
}
//Approach = sw + tp
// T.C - BigO(2n)
// A.S - BigO(3)


func fruitsInBasketOptimal(_ fruits: [Int]) -> Int {
    let n = fruits.count
    var maxLen = 0
    var left = 0
    var right = 0
    var hashTable = [Int:Int]()
    while right < n {
        let currentElement = fruits[right]
        hashTable[currentElement , default: 0] += 1
        
        if hashTable.count > 2 {
            let currentLeft = fruits[left]
            hashTable[currentLeft]? -= 1
            if hashTable[currentLeft] == 0 {
                hashTable[currentLeft] = nil   // setting nil removes the key
            }
            left += 1
        }else{
            let length = (right-left) + 1
            maxLen = max(maxLen, length)
            
        }
        right += 1
    }
    return maxLen
}
//Approach = sw + tp + leftShrinkOptimization
// T.C - BigO(n)
// A.S - BigO(3)


//MARK: longestRepeatingCharacter
//https://leetcode.com/problems/longest-repeating-character-replacement
//longest Substring Which Has Less Than Equal To k Elements To Be Changed
func longestRepeatingCharacterBrute(_ s: String, _ k: Int) -> Int {
    let n = s.count
    let sArray = Array(s)
    var maxLen = 0
    for i in 0..<n {
        var hashTable = [Character:Int]()
        var maxFreqInHashTable = 0
        for j in i..<n{
            let currentChar = sArray[j]
            hashTable[currentChar,default: 0] += 1
            maxFreqInHashTable = max(maxFreqInHashTable,hashTable[currentChar] ?? 0)
            
            let len = (j-i) + 1
            let toBeChange = len - maxFreqInHashTable
            if toBeChange <= k {
                maxLen = max(maxLen, len)
            }else{
                break
            }
        }
    }
    return maxLen
}
//Approach = find all subArray
// T.C - BigO(n^2)
// A.S - BigO(26)


func longestRepeatingCharacterOptimal(_ s: String, _ k: Int) -> Int {
    let n = s.count
    let sArray = Array(s)
    var left = 0
    var right = 0
    var maxLen = 0
    var hashTable = [Character:Int]()
    var maxFreqInHashTable = 0
    while right < n {
        let currentRightChar = sArray[right]
        hashTable[currentRightChar,default: 0] += 1
        maxFreqInHashTable = max(maxFreqInHashTable,hashTable[currentRightChar] ?? 0)
        
        let toBeChange = ((right-left) + 1) - maxFreqInHashTable //((right-left) + 1) = len
        
        //Shrink left window
        if toBeChange > k {
            let currentleftChar = sArray[left]
            hashTable[currentleftChar]? -= 1
            if hashTable[currentleftChar] == 0 {
                hashTable[currentleftChar] = nil   // setting nil removes the key
            }
            left += 1
        }
        let len = (right-left) + 1
        maxLen = max(maxLen, len)
    
        right += 1
    }
    return maxLen
}
//Here we have not added else block,bcz left += 1 does not increase the len and keep same as privious, same can be applied in maxConsecutiveOnesIIIBetter
//Approach = tp + sw + leftShrinkOptimization
// T.C - BigO(n)
// A.S - BigO(26)


//MARK: Binary Subarrays With Sum
//This is just to optimization of the extra space in subArraySumEqualsKOptimal question
//https://leetcode.com/problems/binary-subarrays-with-sum
func binarySubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    let res1 = numOfSubarraysWithLessThanEqualToSum(nums, goal)
    let res2 = numOfSubarraysWithLessThanEqualToSum(nums, goal-1)
    return res1 - res2
}

func numOfSubarraysWithLessThanEqualToSum(_ nums: [Int], _ goal: Int) -> Int {
    guard goal >= 0 else { return 0 }
    let n = nums.count
    var res = 0
    var left = 0
    var right = 0
    var sum = 0
    while right < n {
        let currentRightNum = nums[right]
        sum += currentRightNum
        
        while sum > goal {
            let currentLeftNum = nums[left]
            sum -= currentLeftNum
            left += 1
        }
        
        let subArrays = (right-left) + 1
        res += subArrays
        right += 1
    }
    return res
}
//Approach = numSubarraysWithLessThanEqbalToSum(sw + tp + leftShrinkOptimization)
// T.C - BigO(2*2n)
// A.S - BigO(1)


//MARK: Count Number of Nice Subarrays
//https://leetcode.com/problems/count-number-of-nice-subarrays
func numOfNiceSubarraysBrute(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var res = 0
    for i in 0..<n {
        var noOfOdds = 0
        for j in i..<n{
            let currentNum = nums[j]
            if (currentNum%2) != 0{
                noOfOdds += 1
            }
            if noOfOdds == k {
                res += 1
            }
        }
    }
    return res
}
//Approach = find all subArray
// T.C - BigO(n^2)
// A.S - BigO(1)


func numOfNiceSubarraysOptimal(_ nums: [Int], _ k: Int) -> Int {
    //Temporarily using new array, as we can manipulate numSubarraysWithLessThanEqbalToSum code a bit.
    var newArray = [Int]()
    for num in nums {
        if (num%2) == 0{
            newArray.append(0)
        }else{
            newArray.append(1)
        }
    }
    let res1 = numOfSubarraysWithLessThanEqualToSum(newArray, k)
    let res2 = numOfSubarraysWithLessThanEqualToSum(newArray, k-1)
    return res1 - res2
}
//Approach = numSubarraysWithLessThanEqualToSum
// T.C - BigO(2*2n)
// A.S - BigO(1)


func numOfNiceSubarraysOptimalMy(_ nums: [Int], _ k: Int) -> Int {
    let res1 = numOfSubarraysWithlessThanEqualKOddNumber(nums, k)
    let res2 = numOfSubarraysWithlessThanEqualKOddNumber(nums, k-1)
    return res1 - res2
}
func numOfSubarraysWithlessThanEqualKOddNumber(_ nums: [Int], _ k: Int) -> Int {
    guard k >= 0 else { return 0}
    let n = nums.count
    var left = 0
    var right = 0
    
    var res = 0
    var numberOfOdds = 0
    while right < n{
        let currentRightElement = nums[right]
        let isCurrentRightElementOdd = (currentRightElement%2) != 0
        if isCurrentRightElementOdd {
            numberOfOdds += 1
        }
        
        while numberOfOdds > k {
            let currentLeftElement = nums[left]
            let isCurrentLeftElementOdd = (currentLeftElement%2) != 0
            if isCurrentLeftElementOdd {
                numberOfOdds -= 1
            }
            left += 1
        }
        let len = (right-left) + 1
        res += len
        right += 1
    }
    return res
}
//Approach = numberOfSubarraysWithlessThanEqualKOddNumber(sw + tp + leftShrinkOptimization)
// T.C - BigO(2*2n)
// A.S - BigO(1)


//MARK: Number of Substrings Containing All Three Characters
//https://leetcode.com/problems/number-of-substrings-containing-all-three-characters
func numberOfSubstringsBrute(_ s: String) -> Int {
    let n = s.count
    let sArray = Array(s)
    var res = 0
    for i in 0..<n {
        var hashTable = [Character:Int]()
        for j in i..<n{
            let currentChar = sArray[j]
            hashTable[currentChar] = 1
            if containsAbc(hashTable) {
                res += 1
            }
        }
    }
    return res
}
//Approach = find all subArray
// T.C - BigO(n^2)
// A.S - BigO(3)

func numberOfSubstringsBetter(_ s: String) -> Int {
    let n = s.count
    let sArray : [Character] = Array(s)
    var res = 0
    for i in 0..<n {
        var hashTable = [Character:Int]()
        for j in i..<n{
            let currentChar = sArray[j]
            hashTable[currentChar] = 1
            if containsAbc(hashTable) {
                res += n-j
                break
            }
        }
    }
    return res
}
//Approach = find all subArray and break
// T.C - BigO(n^2)
// A.S - BigO(3)


func numberOfSubstringsOptimal(_ s: String) -> Int {
    let n = s.count
    let sArray = Array(s)
    var hashTable : [Character: Int] = ["a": -1, "b": -1, "c": -1]
    var res = 0
    
    for i in 0..<n {
        let currentChar = sArray[i]
        hashTable[currentChar] = i
        if hashTable["a"] != -1 && hashTable["b"] != -1 && hashTable["c"] != -1 {
            res += min(hashTable["a"] ?? 0,hashTable["b"] ?? 0,hashTable["c"] ?? 0) + 1
        }
    }
    return res
}
//Approach = with every character there is a substring that end (<-backward)
// T.C - BigO(n)
// A.S - BigO(3)


private func containsAbc(_ table: [Character: Int]) -> Bool {
    let aCount = table["a"] ?? 0
    let bCount = table["b"] ?? 0
    let cCount = table["c"] ?? 0
    return aCount + bCount + cCount == 3
}

/*
 Revision: 3 jul
 all
 */
