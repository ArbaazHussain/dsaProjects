//
//  MonotonicStackQueue.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 03/10/26.
//

import Foundation

/*
 *Core Pattern*
 nextGreaterElementGeneric
 prevGreaterElementIndices
 */


//MARK: nextGreaterElementGeneric
//https://youtu.be/e7XQLtOQM3I?si=w8Gg437LZBfN63zu
func nextGreaterElementGeneric(_ nums1: [Int]) -> [Int] {
    let n = nums1.count
    var res = Array(repeating: 0, count: n)
    var stk = [Int]() // Monotonic Decreasing Stack
    
    // Traverse from right to left
    for i in stride(from: n-1, through: 0, by: -1) {
        let currentEl = nums1[i]
        
        // Kick out elements smaller than or equal to current
        while let lastInStack = stk.last, lastInStack <= currentEl {
            stk.removeLast()
        }
        
        // If stack has something, that's the next greater. Else -1./
        if stk.isEmpty {
            res[i] = -1
        }else{
            res[i] = stk.last!
        }
        // Push current element for the numbers to its left to use
        stk.append(currentEl)
    }
    return res
}
//Approach = Monotonic Stack
//T.C = BigO(2n)
//A.S = BigO(2n)


//MARK: NextGreaterElementI
//https://youtu.be/e7XQLtOQM3I?si=w8Gg437LZBfN63zu
//https://leetcode.com/problems/next-greater-element-i
func nextGreaterElement1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.isEmpty || nums2.isEmpty {
        return []
    }
    var nextGreaterMap = [Int: Int]()
    var stack = [Int]() // Monotonic Decreasing Stack
    
    // 1. Traverse nums2 from right to left to find NGE for every element
    for num in nums2.reversed() {
        
        // Kick out elements smaller than or equal to current
        while let top = stack.last, top <= num {
            stack.removeLast()
        }
        
        // Map the current number to its next greater element (or -1 if stack is empty)
        nextGreaterMap[num] = stack.last ?? -1
        
        // Push current number onto the stack
        stack.append(num)
    }
    
    // 2. Build the result for nums1 using our populated map
    // We use .map to quickly transform the nums1 array based on the dictionary values
    return nums1.map { nextGreaterMap[$0] ?? -1 }
}
//Approach: Monotonic Stack + Dictionary (Hash Map)
//T.C = O(N + M) // N is nums2.count, M is nums1.count. We traverse nums2 once and map nums1 once.
// A.S = O(N)     // The stack and dictionary hold up to N elements from nums2.


//MARK: NextGreaterElement2
//https://youtu.be/7PrncD7v9YQ?si=WR_hyZQGueclI83c
//https://leetcode.com/problems/next-greater-element-ii
func NextGreaterElement2Brute1(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var res = Array(repeating: -1, count: n)
    var stk = [Int]() // Monotonic Decreasing Stack
    
    // Traverse from right to left (evaluating the right side of the array)
    for i in stride(from: n-1, through: 0, by: -1) {
        let currentEl = nums[i]
        
        // Kick out elements smaller than or equal to current to maintain monotonic order
        while let lastInStack = stk.last, lastInStack <= currentEl {
            stk.removeLast()
        }
        
        // CIRCULAR ARRAY ASSUMPTION:
        // If the stack is empty, there is NO greater element to our right.
        // Because the array is hypothetically circular, we must "wrap around"
        // to the beginning (index 0) and search up to our current index (i-1).
        if stk.isEmpty {
            res[i] = -1 // Default if nothing is found
            
            // Scan from the start of the array up to just before our current position
            for j in 0..<i {
                if nums[j] > currentEl {
                    res[i] = nums[j]
                    break // Found the next greater element in the wrapped-around section!
                }
            }
        } else {
            // A greater element was successfully found to our right; no need to wrap around
            res[i] = stk.last!
        }
        
        // Push current element onto the stack so numbers to its left can evaluate it
        stk.append(currentEl)
    }
    
    return res
}
//Approach: Monotonic Stack with Fallback Linear Scan (Hybrid)
//T.C = O(N^2)
//A.S = O(N) for the stack.


