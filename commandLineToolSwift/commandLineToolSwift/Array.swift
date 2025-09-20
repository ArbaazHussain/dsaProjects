//
//  Array.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 07/09/25.
//

/*
 * In Swift, you don’t need to take care of fixed vs dynamic arrays — just use Array, which is dynamic by default.
 
 * In Swift, arrays are always heap-allocated, so arrays of size 1e6 or 1e7 can be created locally without stack overflow.
 
 
 Algorithms:
 * dutch national flag algorithm -:
[0...low-1]    -> 0
[low...mid-1]  -> 1
[mid...high]   ->{*}
[high+1...n-1] -> 2
 
 
 * Moore’s Voting Algorithm -:
 Majority means more than half, so it can’t be fully canceled. Different elements cancel each other, and the survivor is the candidate. Count again to verify if it’s truly the majority.
 
 * Kadane's Algorithm -:
 Kadane’s Algorithm finds the maximum sum of a contiguous subarray in O(n) time by tracking a running sum, resetting it when negative, and updating the global maximum. If all numbers are negative, it returns the largest element.
 
 */


//MARK: ------------Easy------------


// MARK: - insertElementInFixedArray
func insertElementInFixedArray(arr: inout [Int], capacity: Int, occupied: Int, x: Int, pos: Int) {
    // Validate position
    if pos > capacity || pos <= 0 {
        print("Invalid position")
        return
    }
    // Check if space is available
    if capacity == occupied {
        print("No space")
        return
    }
    let index = pos - 1
    // Shift elements to the right
    var i = occupied - 1
    while i >= index {
        arr[i + 1] = arr[i]
        i -= 1
    }
    // Insert element
    arr[index] = x
    //Avoid this block for time complexity
    for value in arr {
        print(value, terminator: " ")
    }
    print()
}
/*
 Usage:
 var arr = Array(repeating: 0, count: 5)   // capacity = 10
 arr[0] = 1
 arr[1] = 2
 arr[2] = 4
 insertElementInFixedArray(arr: &arr, capacity: 5, occupied: 3, x: 101, pos:5)
 */
//T.C = O(n)
//A.S = O(1)


// MARK: - deleteElementInFixedArray
func deleteElementInFixedArray(arr: inout [Int], cap: Int, x: Int) {
    var index = -1
    // Searching the element
    for i in 0..<cap {
        if arr[i] == x {
            index = i
            break
        }
    }
    if index == -1 {
        print("Element to be deleted is not present")
        return
    }
    // Shifting elements to the left
    for i in index..<cap {
        if i < cap - 1 {
            arr[i] = arr[i + 1]
        } else {
            arr[i] = 0 // Setting the last element to 0
        }
    }
    //Avoid this block for time complexity
    for i in 0..<cap {
        print(arr[i])
    }
}
//T.C = BigO(n), if delete the last element then T.C is Big0(1)
//A.S = BigO(1)

//MARK: largestElement
func largestElementBrute(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    return sortedNums[sortedNums.count - 1]
}
//Approach = sorting
//T.C = BigO(n logn)
//A.S = BigO(n)


func largestElementOptimal(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        fatalError("Array must not be empty")
    }
    var largestIndex = 0
    for i in 1..<nums.count {
        if nums[i] > nums[largestIndex] {
            largestIndex = i
        }
    }
    return nums[largestIndex]
}
//Approach = linear search
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: secondLargest
func secondLargestBrute(_ nums: [Int]) -> Int {
    let n = nums.count
    guard nums.count >= 2 else { return -1 }
    
    let sortedNums = nums.sorted()
    let largest = sortedNums[n - 1]
    
    for i in stride(from: n - 2, through: 0, by: -1) {
        if sortedNums[i] != largest {
            return sortedNums[i]
        }
    }
    return -1 // All elements are equal
}
//Approach = sorting
//T.C = BigO( (nLogn) + n )
//A.S = BigO(n)


func secondLargestBetter(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else { return -1 }
    
    var maxElement = nums[0]
    // First pass: find the maximum element
    for i in 1..<nums.count {
        if nums[i] > maxElement {
            maxElement = nums[i]
        }
    }
    // Second pass: find the largest element less than maxElement
    var secondMax = Int.min
    for num in nums {
        if num > secondMax && num < maxElement {
            secondMax = num
        }
    }
    return secondMax
}
//Approach = linear search
//T.C = BigO(2n)
//A.S = BigO(1)


