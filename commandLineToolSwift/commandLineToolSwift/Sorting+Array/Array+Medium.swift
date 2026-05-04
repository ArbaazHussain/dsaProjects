//
//  Array+Medium.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 26/10/25.
//

import Foundation

/*
 Algorithms:
 
 * dutch national flag algorithm -:
[0...low-1]    -> 0
[low...mid-1]  -> 1
[mid...high]   ->{*}
[high+1...n-1] -> 2
 
 * Moore’s Voting Algorithm -:
 Majority means more than half, so it can’t be fully canceled. Different elements cancel each other, and the survivor is the candidate. Count again to verify if it’s truly the majority.
 
 * Kadane's Algorithm -:
 Kadane’s Algorithm finds the maximum sum of a contiguous subarray,s in O(n) time by tracking a running sum, updating the global maximum AND then resetting it when negative(as if -ve sum forward then submission will always reduce). If all numbers are negative, it returns the largest element.
 */

//MARK: twoSum
//VarietyOne = return true/false
//VarietyTwo = return true/false
//https://leetcode.com/problems/two-sum/submissions/1765713683/
func twoSumVarietyOneBrute(_ n: Int, _ arr: [Int], _ target: Int) -> Bool {
    for i in 0..<n {
        for j in (i+1)..<n {
            if arr[i] + arr[j] == target {
                return true
            }
        }
    }
    return false
}
//Approach = ls
// T.C - BigO(n^2)
// A.S - BigO(1)


func twoSumVarietyOneBetter(_ nums: inout [Int], _ target: Int) -> Bool {
    var i = 0;
    var j = nums.count-1;
    nums.sort()
    while i<j {
        let sum = nums[i] + nums[j]
        if(sum == target){
            return true
        }
        if(target>sum){
            i+=1;
        }else{
            j-=1;
        }
    }
    return false
}
//Approach = sort + Two Pointer
// T.C - BigO(nLogn + n)
// A.S - BigO(n)


//Returns index position if twoSum is present
//twoSumVarietyTwoOptimal is optimal for twoSumVarietyOne as well.
func twoSumVarietyTwoOptimal(_ nums: [Int], _ target: Int) -> [Int] {
    var hashTable = [Int:Int]()
    hashTable[nums[0]] = 0
    for i in 1..<nums.count {
        let numberToFind = target - nums[i]
        if let iIndex = hashTable[numberToFind] {
            return [iIndex,i]
        }
        hashTable[nums[i]] = i
    }
    return [-1,-1]
}
//Approach = ls + hashing
// T.C - BigO(n)
// A.S - BigO(n)


//MARK: sortArrayOfZeroOneTwo
//https://leetcode.com/problems/sort-colors/description/
func sortArrayOfZeroOneBrute(_ nums: inout [Int]) {
    nums.sort()
}
//Approach = sorting
// T.C - BigO(n Logn)
// A.S - BigO(1)


func sortArrayOfZeroOneTwoBetter(_ nums: inout [Int]) {
    var hashArray = Array(repeating: 0, count: 3)
    // Count occurrences of each number
    for num in nums {
        hashArray[num] += 1;
    }
    var index = 0
    for i in 0..<hashArray.count {
        let frequency = hashArray[i];
        for _ in 0..<frequency {
            nums[index] = i
            index += 1
        }
    }
    //Avoid this block for time complexity
    for num in nums {
        print(num,terminator: " ")
    }
}
//Approach = linear+hashing
// T.C - BigO(2n)
// A.S - BigO(1) //0,1,2 will constant space


//dutch national flag algorithm
func sortArrayOfZeroOneTwoptimal(_ nums: inout [Int]) {
    var low = 0
    var mid = 0
    var high = nums.count-1;
    
    while mid<=high {
        if(nums[mid]==0){
            nums.swapAt(low, mid)
            mid += 1;
            low += 1;
        }else if(nums[mid]==1){
            mid += 1;
        }else{
            nums.swapAt(high, mid)
            high -= 1;
        }
    }
    //Avoid this block for time complexity
    for num in nums {
        print(num,terminator: " ")
    }
}

