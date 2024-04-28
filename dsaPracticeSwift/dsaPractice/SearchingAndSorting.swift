//
//  SearchingAndSorting.swift
//  dsaPractice
//
//  Created by Arbaaz Etelligens on 26/06/22.
//

import Foundation
import UIKit


class searchingAndSorting : UIViewController {
    
    
    override func viewDidLoad() {
        var myTempArray = [5,6,7,1,3,2,4,6]
        selectionSort(&myTempArray)
    }
    
    
    //MARK: linearSearch
    private func linearSearch(_ arr: [Int], _ key: Int) -> Int {
        for i in 0..<arr.count {
            if key == arr[i]{
                return i
            }
        }
        return -1
    }
    
    
    //MARK: BinarySearch
    //array should be in sorted increasing order.
    private func BinarySearch(_ arr: inout [Int], _ key: Int) -> Int{
        var s = 0
        var e = arr.count-1
        
        while(s<=e){
            let mid = (s+e)/2
            if arr[mid] == key{
                return mid
            }else if key<arr[mid] {
                e = mid - 1
            }else{
                s = mid + 1
            }
        }
        return -1
    }
    
    
    //MARK: Selection sort
    //Selection sort is a sorting algorithm that selects the smallest element from an unsorted list in each iteration and places that element at the beginning of the unsorted list.
    private func selectionSort(_ arr: inout [Int]){
        for i in stride(from: 0, to: arr.count-1, by: 1){
            var min = i
            for j in stride(from: i+1, to: (arr.count), by: 1){
                if(arr[j]<arr[min]){
                    min = j
                }
            }
            let temp = arr[i]
            arr[i] = arr[min]
            arr[min] = temp
        }
        print(arr)
    }
    
    
    //MARK: bubbleSort sort
    //Bubble sort is a sorting algorithm that compares two adjacent elements and swaps them until they are in the intended order.
    private func bubbleSort(_ arr: inout [Int]){
        for i in stride(from: 0, to: arr.count-1, by: 1){
            for j in stride(from: 0, to: (arr.count-1)-i, by: 1){
                if(arr[j+1]<arr[j]){
                    let temp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        print(arr)
    }
    
    
    //MARK: insertion Sort
    //Insertion sort is a sorting algorithm that places an unsorted element at its suitable place in each iteration.
    func insertionSort(_ array: inout [Int]) {
        for i in 1..<array.count {
            let key = array[i]
            var j = i - 1
            while j >= 0 && array[j] > key {
                array[j + 1] = array[j]
                j -= 1
            }
            array[j + 1] = key
        }
        print(array)
    }
    
    
    //MARK: Heap Sort
    func HeapSort<T: Comparable>(_ array: [T]){
        
    }
    
    //MARK: Quick Sort
    //QuickSort is a sorting algorithm based on the Divide and Conquer algorithm that picks an element as a pivot and partitions the given array and then sort the array.
    func quickSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count / 2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return quickSort(less) + equal + quickSort(greater)
    }
    
    

    //MARK: Merge Sort
    //Merge sort is defined as a sorting algorithm that works by dividing an array into smaller subarrays, sorting each subarray, and then merging the sorted subarrays
    func merge(left:[Int],right:[Int]) -> [Int] {
        var mergedList = [Int]()
        var left = left
        var right = right
        
        while left.count > 0 && right.count > 0 {
            if left.first! < right.first! {
                mergedList.append(left.removeFirst())
            } else {
                mergedList.append(right.removeFirst())
            }
        }
        return mergedList + left + right
    }
    
    func mergeSort(list:[Int]) -> [Int] {
        guard list.count > 1 else {
            return list
        }
        let leftList = Array(list[0..<list.count/2])
        let rightList = Array(list[list.count/2..<list.count])
        return merge(left: mergeSort(list:leftList), right: mergeSort(list:rightList))
    }
    
    
    
    
    
    
    
}