func secondLargestOptimal(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else { return -1 }
    var maxElement = Int.min
    var secondMax = Int.min
    
    for num in nums {
        if num > maxElement {
            secondMax = maxElement
            maxElement = num
        } else if num > secondMax && num < maxElement {
            secondMax = num
        }
    }
    return secondMax == Int.min ? -1 : secondMax
}
//Approach = linear search
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: isArraySortedInIncreasing
////https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/
func isArraySortedInIncreasing(_ nums: [Int]) -> Bool {
    for i in 0..<nums.count-1 {
        if nums[i] > nums[i+1] {
            return false
        }
    }
    return true;
}
//Approach = linear search
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: removeDuplicatesInSortedArray
//https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
func removeDuplicatesInSortedArrayBrute(_ nums: inout [Int]) -> Int {
    var uniqueSet = Set<Int>()
    // Insert all elements into the set (duplicates automatically removed)
    for num in nums {
        uniqueSet.insert(num)
    }
    // Convert the set back to a sorted array (to maintain original sorted order)
    let sortedUnique = uniqueSet.sorted()
    
    for i in 0..<sortedUnique.count {
        nums[i] = sortedUnique[i]
    }
    return uniqueSet.count
}
//Approach = set
//T.C = BigO(n*logk + n) //k is current no elements in the set
//A.S = BigO(n)


func removeDuplicatesInSortedArrayOptimal(_ nums: inout [Int]) -> Int {
    let n = nums.count
    if n == 0 { return 0 }
    
    var i = 0
    for j in 1..<n {
        if nums[i] != nums[j] {
            i += 1
            nums[i] = nums[j]
        }
    }
    return i + 1
}
//Approach = two pointer
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: LeftRotateByOnePlace
func leftRotateByOnePlace(_ nums: inout [Int]) {
    let n = nums.count
    guard n > 1 else { return }
    
    let firstElement = nums[0]
    for i in 1..<n {
        nums[i - 1] = nums[i]
    }
    nums[n - 1] = firstElement
    //Avoid this block for time complexity
    for i in 0..<n {
        print(nums[i], terminator: " ")
    }
    print()
}
//Approach = linear
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: LeftRotateByDPlace
func LeftRotateByDPlaceBrute(_ nums: inout [Int], _ k: Int) {
    let n = nums.count
    guard n > 0 else { return }
    
    var d = k % n
    if d == 0 {
        //Avoid this block for time complexity
        for num in nums {
            print(num, terminator: " ")
        }
        print()
        return
    }
    // Step 1: Store first `d` elements in tempArray
    var tempArray: [Int] = []
    for i in 0..<d {
        tempArray.append(nums[i])
    }
    // Step 2: Shift elements to the left in a single loop
    var j = 0
    for i in 0..<n {
        if i < n-d {
            nums[i] = nums[i+d]
        } else {
            nums[i] = tempArray[j]
            j += 1
        }
    }
    //Avoid this block for time complexity
    for num in nums {
        print(num, terminator: " ")
    }
    print()
}
//Approach = linear
// T.C - BigO(d+n)
// A.S - BigO(d)


// MARK: - LeftRotateByDPlaceOptimal
func LeftRotateByDPlaceOptimal(_ nums: inout [Int], _ d: Int) {
    let n = nums.count
    guard n > 1 else { return }
    
    let d = d % n
    if d == 0 {
        //Avoid this block for time complexity
        for num in nums {
            print(num, terminator: " ")
        }
        print()
        return
    }
    // Reverse first d elements
    reverseArrayFromIndex(&nums, 0, d - 1)
    // Reverse remaining n - d elements
    reverseArrayFromIndex(&nums, d, n - 1)
    // Reverse the entire array
    reverseArrayFromIndex(&nums, 0, n - 1)
    
    // Avoid this block in production
    for num in nums {
        print(num, terminator: " ")
    }
    print()
}
//Approach = swap the parts of array
// T.C - BigO(2n)
// A.S - BigO(1)