func NextGreaterElement2Brute2(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var answer = Array(repeating: -1, count: n)
    
    for i in 0..<n {
        // Loop from the next element up to n-1 steps ahead
        // (i + n - 1) is the last element we need to check
        for j in (i + 1)...(i + n - 1) {
            let nextIndex = j % n
            
            if nums[nextIndex] > nums[i] {
                answer[i] = nums[nextIndex]
                break
            }
        }
    }
    
    return answer
}
// Approach: Brute Force with Circular Traversal
// T.C = O(N^2) // For every element, we potentially scan the rest of the array.
// A.S = O(1)   // No extra data structures used (excluding the result array).


func NextGreaterElement2Optimal(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var answer = Array(repeating: -1, count: n)
    var stack = [Int]() // Monotonic decreasing stack holding actual values
    
    // Two reverse passes simulate circular order: (2N - 1) down to 0
    for i in stride(from: 2 * n - 1, through: 0, by: -1) {
        let index = i % n
        
        // Kick out elements smaller than or equal to current
        while let top = stack.last, top <= nums[index] {
            stack.removeLast()
        }
        
        // Only the real pass (when i < n) writes the final answers.
        // Note: When i < n, 'index' is exactly equal to 'i'.
        if i < n {
            answer[i] = stack.last ?? -1
        }
        
        // Push current value for the numbers to its left to use
        stack.append(nums[index])
    }
    return answer
}
//Approach: Monotonic Decreasing Stack + Circular Array Simulation (2 Passes)
//T.C = O(N) // We iterate 2N times. Each element is pushed/popped at most once.
//A.S = O(N) // The stack holds at most N elements.


//MARK: Asteroid Collision
//https://youtu.be/_eYGqw_VDR4?si=yE74VltfUX7oWryJ
//https://leetcode.com/problems/asteroid-collision
func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var stk = [Int]()
    for value in asteroids {
        if value >= 0 {
            stk.append(value)
        }else{
            let currentAbsVal = abs(value)
            
            while (!stk.isEmpty && stk.last! > 0 && stk.last! < currentAbsVal) {
                stk.removeLast()
            }
            if !stk.isEmpty && currentAbsVal == stk.last! {
                stk.removeLast()
            }else if stk.isEmpty || stk.last! < 0 {
                stk.append(value)
            }
        }
    }
    return stk
}
//Approach:
//T.C = O(N)
//A.S = O(N)


//MARK: SumOfSubarrayMinimums
//https://youtu.be/v0e8p9JCgRc?si=1CpoZ_swO3CrUXVs
//https://leetcode.com/problems/sum-of-subarray-minimums
func sumSubarrayMins(_ arr: [Int]) -> Int {
    let n = arr.count
    
    // 1. Get the boundary indices (Fixed the swapped names!)
    let nextSmaller = nextSmallerElementIndices(arr)
    let prevSmaller = prevSmallerElementIndices(arr)
    
    var totalSum = 0
    
    // 2. Calculate L * R for every element
    for i in 0..<n {
        let minLeft = i - prevSmaller[i]
        let minRight = nextSmaller[i] - i
        
        // Total subarrays where arr[i] is the minimum
        let totalSubarrays = minLeft * minRight
        
        // Contribution: Element value * Number of subarrays
        let minContribution = arr[i] * totalSubarrays
        
        // Add to totalSum and apply modulo to keep the number within limits
        totalSum = (totalSum + minContribution) % M
    }
    return totalSum
}
// T.C = O(3N) // Three separate O(N) passes = O(N)
// A.S = O(N) // Arrays and stacks take O(N) space


