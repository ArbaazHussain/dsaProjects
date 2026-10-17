//
//  BinarySearch.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 21/09/25.
//

import Foundation

/*
 *Core Pattern*
 implementLowerBound
 implementUpperBound
 
 firstAndLastInSortedArray
 
 searchinRotatedSortedArray //check for sorted half
 singleElementInSortedArray //check if single Element is on left/right of midElement with off
 */


//MARK: binarySearch
//https://www.geeksforgeeks.org/problems/binary-search-1587115620/1
func binarySearchIterative(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target {
            return mid
        } else if target > nums[mid] {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return -1 // Target not found
}
//Approach = BinarySearch
//T.C = BigO(log n) //n=nums.size()
//A.S = BigO(1)


func binarySearchRecursive(_ nums: [Int], low: Int, high: Int, target: Int) -> Int {
    if low > high {
        return -1
    }
    let mid = (low + high) / 2

    if nums[mid] == target {
        return mid
    } else if target > nums[mid] {
        return binarySearchRecursive(nums, low: mid + 1, high: high, target: target)
    } else {
        return binarySearchRecursive(nums, low: low, high: mid - 1, target: target)
    }
}
//Approach = BinarySearch
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(log base2 n)


//MARK: implementLowerBound
//smallest index such that arr[index]>=x
//https://www.geeksforgeeks.org/problems/implement-lower-bound/1
func implementLowerBoundBrute(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    for i in 0..<n {
        if nums[i] >= k {
            return i
        }
    }
    return n
}
//Approach = LinearSearch
//T.C = BigO(n)
//A.S = BigO(1)


func implementLowerBoundOptimal(_ arr: [Int], _ target: Int) -> Int {
    var ans = arr.count
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = (low + high) / 2
        let midElement = arr[mid]
        if midElement >= target {
            ans = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return ans
}
//Approach = BinarySearch
//T.C = BigO(log n) //n=nums.size()
//A.S = BigO(1)


//MARK: implementUpperBound
//https://www.geeksforgeeks.org/problems/implement-upper-bound/1
//smallest index such that arr[index]>x
func implementUpperBound(_ arr: [Int], _ target: Int) -> Int {
    var ans = arr.count
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = (low + high) / 2
        let midElement = arr[mid]
        if midElement > target {
            ans = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return ans
}
//Approach:same as implementLowerBound just replace  if(arr[mid]>=target) with if(arr[mid]>target)
//T.C = BigO(log n) //n=nums.size()
//A.S = BigO(1)


//MARK: searchInsertPositionMy
//https://leetcode.com/problems/search-insert-position/description/
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    let res = implementLowerBoundOptimal(nums, target)
    return res
}
//Approach = implementLowerBound
//T.C = BigO(log n) //n=nums.size()
//A.S = BigO(1)


//MARK: ceilInAsortedArray
//implementLowerBoundOptimal
//Ceil - smallest index such that arr[index]>=x.
func ceilInAsortedArray(_ arr: [Int], _ x: Int) -> Int {
    //implementLowerBoundOptimal + (default ans = -1)
    return -1
}
//Approach = same algo of implementLowerBoundOptimal
//T.C = BigO(log n) //n=nums.size()
//A.S = BigO(1)


//MARK: findFloor
//Ceil - largest index such that arr[index]<=x.    [->*****]
//https://www.geeksforgeeks.org/problems/floor-in-a-sorted-array-1587115620/1
func findFloor(_ arr: [Int], _ x: Int) -> Int {
    var ans = -1
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = (low + high) / 2
        let midElement = arr[mid]
        if midElement <= x {
            ans = mid
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    return ans
}
//Approach = same type algo of implementLowerBoundOptimal
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)


//MARK: firstAndLastInSortedArray
//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
func firstAndLastInSortedArrayLbUb(_ nums: [Int], _ target: Int) -> [Int] {
    let lower = implementLowerBoundOptimal(nums, target)
    // Target not found or out of bounds
    if lower == nums.count || nums[lower] != target {
        return [-1,-1]
    }
    let upper = implementUpperBound(nums, target) - 1
    return [lower,upper]
}
//Approach = lowerBound + upperBound
//T.C = BigO(2(log n)) //n=nums.size()
//A.S = BigO(1)


func firstAndLastInSortedArrayStandardBS(_ nums: [Int], _ target: Int) -> [Int] {
    let firstAppearence = firstAppearenceStandardBS(nums, target)
    if firstAppearence == -1 {
        return [-1,-1]
    }
    let lastAppearence = lastAppearenceStandardBS(nums, target)
    return [firstAppearence,lastAppearence]
}
//Approach = standard BS for first and last occurence.
//T.C = BigO(2(log n)) //n=nums.size()
//A.S = BigO(1)


func firstAppearenceStandardBS(_ nums: [Int], _ target: Int) -> Int {
    var ans = -1
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target {
            ans = mid
            high = mid - 1
        } else if nums[mid] > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return ans
}


func lastAppearenceStandardBS(_ nums: [Int], _ target: Int) -> Int {
    var ans = -1
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target {
            ans = mid
            low = mid + 1
        } else if nums[mid] > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return ans
}


//MARK: numberOfOccurrence
//https://www.naukri.com/code360/problems/occurrence-of-x-in-a-sorted-array_630456
func numberOfOccurrence(_ nums: [Int], _ x: Int) -> Int {
    let firstOccurrence = firstAppearenceStandardBS(nums, x)
    if firstOccurrence == -1 {
        return 0
    }
    let lastOccurrence = lastAppearenceStandardBS(nums, x)
    return (lastOccurrence - firstOccurrence) + 1
}
//Approach = standard BS for first and last occurence.
//T.C = BigO(2(log n)) //n=nums.size()
//A.S = BigO(1)


//MARK: searchinRotatedSortedArray-UniqueElements
//https://leetcode.com/problems/search-in-rotated-sorted-array/description/
/*
 Brute = ls
 */

func searchinRotatedSortedUniqueArrayOptimal(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count-1
    while low<=high {
        let mid = (low+high) / 2
        let midElement = nums[mid]
        let lowElement = nums[low]
        let highElement = nums[high]
        if(target == midElement){
            return mid
        }else if (lowElement <= midElement) {  //check if left is sorted
            if(target >= lowElement && target <= midElement){
               high = mid - 1
            }else{
               low = mid + 1
            }
        }else{ //here right is sorted
            if(target >= midElement && target <= highElement){
                low = mid + 1
            }else{
                high = mid - 1
            }
        }
    }
    return -1
}
//Approach = standard BS + check for sorted half
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: searchinRotatedSortedArray-Dublicates
//https://leetcode.com/problems/search-in-rotated-sorted-array-ii/description/
/*
 Brute = ls
 */


func searchinRotatedSortedDublicateArrayOptimal(_ nums: [Int], _ target: Int) -> Bool {
    var low = 0
    var high = nums.count-1
    while low<=high {
        let mid = (low+high) / 2
        let midElement = nums[mid]
        let lowElement = nums[low]
        let highElement = nums[high]
        if(target == midElement){
            return true
        }else if lowElement == midElement && midElement == highElement {
            low += 1
            high -= 1
        }else if (lowElement <= midElement) {  //check if left is sorted
            if(target >= lowElement && target <= midElement){
                high = mid - 1
            }else{
                low = mid + 1
            }
        }else{  //here right is sorted
            if(target >= midElement && target <= highElement){
                low = mid + 1
            }else{
                high = mid - 1
            }
        }
    }
    return false
}
//Approach = standard BS + check for sorted half
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: minimumInRotatedSortedArray
//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/
func minimumInRotatedSortedArray(_ nums: [Int], _ target: Int) -> Int {
    var ans = Int.max
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        let midElement = nums[mid]
        let lowElement = nums[low]
        if midElement >= lowElement { //check if left is sorted
            ans = min(lowElement, ans)
            low = mid + 1
        } else { //right is sorted
            ans = min(midElement, ans)
            high = mid - 1
        }
    }
    return ans
}
//Approach = standard BS + check for sorted half
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: howManyTimesArrayRotated
//https://www.geeksforgeeks.org/problems/rotation4723/1
func howManyTimesArrayRotated(_ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count-1
    var ans = Int.max
    var ansIndex = -1
    while low<=high {
        let mid = (low+high) / 2
        let midElement = nums[mid]
        let lowElement = nums[low]
        if (lowElement <= midElement) { //check if left is sorted
            if lowElement<ans {
                ans = lowElement
                ansIndex = low
            }
           low = mid + 1
        }else{ //here right is sorted
            if midElement<ans{
                ans = midElement
                ansIndex = mid
            }
            high = mid - 1
        }
    }
    return ansIndex
}
//Approach = minimumInRotatedSortedArray
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: singleElementInSortedArray
//https://leetcode.com/problems/single-element-in-a-sorted-array/
func singleElementInSortedArrayBrute1(_ nums: [Int]) -> Int {
    let n = nums.count
    if n == 1 {
        return nums[0]
    }
    for i in 0..<n {
        if i == 0 && nums[i] != nums[i + 1] {
            return nums[i]
        } else if i == n - 1 && nums[i] != nums[i - 1] {
            return nums[i]
        } else if i > 0 && i < n - 1 && nums[i] != nums[i - 1] && nums[i] != nums[i + 1] {
            return nums[i]
        }
    }
    return -1 // If no unique element is found
}
//Approach = ls
//T.C = BigO(n)
//A.S = BigO(1)


func singleElementInSortedArrayBrute2(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums {
        res ^= num
    }
    return res
}
//Approach = ls + xor
//T.C = BigO(n)
//A.S = BigO(1)


func singleElementInSortedArrayOptimal(_ nums: [Int]) -> Int {
    let n = nums.count
    if(n==1) { return nums[0] }
    if(nums[0] != nums[1]){ return nums[0] }
    if(nums[n-1] != nums[n-2]){ return nums[n-1] }
    
    var low = 1
    var high = nums.count - 2
    while low<=high{
        let midIndex = (low+high) / 2
        let previousElement = nums[midIndex-1]
        let midElement = nums[midIndex]
        let nextElement = nums[midIndex+1]
        if (midElement != previousElement && midElement != nextElement){
            return midElement
        }
        let isMidIndexEven = (midIndex%2) == 0 ? true : false
        //check if we are in left half
        if (isMidIndexEven && nextElement == midElement) || (!isMidIndexEven && previousElement == midElement){
            low = midIndex + 1
            
        }else{ //here we are in right half
            high = midIndex - 1
        }
    }
    return -1
}
//Approach = bs + logic(odd,even index)
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: peakElement
//https://leetcode.com/problems/find-peak-element/description/
func peakElementBrute(_ nums: [Int]) -> Int {
    let n = nums.count
    // Handle index 0 separately
    if n == 1 || nums[0] > nums[1] {
        return 0
    }
    // Handle index n - 1 separately
    if nums[n - 1] > nums[n - 2] {
        return n - 1
    }
    // Check middle elements only
    for i in 1..<n - 1 {
        let previousElement = nums[i-1]
        let currentElement = nums[i]
        let nextElement = nums[i+1]
        if currentElement > previousElement && currentElement > nextElement {
            return i
        }
    }
    return -1 // Should not happen if input is valid
}
//Approach = ls
//T.C = BigO(n)
//A.S = BigO(1)


func peakElementOptimal(_ nums: [Int]) -> Int {
    let n = nums.count
    if(n==1) { return 0 }
    if(nums[0] > nums[1]){ return 0 }
    if(nums[n-1] > nums[n-2]){ return n-1 }
    
    var low = 1
    var high = nums.count - 2
    while low<=high {
        let midIndex = (low+high) / 2
        let previousElement = nums[midIndex-1]
        let midElement = nums[midIndex]
        let nextElement = nums[midIndex+1]
        if(midElement>previousElement && midElement>nextElement){
            return midIndex
        }else if midElement<nextElement {
            //mid in increasing curve
            low = midIndex + 1
        }else if midElement<previousElement{
            //mid in decreasing curve
            high = midIndex - 1
        }else{
            //there are multiple peak and mid is not in increasing or decreasing curve so we can do [low = midIndex + 1] or [high = midIndex - 1]
            low = midIndex + 1
        }
    }
    return -1
}
//Approach = bs + logic of graph with single and multiple peak
//T.C = BigO(logn)
//A.S = BigO(1)


/*
 *(BinarySearch) Interval - 1 month
 *Revise array Only With approach
 
 5 april(BinarySearch): approach + code
 
 *with code:
 searchinRotatedSortedDublicateArrayOptimal
 */