/*
 //Approach = dutch national flag algorithm
[0...low-1]    -> 0
[low...mid-1]  -> 1
[mid...high]   ->{*}
[high+1...n-1] -> 2
 */
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: FindTheMajorityElement
//https://leetcode.com/problems/majority-element/description/
func majorityElementBrute(_ nums: [Int]) -> Int {
    let n = nums.count
    for i in 0..<n {
        var cnt = 0
        for j in 0..<n {
            if nums[j] == nums[i] {
                cnt += 1
            }
        }
        if cnt>(n/2) {
            return nums[i]
        }
    }
    return -1
}
//Approach = linear search
// T.C - BigO(n^2)
// A.S - BigO(1)


func majorityElementBetter(_ nums: [Int]) -> Int {
    let n = nums.count
    var freq: [Int: Int] = [:]
    // Count occurrences
    for num in nums {
        freq[num, default: 0] += 1
    }
    // Find majority element
    for (key, value) in freq {
        if value > (n/2) {
            return key
        }
    }
    return -1
}
//Approach = linearSearch + hashing
// T.C - BigO(2n)
// A.S - BigO(n)


//Moore’s Voting Algorithm
func majorityElementOptimal(_ nums: [Int]) -> Int {
    var el : Int?
    var cnt = 0
    for num in nums {
        if(cnt==0){
            el = num
            cnt += 1
        }else if(num != el) {
            cnt -= 1
        }else{
            cnt += 1
        }
    }
    //assuming  majorityElement always appear in array else return -> count > 0 ? (lastElement ?? -1) : -1
    return el ?? -1
}
//Approach = Moore’s Voting Algorithm -> Majority means more than half. Different elements cancel each other, so Majority can’t be fully canceled and the survivor is the candidate.
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: maximumSubarraySum
//https://leetcode.com/problems/maximum-subarray/description/
func maximumSubarraySumBrute(_ nums: [Int]) -> Int {
    var maxVal = Int.min
    for i in 0..<nums.count {
        var sum = 0;
        for j in i..<nums.count{
            sum += nums[j]
            maxVal = max(sum, maxVal)
        }
    }
    return maxVal
}
//Approach = linearSearch
// T.C - BigO(n^2)
// A.S - BigO(1)


//Kadane's Algorithm
func maximumSubarraySumOptimal(_ nums: [Int]) -> Int {
    var maxi = Int.min
    var sum = 0
    for num in nums {
        sum += num
        maxi = max(sum,maxi)
        if(sum<0){
            sum = 0
        }
    }
    return maxi
}
//Approach = Kadane's Algorithm - Kadane’s Algorithm finds the maximum sum of a contiguous subarray,s in O(n) time by tracking a running sum and updating the global maximum + then resetting sum when negative. If all numbers are negative, it returns the largest element.
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: stockBuyAndSell
//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
func stockBrute(_ prices: [Int]) -> Int {
    var maxProfit = 0
    for i in 0..<prices.count {
        for j in i+1..<prices.count {
            let profit = prices[j]-prices[i]
            maxProfit = max(profit, maxProfit)
        }
    }
    return maxProfit
}
//Approach = linearSearch
// T.C - BigO(n^2)
// A.S - BigO(1)


func stockOptimal(_ prices: [Int]) -> Int {
    var minCp = prices[0]
    var profit = 0
    for i in 1..<prices.count{
        let currentSp = prices[i]
        let currentProfit = currentSp - minCp
        profit = max(currentProfit,profit)
        minCp = min(currentSp,minCp)
    }
    return profit
}
//Approach = linearSearch + remember min(costPrice) for every selling price.
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: rearrangeArrayElementsBySign
//https://leetcode.com/problems/rearrange-array-elements-by-sign/description/
func rearrangeArrayElementsBySignBrute(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var pos: [Int] = []
    var neg: [Int] = []
    var ansArray = Array(repeating: 0, count: nums.count)
    // Separate positives and negatives
    for i in 0..<n {
        if nums[i] > 0 {
            pos.append(nums[i])
        } else {
            neg.append(nums[i])
        }
    }
    // Place positives at even indices, negatives at odd indices
    var posIndex = 0
    var negIndex = 1
    for i in 0..<(n/2) {
        ansArray[posIndex] = pos[i]
        ansArray[negIndex] = neg[i]
        posIndex += 2
        negIndex += 2
    }
    return ansArray
}
//Approach = separate +ve and -ve elements -> Place positives at even indices, negatives at odd indices
// T.C - BigO(2n)
// A.S - BigO(2n)


