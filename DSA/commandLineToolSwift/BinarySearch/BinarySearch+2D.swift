//
//  BinarySearch+2D.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 09/02/26.
//

import Foundation


//MARK: rowsWithMaximumOnes
func rowsWithMaximumOnesBrute(arr: [[Int]]) -> Int{
    var maxRes : (row: Int, count : Int) = (-1,-1)
    for i in 0..<arr.count {
        var count = 0
        for j in 0..<arr[0].count{
            if arr[i][j] == 1 {
                count += 1
            }
        }
        if count > maxRes.count {
            maxRes = (row: i, count: count)
        }
    }
    return maxRes.row
}
//Approach = ls
//T.C = BigO(n*m)
//A.S = BigO(1)


func rowsWithMaximumOnesOptimal(arr: [[Int]]) -> Int{
    var maxRes : (row: Int, count : Int) = (-1,-1)
    for i in 0..<arr.count {
        let firstAppear = firstAppearenceStandardBS(arr[i], 1)
        if firstAppear != -1 {
            let count = arr[i].count - firstAppear
            if count > maxRes.count {
                maxRes = (row: i, count: count)
            }
        }
    }
    return maxRes.row
}
//Approach = ls+bs
//T.C = BigO(n*log(m))
//A.S = BigO(1)


func searchMatrixBrute(_ matrix: [[Int]], _ target: Int) -> Bool {
    return false
}
//Approach = ls
//T.C = BigO(n*m)
//A.S = BigO(1)


func searchMatrixBetter(_ matrix: [[Int]], _ target: Int) -> Bool {
    let row = matrix.count
    let col = matrix[0].count
    var i = 0
    var j = col - 1
    while i < row && j >= 0 {
        let current = matrix[i][j]
        if target == current {
            return true
        }else if target > current {
            i += 1
        }else{
            j -= 1
        }
    }
    return false
}
//Approach = traverse from topRight
//T.C = BigO(n*log(m))
//A.S = BigO(1)


func searchMatrixOptimal(_ matrix: [[Int]], _ target: Int) -> Bool {
    return false
}
//Approach = bs
//T.C = BigO()
//A.S = BigO(1)
