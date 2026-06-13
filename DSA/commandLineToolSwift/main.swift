//
//  main.swift
//  commandLineToolSwift
//
//  Created by ekincare on 20/11/23.
//

import Foundation

var array = [0,0,0]
let res = subarraySum(array, 0)
print(res)

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var res = 0
    var prefixSum = 0
    //[x-k, freq]
    var hashMap = [Int:Int]()
    
    for i in 0..<nums.count {
        let current = nums[i]
        prefixSum += current
        
        if prefixSum == k {
            res += 1
        }
        
        let toFind = prefixSum - k
        if let toFindFreq = hashMap[toFind] {
            res += toFindFreq
        }
        
        hashMap[prefixSum, default: 0] += 1
    }
    
    return res
}