func rearrangeArrayElementsBySignOptimal(_ nums: [Int]) -> [Int] {
    var ansArray = Array(repeating: 0, count: nums.count)
    var posIndex = 0
    var negIndex = 1
    for num in nums {
        if(num>0){
            ansArray[posIndex] = num
            posIndex += 2
        }else{
            ansArray[negIndex] = num
            negIndex += 2
        }
    }
    return ansArray
}
//Approach = Place positives at even indices, negatives at odd indices
// T.C - BigO(n)
// A.S - BigO(n)


//MARK: printAllPermutations
/*
 permutations(arrangements) of [1,2,3] (order matters)
 Total permutations = 3! = 6
 [1, 2, 3] [1, 3, 2] [2, 1, 3] [2, 3, 1] [3, 1, 2] [3, 2, 1]
 
 combinations of [1,2,3] (order does NOT matter)
 [] [1] [2] [3] [1, 2] [1, 3] [2, 3] [1, 2, 3]
 */
//recursiveSolution
//https://www.youtube.com/watch?v=YK78FU5Ffjw&t=405s
//https://leetcode.com/problems/permutations/description/
func printAllPermutations(_ nums: [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    var ds: [Int] = []
    var freq: [Int] = Array(repeating: 0, count: nums.count)
    recurPermute(nums, &ds, &ans, &freq)
    return ans
}
private func recurPermute(_ nums: [Int], _ ds: inout [Int], _ ans: inout [[Int]], _ freq: inout [Int]) {
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
//Approach = recursion
//T.C = O(n!*n)
//A.S = O(n)
   

//MARK: nextPermutation
//https://leetcode.com/problems/next-permutation/description/
//e.g: 2154300 -> 2300145
//This will not work for large nums as n! increases exponentially.
func nextPermutationBrute(_ nums: inout [Int]) {
    let tempNums = nums
    guard nums.count > 1 else { return }

    //Get all possible unique permutations
    var allPerm = printAllPermutations(nums)
    allPerm.sort { $0.lexicographicallyPrecedes($1) }
    
    //find the next permutation , if not present then return first
    for i in 0..<allPerm.count {
        if(allPerm[i] == tempNums && i<allPerm.count-1){
            for j in i+1..<allPerm.count  {
                if(allPerm[i] != allPerm[j]){
                    nums = allPerm[j]
                    return
                }
            }
        }
    }
    nums = allPerm.first ?? nums
}
//Approach = mentioned in code
//T.C = O( (n!*n) + n)
//A.S = O(n)


func nextPermutationOptimal(_ nums: inout [Int]) {
    let n = nums.count
    guard n > 1 else { return }
    var dip = -1
    //find dip
    for i in (0...n-2).reversed() {
        if(nums[i]<nums[i+1]){
            dip = i
            break
        }
    }
    //if dip not found,reverse array and return
    if dip == -1 {
        reverseArrayFromIndex(&nums, 0, n-1)
        return
    }
    //find just greater number than dip ans swap dip with it.
    for i in (dip+1..<n).reversed() {
        if nums[i] > nums[dip] {
            nums.swapAt(i, dip)
            break
        }
    }
    //reverse array after dip index
    reverseArrayFromIndex(&nums, dip+1, n-1)
}
//Approach = find dip from back + LS(swap) + reverseArray
//T.C = O(3n)
//A.S = O(1)


//MARK: leadersInArray
//https://www.geeksforgeeks.org/problems/leaders-in-an-array-1587115620/1
func leadersInArrayBrute(_ nums: inout [Int]) -> [Int] {
    return [Int]()
}
//Approach = lS
//T.C = O(n^2)
//A.S = O(1)


func leadersInArrayOptimal(_ nums: inout [Int]) -> [Int] {
    let n = nums.count
    var leaders = [Int]()
    if(n==1){
        return leaders
    }
    var rightMax = Int.min
    for i in (0...n-1).reversed() {
        let current = nums[i]
        if(current>=rightMax){
            leaders.append(current)
            rightMax = current
        }
    }
    return leaders.reversed()
}
//Approach = lS
//T.C = O(2n)
//A.S = O(1)


//MARK: longestConsecutiveSequence
//https://leetcode.com/problems/longest-consecutive-sequence/description/
func longestConsecutiveBrute(_ nums: [Int]) -> Int {
    let n = nums.count
    var longest = 1
    
    for i in 0..<n {
        var current = nums[i]
        var cnt = 1
        while linearSearch(nums, current + 1) == true {
            current += 1
            cnt += 1
        }
        longest = max(longest, cnt)
    }
    return longest
}
//Approach = lS
//T.C = O(n^n)
//A.S = O(1)


func longestConsecutiveBetterStv(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0}
    var longest = 1
    var lastSmaller = Int.min
    var currentCount = 0

    let sortedArray = nums.sorted()
    for i in 0..<sortedArray.count {
        let currentEl = sortedArray[i]
        if(currentEl-1 == lastSmaller){
            currentCount += 1
            lastSmaller = currentEl
        }else if(currentEl == lastSmaller){
           
        }else if(currentEl != lastSmaller){
            currentCount = 1
            lastSmaller = currentEl
        }
        longest = max(currentCount,longest)
    }
    return longest
}
//Approach = sort + lS
//T.C = O(nlogn + n)
//A.S = O(n)


func longestConsecutiveOptimal(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0}
    var longest = 0
    //O(n)
    let uniqueElements = Set(nums)
    //O(2n)
    for currentElement in uniqueElements {
        //check for 1st element of Consecutive sequence
        if !uniqueElements.contains(currentElement-1){
            var currentCount = 1
            var nextElement = currentElement+1
            while uniqueElements.contains(nextElement) {
                currentCount += 1
                nextElement += 1
            }
            longest = max(currentCount,longest)
        }
    }
    return longest
}
//Approach = set + lS
//T.C = O(n + 2n)
//A.S = O(n)


