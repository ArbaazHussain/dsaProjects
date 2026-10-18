//
//  main.swift
//  commandLineToolSwift
//
//  Created by ekincare on 20/11/23.
//

import Foundation

let array1 = [1,0,1,1,1]
let array2 = [-3,-1,-1]
let c = [0,2]
let arrayString = ["1","2","3"]
let str = "abc"


let res = search(array1, 0)
print(res)



func search(_ nums: [Int], _ target: Int) -> Bool {
    let n = nums.count
    var low = 0
    var high = n-1
    while low <= high {
        let mid = (low+high) / 2
        let midEl = nums[mid]
        let lowEl = nums[low]
        let highEl = nums[high]
        if midEl == target {
            return true
        }else if lowEl == midEl && midEl == highEl {
            low += 1
            high -= 1
        }else if lowEl <= midEl{
            if target >= lowEl && target <= midEl {
                high = mid - 1
            }else{
                low = mid + 1
            }
        }else{
            if target >= midEl && target <= highEl {
                low = mid + 1
            }else{
                high = mid - 1
            }
        }
    }
    return false
}
