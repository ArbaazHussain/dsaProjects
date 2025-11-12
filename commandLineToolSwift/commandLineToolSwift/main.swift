//
//  main.swift
//  commandLineToolSwift
//
//  Created by ekincare on 20/11/23.
//

import Foundation

let arr1 = [2,1]
let res = findPeakElement(arr1)
print(res)


func findPeakElement(_ nums: [Int]) -> Int {
    let n = nums.count
    if(n==1) { return 0 }
    if(nums[0] > nums[1]){ return 0 }
    if(nums[n-1] > nums[n-2]){ return n-1 }
    var low = 1
    var high = n-2
    while low <= high {
        let mid = (low+high) / 2
        let midElement = nums[mid]
        let prevElement = nums[mid-1]
        let nextElement = nums[mid+1]
        if midElement>prevElement && midElement>nextElement{
            return mid
        }else if midElement>prevElement && midElement<nextElement {
            low = mid + 1
        }else if midElement < prevElement && midElement > nextElement{
            high = mid - 1
        }else{
            low = mid + 1
        }
    }
    return -1
}