//MARK: setMatrixZeroes
func setZeroesBrute(_ matrix: inout [[Int]]) {
    var rowArray = Array(repeating: 0, count: matrix.count)
    var colArray = Array(repeating: 0, count: matrix[0].count)
    //O(n*m)
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let current = matrix[i][j]
            if(current==0){
                rowArray[i] = 1
                colArray[j] = 1
            }
        }
    }
    //O(n*m)
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if(rowArray[i]==1 || colArray[j]==1){
                matrix[i][j] = 0
            }
        }
    }
}
//Approach = lS using extra row/col
//T.C = O( 2(n*m) ) -> close to n^2
//A.S = O(n+m)


//for now do only setZeroesBetter as its easy
func setZeroesOptimal(_ matrix: inout [[Int]]) {
    var colZero = 1
    // step 1: Traverse the matrix and mark 1st row & col accordingly:
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let current = matrix[i][j]
            if(current==0){
                //row
                matrix[i][0] = 0
                //col
                if(j==0){
                    colZero = 0
                }else{
                    matrix[0][j] = 0
                }
            }
        }
    }
    // Step 2: Mark matrix other then first row/coloumn to 0:
    for i in stride(from: matrix.count - 1, through: 1, by: -1) {
        for j in stride(from: matrix[i].count - 1, through: 1, by: -1) {
            if matrix[i][0] == 0 || matrix[0][j] == 0 {
                matrix[i][j] = 0
            }
        }
    }
    //step 3: Finally mark the 1st col & then 1st row:
    if matrix[0][0] == 0 {
        for i in 1..<matrix[0].count {
            matrix[0][i] = 0
        }
    }
    if colZero == 0 {
        for i in (0..<matrix.count) {
            matrix[i][0] = 0
        }
    }
}
//Approach = lS using first row/col
//T.C = O(2(n*m)) -> close to n^2
//A.S = O(1)


//MARK: rotateImage
//prefer rotateImageOptimal as its is easy and rotateImageBrute is bit hard to grab
//https://leetcode.com/problems/rotate-image/description/
func rotateImageBrute(_ matrix: inout [[Int]]){
    let n = matrix.count
    var rotatedArray = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            rotatedArray[j][n - i - 1] = matrix[i][j]
        }
    }
    for i in 0..<n {
        matrix[i] = rotatedArray[i]
    }
}
//Approach = transpose array using extra space
//T.C = O(n^2 + n)
//A.S = O(n^2)


