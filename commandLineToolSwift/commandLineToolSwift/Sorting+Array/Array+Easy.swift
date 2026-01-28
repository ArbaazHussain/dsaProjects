//
//  Array.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 07/09/25.
//

/*
 * In Swift, you don’t need to take care of fixed vs dynamic arrays — just use Array, which is dynamic by default.

 * In Swift, arrays are always heap-allocated, so arrays of size 1e6 or 1e7 can be created locally without stack overflow.
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
        return -1
    }
    var largest = Int.min
    for num in nums {
        if(num>largest){
            largest = num
        }
    }
    return largest
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
//https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/
//https://youtu.be/pO3L3zX5DOI?si=AwymrOkYcwiQQW-y
func isArraySortedAndRotatedBrute(_ nums: [Int]) -> Bool {
    var nums = nums
    let sortedArray = nums.sorted()
    if nums == sortedArray  { return true }
    for _ in 0..<nums.count {
        rightRotateByDPlaceOptimal(nums: &nums, d: 1)
        if nums == sortedArray {
            return true
        }
    }
    return false
}
//Approach = linearSearch
//T.C = BigO(nlogn + n^2n)
//A.S = BigO(n)


func isArraySortedAndRotatedOptimal(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else { return true }
    let n = nums.count
    var dropIndex = -1
    for i in 0..<n-1{
        let current = nums[i]
        let next = nums[i+1]
        if dropIndex == -1 {
            if next < current{
                dropIndex = i+1
            }
        }else{
            if current > next || current > nums[0] {
                return false
            }
        }
    }
    if (nums[n-1] > nums[0]) && dropIndex != -1 { return false }
    return true
}
//Approach = linearSearch
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
//k unique elements in array
//T.C = BigO((n) + (k log k) + O(k))
//A.S = BigO(k)


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
    
    let d = k % n
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
    // Store last d elements in reverse order in a temporary array
    var tempArray: [Int] = []
    for i in (n-d..<n).reversed() {
        tempArray.append(nums[i])
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
    //i is used for zero element index
    var i = 0
    var gotFirstZero = false
    //i is used for non-zero element index
    for j in 0..<nums.count {
        if !gotFirstZero {
            if nums[j] == 0 {
                i = j
                gotFirstZero = true
            }
            continue
        }
        if nums[j] != 0 {
            nums.swapAt(i, j)
            i += 1
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
func unionOfSortedArrayBrute(_ nums1: [Int], _ nums2: [Int]) -> [Int]{
    var resultSet = Set<Int>()
    // Insert elements from both arrays into the set
    //O(n1*logk)
    for num in nums1 {
        resultSet.insert(num)
    }
    //O(n2*logk)
    for num in nums2 {
        resultSet.insert(num)
    }
    //O(n1+n2)
    var result = [Int]()
    for item in resultSet {
        result.append(item)
    }
    return result
}
//Approach = set
// T.C - BigO((n1*logk) + (n2*logk) + (n1+n2)) //k = size of the current set
// A.S - BigO 2(n1+n2)


func unionOfSortedArrayOptimal(_ nums1: [Int], _ nums2: [Int]) {
    var unionArray: [Int] = []
    var i = 0, j = 0
    let n1 = nums1.count
    let n2 = nums2.count
    
    while i < n1 && j < n2 {
        if nums1[i] < nums2[j] {
            if unionArray.last != nums1[i] {
                unionArray.append(nums1[i])
            }
            i += 1
        } else if nums1[i] > nums2[j] {
            if unionArray.last != nums2[j] {
                unionArray.append(nums2[j])
            }
            j += 1
        } else {
            // Both are equal
            if unionArray.last != nums1[i] {
                unionArray.append(nums1[i])
            }
            i += 1
            j += 1
        }
    }
    while i < n1 {
        if unionArray.last != nums1[i] {
            unionArray.append(nums1[i])
        }
        i += 1
    }
    while j < n2 {
        if unionArray.last != nums2[j] {
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
//Approach = two pointer
// T.C - BigO(n1+n2)
// A.S - BigO(n1+n2)


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


//missingNumberOptimal2 can be better than missingNumberOptimal1 bcz, array size can be big as 10^5 and sum of elements till 10^5 can be 10^10 which cannot be stored in int.
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
func maxConsecutiveOnesOptimalStv(_ nums: [Int]) -> Int {
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
func singleNumberBrute(_ nums: [Int]) -> Int {
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
//Approach = hashing
//M = size of the map
//T.C = BigO(n) + O(M)
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


//This is optimal solution if array has -ve,+ve or zero
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



//MARK: Helper Functions
public func reverseArrayFromIndex(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var left = start
    var right = end
    
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}

public func linearSearch(_ nums: [Int], _ key: Int) -> Bool {
    let n = nums.count
    for i in 0..<n {
        if nums[i] == key {
            return true
        }
    }
    return false
}

public func setRowWith(_ matrix: inout [[Int]], _ index : Int, _ key: Int) {
    for i in 0..<matrix[index].count {
        matrix[index][i] = key
    }
}
public func setColWith(_ matrix: inout [[Int]], _ index : Int, _ key: Int) {
    for i in 0..<matrix.count {
        matrix[i][index] = key
    }
}


/*
 21 Dec:
 [Easy]
 fully revised (1-month)
 
 15 Jan:
 2ndRevise till move zero
 
 [Medium]
 sortArrayOfZeroOneTwo(dutchNationalFlag Algorithm) - (revise algo)
 FindTheMajorityElement(Moore’s Voting Algorithm) - (revise algo)
 maximumSubarraySum(Kadane's Algorithm) - (revise algo)
 
 nextPermutation(dia approach)

 longestConsecutiveBetterStv
 longestConsecutiveOptimal(revise approach)
 
 setMatrixZeroes(BruteNotWorking, BetterWorking)
 rotateImage
 subArraySumEqualsK
 trappingRainWater
 
 15 Jan:
 all above
 */