//MARK: rightRotateByDPlace
//https://leetcode.com/problems/rotate-array/description/
func rightRotateByDPlaceBrute(nums: inout [Int], d: Int) {
    let n = nums.count
    var d = d
    if d > n {
        d = d % n
    }
    if n == d {
        //Avoid this block for time complexity
        for num in nums {
            print(num, terminator: " ")
        }
        print()
        return
    }
    // Store last d elements in a temporary array
    var tempArray: [Int] = []
    for i in 0..<d {
        let x = nums[(n - 1) - i]
        tempArray.append(x)
    }
    // Shift remaining elements to the right
    var z = 0
    for i in stride(from: n - 1, through: 0, by: -1) {
        if i >= d {
            nums[i] = nums[i - d]
        } else {
            nums[i] = tempArray[z]
            z += 1
        }
    }
    //Avoid this block for time complexity
    for value in nums {
        print(value, terminator: " ")
    }
    print()
}
//Approach = linear
// T.C - BigO(n+d)
// A.S - BigO(d)


func rightRotateByDPlaceOptimal(nums: inout [Int], d: Int) {
    let n = nums.count
    var d = d
    if d > n {
        d = d % n
    }
    if n == d || n == 0 {
        return
    }
    // Reverse the entire array
    reverseArrayFromIndex(&nums, 0, n - 1)
    // Reverse the first d elements
    reverseArrayFromIndex(&nums,  0, d - 1)
    // Reverse the remaining n-d elements
    reverseArrayFromIndex(&nums, d, n - 1)
    //Avoid this block for time complexity
    for value in nums {
        print(value, terminator: " ")
    }
    print()
}
//Approach = swap the parts of array
// T.C - BigO(2n)
// A.S - BigO(1)


//MARK: moveZeroesToEnd
//https://leetcode.com/problems/move-zeroes/description/
func moveZeroesToEndBrute(_ nums: inout [Int]) {
    let n = nums.count
    var tempArray: [Int] = []

    // Step 1: Copy all non-zero elements to tempArray
    for i in 0..<n {
        if nums[i] != 0 {
            tempArray.append(nums[i])
        }
    }
    // Step 2: Fill the original array
    for i in 0..<n {
        if i < tempArray.count {
            nums[i] = tempArray[i]
        } else {
            nums[i] = 0
        }
    }
    //Avoid this block for time complexity
    for num in nums {
        print(num, terminator: " ")
    }
    print()
}
//Approach = linear
// T.C - BigO(2n)
// A.S - BigO(n)


func moveZeroesToEndOptimal(_ nums: inout [Int]) {
    let n = nums.count
    var j = -1
    var gotFirstZero = false
    
    for i in 0..<n {
        if nums[i] == 0 && !gotFirstZero {
            j = i
            gotFirstZero = true
            continue
        }
        
        if gotFirstZero && nums[i] != 0 {
            nums.swapAt(j, i)
            j += 1
        }
    }
    //Avoid this block for time complexity
    for num in nums {
        print(num, terminator: " ")
    }
    print()
}
//Approach = two pointer
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: linearSearch
func linearSearch(_ nums: inout [Int], _ k: Int) -> Int {
    for i in 0..<nums.count{
        if(nums[i]==k){
            return i
        }
    }
    return -1;
}
//Approach = linear
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: unionOfSortedArray
func unionOfSortedArrayBrute(_ nums1: [Int], _ nums2: [Int]) {
    var resultSet = Set<Int>()
    // Insert elements from both arrays into the set
    for num in nums1 {
        resultSet.insert(num)
    }
    for num in nums2 {
        resultSet.insert(num)
    }
    // Convert to array and sort (optional if sorted output needed)
    let sortedUnion = resultSet.sorted()
    //Avoid this block for time complexity
    for val in sortedUnion {
        print(val, terminator: " ")
    }
    print()
}
//Approach = set
// T.C - BigO(n1+n2+SLogS) //S = size of the current set
// A.S - BigO(n1+n2)


func unionOfSortedArrayOptimal(_ nums1: [Int], _ nums2: [Int]) {
    var unionArray: [Int] = []
    var i = 0, j = 0
    let n1 = nums1.count
    let n2 = nums2.count
    
    while i < n1 && j < n2 {
        if nums1[i] < nums2[j] {
            if unionArray.isEmpty || unionArray.last! != nums1[i] {
                unionArray.append(nums1[i])
            }
            i += 1
        } else if nums1[i] > nums2[j] {
            if unionArray.isEmpty || unionArray.last! != nums2[j] {
                unionArray.append(nums2[j])
            }
            j += 1
        } else {
            // Both are equal
            if unionArray.isEmpty || unionArray.last! != nums1[i] {
                unionArray.append(nums1[i])
            }
            i += 1
            j += 1
        }
    }
    while i < n1 {
        if unionArray.isEmpty || unionArray.last! != nums1[i] {
            unionArray.append(nums1[i])
        }
        i += 1
    }
    while j < n2 {
        if unionArray.isEmpty || unionArray.last! != nums2[j] {
            unionArray.append(nums2[j])
        }
        j += 1
    }
    //Avoid this block for time complexity
    for val in unionArray {
        print(val, terminator: " ")
    }
    print()
}