//MARK: SumSubarrayRanges
//https://youtu.be/gIrMptNPf5M?si=vp9er3cjGPHZ0S4l
//https://leetcode.com/problems/sum-of-subarray-ranges
func sumSubarrayRanges(_ nums: [Int]) -> Int {
    let n = nums.count
    // 1. Get boundaries for Maximums (using your new decreasing stack logic)
    let prevGreater = prevGreaterElementIndices(nums)
    let nextGreater = nextGreaterElementIndices(nums)
    
    // 2. Get boundaries for Minimums (using your earlier increasing stack logic)
    let prevSmaller = prevSmallerElementIndices(nums)
    let nextSmaller = nextSmallerElementIndices(nums)
    
    var totalSum = 0
    
    // 3. Calculate both L * R contributions in one loop
    for i in 0..<n {
        // Calculate how many subarrays have nums[i] as the MAXIMUM
        let maxLeft = i - prevGreater[i]
        let maxRight = nextGreater[i] - i
        let maxContribution = nums[i] * maxLeft * maxRight
        
        // Calculate how many subarrays have nums[i] as the MINIMUM
        let minLeft = i - prevSmaller[i]
        let minRight = nextSmaller[i] - i
        let minContribution = nums[i] * minLeft * minRight
        
        // Add the difference directly to the total sum
        totalSum += (maxContribution - minContribution)
    }
    
    return totalSum
}
// T.C = O(N) // 4 passes for boundaries + 1 pass for calculation
// A.S = O(N) // Boundary arrays and stacks





//MARK: HelperFunctions
func nextGreaterElementIndices(_ nums: [Int]) -> [Int] {
    let n = nums.count
    // Default to 'n' (out of right bounds).
    // If a number is the maximum of all numbers to its right, its boundary extends to the very end.
    var res = Array(repeating: n, count: n)
    
    // Monotonic Decreasing Stack storing INDICES, not values!
    var stk = [Int]()
    
    // Traverse from right to left to evaluate the right-side boundaries
    for i in stride(from: n - 1, through: 0, by: -1) {
        // KICK OUT SMALLER OR EQUAL ELEMENTS:
        // We use `<=` here to pop elements that are smaller or exactly equal.
        // This ensures the surviving element in the stack is STRICTLY GREATER.
        // Making one side strict (<=) and the other non-strict (<) prevents double-counting duplicates!
        while let topIndex = stk.last, nums[topIndex] <= nums[i] {
            stk.removeLast()
        }
        // Store the index of the next greater element (or 'n' if stack is empty)
        res[i] = stk.last ?? n
        
        // Push the CURRENT INDEX onto the stack so elements to the left can evaluate it
        stk.append(i)
    }
    return res
}

func prevGreaterElementIndices(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var res = Array(repeating: -1, count: n) // Default to '-1' (out of left bounds)
    var stk = [Int]() // Stores INDICES
    
    // Traverse from left to right
    for i in 0..<n {
        
        // Pop if the element at topIndex is strictly < current element.
        // (Using strict `<` here while the right side uses `<=` prevents double
        // counting subarrays with identical maximums)
        while let topIndex = stk.last, nums[topIndex] < nums[i] {
            stk.removeLast()
        }
        
        // Store the index of the previous greater element
        res[i] = stk.last ?? -1
        
        // Push the CURRENT INDEX
        stk.append(i)
    }
    
    return res
}

func nextSmallerElementIndices(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var res = Array(repeating: n, count: n) // Default to 'n' (out of right bounds)
    var stk = [Int]() // Stores INDICES
    
    // Traverse from right to left
    for i in stride(from: n - 1, through: 0, by: -1) {
        
        // Pop if the element at topIndex is >= current element.
        // (We use >= here and > in the other function to handle duplicates without double counting)
        while let topIndex = stk.last, nums[topIndex] >= nums[i] {
            stk.removeLast()
        }
        
        // Store the index of the next smaller element
        res[i] = stk.last ?? n
        
        // Push the CURRENT INDEX
        stk.append(i)
    }
    
    return res
}

func prevSmallerElementIndices(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var res = Array(repeating: -1, count: n) // Default to '-1' (out of left bounds)
    var stk = [Int]() // Stores INDICES
    
    // Traverse from left to right
    for i in 0..<n {
        
        // Pop if the element at topIndex is strictly > current element.
        // (Strictly > prevents double counting subarrays with identical minimums)
        while let topIndex = stk.last, nums[topIndex] > nums[i] {
            stk.removeLast()
        }
        
        // Store the index of the previous smaller element
        res[i] = stk.last ?? -1
        
        // Push the CURRENT INDEX
        stk.append(i)
    }
    
    return res
}