func rotateImageOptimal(_ matrix: inout [[Int]]) {
    let n = matrix.count
    //(n/2) //transpose the array (col->row)
    for i in 0..<n-1{
        for j in i+1..<n {
            let temp = matrix[j][i]
            matrix[j][i] = matrix[i][j]
            matrix[i][j] = temp
        }
    }
    //(n*(n/2))) //reverse every row
    for i in 0..<matrix.count {
        reverseArrayFromIndex(&matrix[i], 0, matrix[i].count-1)
    }
}
//Approach = transpose array(col->row)  -> reverse every row
//T.C = O((n^2) + n*(n/2))
//A.S = O(1)


//MARK: spiralMatrix
//https://leetcode.com/problems/spiral-matrix/description/
func spiralMatrix(_ matrix: [[Int]]) -> [Int]  {
    let n = matrix.count
    let row = matrix.count
    let col = matrix[0].count
    var result = [Int]()
    
    var left = 0
    var right = col - 1
    var bottom = row - 1
    var top = 0;
    
    while top <= bottom && left <= right {
        //right
        if top<=bottom {
            for i in stride(from: left, through: right, by: 1) {
                result.append(matrix[top][i])
            }
            top += 1
        }
        //bottom
        if(left<=right) {
            for i in stride(from: top, through: bottom, by: 1) {
                result.append(matrix[i][right])
            }
            right -= 1
        }
        //left
        if top<=bottom {
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
        }
        //top
        if left<=right {
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            left += 1
        }
    }
    return result
}
//Approach = right->bottom->left->top
//T.C = O(n*m)
//A.S = O(n*m)


//MARK: subArraySumEqualsK
//https://leetcode.com/problems/subarray-sum-equals-k/description/
//https://www.youtube.com/watch?v=xvNwoz-ufXA&t=986s
func subArraySumEqualsKBrute(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var cnt = 0
    for i in 0..<n {
        for j in i..<n {
            var sum = 0
            for K in i...j {
                sum += nums[K]
            }
            if sum == k {
                cnt += 1
            }
        }
    }
    return cnt
}
//Approach = ls
//T.C = O(n^3)
//A.S = O(1)


func subArraySumEqualsKBetter(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var cnt = 0
    for i in 0..<n { // starting index i
        var sum = 0
        for j in i..<n { // ending index j
            // sum of [i..j-1] + arr[j]
            sum += nums[j]
            // Increase the count if sum == k:
            if sum == k {
                cnt += 1
            }
        }
    }
    return cnt
}
//Approach = ls
//T.C = O(n^2)
//A.S = O(1)


func subArraySumEqualsKOptimal(_ nums: [Int], _ k: Int) -> Int {
    var preSum = 0
    var cnt = 0
    var hash = [Int:Int]()
    for i in 0..<nums.count {
        let currentEl = nums[i]
        preSum +=  currentEl
        
        //if we do not add below line then we do not need add -> hash[0] = 1 on above
        if preSum == k {
            cnt += 1
        }
        
        let rem = preSum-k
        if let freq = hash[rem] {
            cnt += freq
        }
        
        hash[preSum, default: 0] += 1
    }
    return cnt
}
//Approach = prefixSum + ls
//T.C = O(n)
//A.S = O(n)



//MARK: Arrays Picked--------------------



//MARK: trappingRainWater
//https://leetcode.com/problems/trapping-rain-water
//https://youtu.be/1_5VuquLbXg?si=kkBFJYE1wBelJr_d
func trappingRainWater(_ height: [Int]) -> Int {
    let n = height.count
    guard n > 1 else { return 0 }
    var count = 0
    var leftMax = Int.min
    var rightMax = Int.min
    for i in 1..<n-1{
        let current = height[i]
        let previous = height[i-1]
        leftMax = max(previous, leftMax)
        rightMax = findRightMax(height, till: i+1)
        
        if current < leftMax && current < rightMax {
            let currentWaterCount = min(leftMax, rightMax) - current
            if currentWaterCount > 0 {
                count += currentWaterCount
            }
        }
    }
    return count
}
func findRightMax(_ height: [Int], till index: Int) -> Int{
    var res = 0
    for i in stride(from: height.count-1, through: index, by: -1) {
        let current = height[i]
        if  current>res{
            res = current
        }
    }
    return res
}
//Approach = currentWaterCount = min(leftMax, rightMax) - currentIndex
//T.C = BigO(n)
//A.S = BigO(1)