//MARK: intersectionOfSortedArray
//https://www.naukri.com/code360/problems/intersection-of-2-arrays_1082149
func intersectionOfSortedArrayBrute(_ nums1: [Int], _ nums2: [Int]) {
    var intersectionArray: [Int] = []
    var z = 0
    let n1 = nums1.count
    let n2 = nums2.count
    
    for i in 0..<n1 {
        for j in z..<n2 {
            if nums1[i] == nums2[j] {
                intersectionArray.append(nums1[i])
                z = j+1
                break
            }
            if nums2[j] > nums1[i] {
                break
            }
        }
    }
    //Avoid this block for time complexity
    for val in intersectionArray {
        print(val, terminator: " ")
    }
    print()
}
//Approach = linear
// T.C - BigO(nums1*nums2)
// A.S - BigO(n)


func intersectionOfSortedArrayOptimal(_ nums1: [Int], _ nums2: [Int]) {
    var intersectionArray: [Int] = []
    var i = 0
    var j = 0
    let n1 = nums1.count
    let n2 = nums2.count
    
    while i < n1 && j < n2 {
        if nums1[i] < nums2[j] {
            i += 1
        } else if nums1[i] > nums2[j] {
            j += 1
        } else {
            intersectionArray.append(nums1[i])
            i += 1
            j += 1
        }
    }
    //Avoid this block for time complexity
    for val in intersectionArray {
        print(val, terminator: " ")
    }
    print()
}
//Approach = two pointer
// T.C - BigO(n1+n2)
// A.S - BigO(n1+n2)


//MARK: missingNumber
//https://leetcode.com/problems/missing-number/description/
func missingNumberBrute(_ nums: [Int]) -> Int {
    let n = nums.count
    for i in 0...n {
        var exists = false
        for j in 0..<n {
            if i == nums[j] {
                exists = true
                break
            }
        }
        if !exists {
            return i
        }
    }
    return -1 // Should never reach here for valid input
}
//Approach = linear
//T.C = BigO(n*n)
//A.S = Big0 (1)


func missingNumberBetter(_ nums: [Int]) -> Int {
    let n = nums.count
    var hashArray = Array(repeating: 0, count: n+1)
    for num in nums {
        hashArray[num] += 1
    }
    for i in 0...n {
        if hashArray[i] == 0 {
            return i
        }
    }
    return -1 // Should never happen with valid input
}
//Approach = hashing
//T.C = BigO(2n)
//A.S = Big0 (n)


func missingNumberOptimal1(_ nums: [Int]) -> Int {
    let n = nums.count
    let expectedSum = n * (n + 1) / 2
    var actualSum = 0
    for i in 0..<n {
        actualSum += nums[i]
    }
    return expectedSum - actualSum
}
//Approach = sumOfNnaturalNo
//T.C = BigO(n)
//A.S = Big0(1)


func missingNumberOptimal2(_ nums: [Int]) -> Int {
    let n = nums.count
    var xor1 = 0
    var xor2 = 0
    
    for i in 0...n {
        if(i<n){
            xor1 ^= i
            xor2 ^= nums[i]
        }else{
            xor1 ^= i
        }
    }
    return xor1 ^ xor2
}
//Approach = xor
//T.C = BigO(n)
//A.S = Big0(1)


//MARK: maxConsecutiveOnes
//https://leetcode.com/problems/max-consecutive-ones/description/
func maxConsecutiveOnesOptimal1My(_ nums: [Int]) -> Int {
    let n = nums.count
    var finalRes = 0
    var currentRes = 0
    for i in 0..<n {
        if nums[i] == 1 {
            currentRes += 1
            if i == n - 1 {
                finalRes = max(currentRes, finalRes)
                currentRes = 0
            }
        } else {
            finalRes = max(currentRes, finalRes)
            currentRes = 0
        }
    }
    return finalRes
}
//Approach = linear
//T.C = BigO(n)
//A.S = Big0(1)


