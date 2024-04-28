//
//  Array.swift
//  dsaPractice
//
//  Created by Arbaaz Etelligens on 26/06/22.
//

import Foundation
import UIKit


class MyArray : UIViewController{
    
    
    override func viewDidLoad() {
        let array = [0,1,2,33,3,4,5]
        maxAndMinInArray(array)
        findLargestNoinArray(array)
        secondLargestNumberInArray(array)
        sumAllTheElementsOfArray(array)
        findMatchingElementsInArray(array: array)
        reverseArray()
    }
    
    
    private func maxAndMinInArray(_ givenArray : [Int]) {
        var maxNo = Int(Int64.min)
        var minNo = Int(Int64.max)
        
        for i in 0..<givenArray.count{
            if givenArray[i] > maxNo{
                maxNo = givenArray[i]
            }
            
            if givenArray[i] < minNo{
                minNo = givenArray[i]
            }
        }
        print(maxNo)
        print(minNo)
    }
    
    
    private func findLargestNoinArray(_ givenArray : [Int]) -> Int{
        var max = 0
        for i in givenArray {
            if i>max{
                max = i
            }
        }
        return max
    }
    
    
    private func secondLargestNumberInArray(_ givenArray : [Int]){
        var largest = Int(Int64.min)
        var secondLargest = Int(Int64.min)
        
        for i in 0..<givenArray.count{
            if givenArray[i] > largest{
                secondLargest = largest
                largest = givenArray[i]
            }else{
                if (givenArray[i] > secondLargest  && givenArray[i] < largest){
                    secondLargest = givenArray[i]
                }
            }
        }
        print(largest)
        print(secondLargest)
    }
    
    
    private func sumAllTheElementsOfArray(_ arr: [Int]) -> Int{
        var sum = 0
        for value in arr {
            sum = sum + value
        }
        return sum
    }
    
    
    private func findMatchingElementsInArray(array: [Int]){
        for i in 0..<array.count{
            for j in i+1..<array.count{
                if array[i] == array[j]{
                    print(array[i])
                }
            }
        }
    }
    
    
    private func reverseArray(){
        var a = [1,2,3,4,5,100,500]
        var rev = [Int]()
        for i in stride(from: (a.count-1), through: 0, by: -1){
            rev.append(a[i])
        }
        print(rev)
    }
    
    
}