func maxConsecutiveOnesOptimal2Stv(_ nums: [Int]) -> Int {
    var cnt = 0
    var maxi = 0
    for num in nums {
        if num == 1 {
            cnt += 1
            maxi = max(maxi, cnt)
        } else {
            cnt = 0
        }
    }
    return maxi
}
//Approach = linear
//T.C = BigO(n)
//A.S = Big0(1)


//MARK: singleNumber
//https://leetcode.com/problems/single-number/description/
func singleNumber(_ nums: [Int]) -> Int {
    let n = nums.count
    // Run a loop for selecting elements
    for i in 0..<n {
        let num = nums[i] // selected element
        var cnt = 0
        // find the occurrence using linear search
        for j in 0..<n {
            if nums[j] == num {
                cnt += 1
            }
        }
        // if the occurrence is 1 return the answer
        if cnt == 1 {
            return num
        }
    }
    // This line will never execute if the array contains a single element
    return -1
}
//Approach = linear
//T.C = BigO(n^2)
//A.S = Big0(1)


func singleNumberBetter1(_ nums: [Int]) -> Int {
    let n = nums.count
    // Manually find the maximum element
    var maxVal = nums[0]
    for i in 0..<n {
        if nums[i] > maxVal {
            maxVal = nums[i]
        }
    }
    // Declare hash array of size maxVal + 1 and hash the given array
    var hash = Array(repeating: 0, count: maxVal + 1)
    for i in 0..<n {
        hash[nums[i]] += 1
    }
    // Find the single element and return the answer
    for i in 0..<n {
        if hash[nums[i]] == 1 {
            return nums[i]
        }
    }
    // This line will never execute if the array contains a single element
    return -1
}
//Approach = hashing
//T.C = BigO(3n)
//A.S = BigO(maxElementInArray+1)


func singleNumberBetter2(_ nums: [Int]) -> Int {
    let n = nums.count
    // Declare the hashmap and hash the given array
    var mpp = [Int: Int]()
    for i in 0..<n {
        mpp[nums[i], default: 0] += 1
    }
    // Find the single element and return the answer
    for (key, value) in mpp {
        if value == 1 {
            return key
        }
    }
    // This line will never execute if the array contains a single element
    return -1
}
//Approach = map
//M = size of the map
//T.C = BigO(N*logM) + O(M)
//A.S = BigO(M)


func singleNumberOptimal(_ nums: [Int]) -> Int {
    let n = nums.count
    // XOR all the elements
    var xorr = 0
    for i in 0..<n {
        xorr = xorr ^ nums[i]
    }
    return xorr
}
//Approach = xor
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: longestSubarraywithsumK
//https://www.naukri.com/code360/problems/longest-subarray-with-sum-k_5713505
//https://leetcode.com/problems/subarray-sum-equals-k/description/
func longestSubarraywithsumKBrute1(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var len = 0
    for i in 0..<n { // starting index
        for j in i..<n { // ending index
            var sum: Int64 = 0 // long long in Swift is Int64
            for K in i...j {
                sum += Int64(nums[K])
            }
            if sum == Int64(k) {
                len = max(len, j - i + 1)
            }
        }
    }
    return len
}
//Approach = linear
//T.C = BigO(n^3)
//A.S = BigO(1)


func longestSubarraywithsumKBrute2(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var len = 0
    for i in 0..<n { // starting index
        var s: Int64 = 0 // sum variable
        for j in i..<n { // ending index
            s += Int64(nums[j])
            if s == Int64(k) {
                len = max(len, j - i + 1)
            }
        }
    }
    return len
}
//Approach = linear
//T.C = BigO(n^2)
//A.S = BigO(1)


func longestSubarraywithsumKBetter(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var preSumMap = [Int: Int]()   // Dictionary to store prefix sum → index
    var sum = 0
    var maxLen = 0
    
    for i in 0..<n {
        // calculate prefix sum till index i
        sum += nums[i]
        // if the sum == k, update maxLen
        if sum == k {
            maxLen = max(maxLen, i + 1)
        }
        // calculate remaining part (sum - k)
        let rem = sum - k
        // check if remainder exists in map
        if let prevIndex = preSumMap[rem] {
            let len = i - prevIndex
            maxLen = max(maxLen, len)
        }
        // update the map if sum not already present
        if preSumMap[sum] == nil {
            preSumMap[sum] = i
        }
    }
    return maxLen
}
//Approach = linear+hashing
// T.C - BigO(n)
// A.S - BigO(n)


//This is optimal solution if array is only +ve and 0 elements
func longestSubarraywithsumKOptimal(_ nums: [Int], _ k: Int) -> Int {
    return -1
}


//MARK: ----------Medium----------



//MARK: twoSum
//Returns (True/False or ExactElements) and not index position if twoSum is present
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
//Approach = linear
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
//Approach = Two Pointer
// T.C - BigO(nLogn + n)
// A.S - BigO(n)


//Returns index position if twoSum is present
//twoSumVarietyTwoOptimal is optimal for twoSumVarietyOne as well.
func twoSumVarietyTwoOptimal(_ nums: [Int], _ target: Int) -> [Int] {
    var hashData = [Int: Int]()
    hashData[nums[0]] = 0
    for i in 1..<nums.count {
        if let yIndex = hashData[target-nums[i]] {
            return [yIndex,i]
        }
        hashData[nums[i]] = i;
    }
    return [-1,-1]
}
//Approach = linear+hashing
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
// A.S - BigO(1)


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
    let n = nums.count
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
    return el ?? -1
}
//Approach = Moore’s Voting Algorithm -> Majority means more than half. Different elements cancel each other, so it can’t be fully canceled and the survivor is the candidate.
// T.C - BigO(n)
// A.S - BigO(n)


//MARK: maximumSubarraySum
//https://leetcode.com/problems/maximum-subarray/description/
func maximumSubarraySumBetter(_ nums: [Int]) -> Int {
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
//Approach = Kadane's Algorithm - Kadane’s Algorithm finds the maximum sum of a contiguous subarray in O(n) time by tracking a running sum, resetting it when negative, and updating the global maximum. If all numbers are negative, it returns the largest element.
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
    var minBuyingPrice = prices[0]
    var profit = 0
    for i in 1..<prices.count {
        let current = prices[i]
        profit = max(current-minBuyingPrice,profit)
        minBuyingPrice = min(current,minBuyingPrice)
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
        if(num>=0){
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
//https://leetcode.com/problems/permutations/description/
func printAllPermutations(_ nums: inout [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    var ds: [Int] = []
    var freq: [Int] = Array(repeating: 0, count: nums.count)
    recurPermute(&ds, nums, &ans, &freq)
    return ans
}
private func recurPermute(_ ds: inout [Int], _ nums: [Int], _ ans: inout [[Int]], _ freq: inout [Int]) {
    if ds.count == nums.count {
        ans.append(ds)
        return
    }
    for i in 0..<nums.count {
        if freq[i] == 0 {
            ds.append(nums[i])
            freq[i] = 1
            recurPermute(&ds, nums, &ans, &freq)
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
func nextPermutation(_ nums: inout [Int]) {
    let n = nums.count
    if(n==1){
        return
    }
    var index = -1
    for i in (0...n-2).reversed() {
        if(nums[i]<nums[i+1]){
            index = i
            break
        }
    }
    if(index == -1){
        reverseArrayFromIndex(&nums, 0, n-1)
        return
    }
    for i in (index...n-1).reversed() {
        if(nums[i]>nums[index]){
            nums.swapAt(index, i)
            break
        }
    }
    reverseArrayFromIndex(&nums, index+1, n-1)
}
//Approach = lS + dictionary approach + find dip from back
//T.C = O(3n)
//A.S = O(1)


//MARK: leadersInArray
//https://www.geeksforgeeks.org/problems/leaders-in-an-array-1587115620/1
func leadersInArray(_ nums: inout [Int]) -> [Int] {
    let n = nums.count
    var leaders = [Int]()
    if(n==1){
        return leaders
    }
    var max = Int.min
    for i in (0...n-1).reversed() {
        let current = nums[i]
        if(current>=max){
            leaders.append(current)
        }
        if(current>=max){
            max = current
        }
    }
    return leaders.reversed()
}
//Approach = lS
//T.C = O(n + (n/2))
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


func longestConsecutiveBetterMy(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0}
    var maxRes = 1;
    var res = 1;
    let sortedArray = nums.sorted()
    for i in 1..<sortedArray.count {
        let current = sortedArray[i]
        let prev = sortedArray[i-1]
        let isConsecutive = current<0 ? (prev-current == -1) : (current-prev == 1)
        if(isConsecutive || (current == prev)){
            if(current != prev){
                res += 1
            }
        }else{
            //start of new Consecutive
            maxRes = max(maxRes,res)
            res = 0
            res += 1
        }
        if(i==(nums.count-1)){
            maxRes = max(maxRes,res)
        }
    }
    return maxRes
}
//Approach = sort + lS
//T.C = O(nlogn + n)
//A.S = O(n)


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
    //O(n)
    let set = Set(nums)
    var longest = 1
    var currentCount = 0
    //O(2n)
    for num in set {
        //check for 1st element
        if !set.contains(num-1) {
            currentCount = 1
            var next = num+1
            while(set.contains(next)){
                currentCount += 1
                next += 1
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
//https://leetcode.com/problems/set-matrix-zeroes/description/
func setZeroesMyBrute(_ matrix: inout [[Int]]) {
    var address = [[Int]]()
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let current = matrix[i][j]
            if(current==0){
                address.append([i,j])
            }
        }
    }
    for add in address {
        let row = add[0]
        let col = add[1]
        //marking row as zero
        for j in 0..<matrix[row].count {
            matrix[row][j] = 0
        }
        //marking col as zero
        for i in 0..<matrix.count {
            matrix[i][col] = 0
        }
    }
}
//Approach = lS
//T.C = O((n*m) + ((n*m)*(n+m))) -> close to n^3
//A.S = O(n*m)


func setZeroesStvBrute(_ matrix: inout [[Int]]) {
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let current = matrix[i][j]
            if(current==0){
                setRowWith(&matrix, i,-1)
                setColWith(&matrix, j,-1)
            }
        }
    }
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let current = matrix[i][j]
            if(current == -1){
                matrix[i][j] = 0
            }
        }
    }
}
//Approach = lS
//T.C = O( ((n*m)*(n+m)) + (n*m)) -> close to n^3
//A.S = O(1)


func setZeroesBetter(_ matrix: inout [[Int]]) {
    var rowArray = Array(repeating: 0, count: matrix.count)
    var colArray = Array(repeating: 0, count: matrix[0].count)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let current = matrix[i][j]
            if(current==0){
                rowArray[i] = 1
                colArray[j] = 1
            }
        }
    }
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
    //transpose the array (col->row)
    for i in 0..<n-1{
        for j in i+1..<n {
            let temp = matrix[j][i]
            matrix[j][i] = matrix[i][j]
            matrix[i][j] = temp
        }
    }
    //reverse every row
    for i in 0..<matrix.count {
        reverseArrayFromIndex(&matrix[i], 0, matrix[i].count-1)
    }
}
//Approach = transpose array(col->row) -> reverse every row
//T.C = O((n^2) + n*(n/2))
//A.S = O(1)


//MARK: spiralMatrix
//https://leetcode.com/problems/spiral-matrix/description/
func spiralMatrix(_ matrix: [[Int]]) -> [Int]  {
    let n = matrix.count
    var result = [Int]()
    
    var left = 0
    var right = matrix[0].count-1
    var bottom = matrix.count-1
    var top = 0;
    
    for _ in 0..<n*2 {
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


func findAllSubarraysWithGivenSumBetter(_ nums: [Int], _ k: Int) -> Int {
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
    hash[0] = 1
    for i in 0..<nums.count {
        let currentEl = nums[i]
        preSum +=  currentEl
        
        let rem = preSum-k
        if let freq = hash[rem] {
            cnt += freq
        }
        
        hash[preSum, default: 0] += 1
    }
    return cnt
}
//Approach = ls
//T.C = O(n)
//A.S = O(n)









//MARK: Helper Functions
func reverseArrayFromIndex(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var left = start
    var right = end
    
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}

func linearSearch(_ nums: [Int], _ key: Int) -> Bool {
    let n = nums.count
    for i in 0..<n {
        if nums[i] == key {
            return true
        }
    }
    return false
}

private func setRowWith(_ matrix: inout [[Int]], _ index : Int, _ key: Int) {
    for i in 0..<matrix[index].count {
        if(matrix[index][i] != 0){
            matrix[index][i] = key
        }
    }
}
private func setColWith(_ matrix: inout [[Int]], _ index : Int, _ key: Int) {
    for i in 0..<matrix.count {
        if(matrix[i][index] != 0){
            matrix[i][index] = key
        }
    }
}

