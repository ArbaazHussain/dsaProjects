//
//  Untitled.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 17/08/25.
//


//MARK: basicHashingIntegers
func basicHashingIntegers(givenArray: [Int], atMax: Int, noOfQuery: Int) {
    // Initialize hash array with zeros
    var hashArray = Array(repeating: 0, count: atMax + 1)
    
    // Prefetch: count frequency of each element
    for element in givenArray {
        if element >= 0 && element <= atMax {
            hashArray[element] += 1
        }
    }
    // Fetch: process queries
    var queriesLeft = noOfQuery
    while queriesLeft > 0 {
        print("Enter Query:")
        if let input = readLine(), let number = Int(input) {
            if number >= 0 && number <= atMax {
                print("Output -> \(hashArray[number])")
            } else {
                print("Number out of range")
            }
        } else {
            print("Invalid input")
        }
        queriesLeft -= 1
    }
}
/*
 Usage:
 let arr = [1, 3, 2, 3, 5, 1, 3]
 basicHashingIntegers(givenArray: arr, atMax: 5, noOfQuery: 3)
 
 //T.C = O(n+q) - where n = givenArray.count, q = noOfQuery
 //A.S = BigO(n)
 */


// MARK: - basicHashingIntegersWithMapsOrDictionary
/*
 - In Swift, Dictionary<Key, Value> is a hash-based collection,similar to C++ unordered_map.
 - Swift Dictionary is unordered by default.
 - If you need ordered behavior (like C++ std::map),
 store values in a Dictionary and sort the keys when iterating.
 - Swift does not provide a built-in ordered map type.
 - Dictionary is the preferred choice, since worst-case O(n) lookups
 are rare and average-case performance is O(1).
 
 Operation                   | Average Case | Worst Case
 --------------------------------------------------------
 Insert / Update (dict[key]) | O(1)         | O(n)
 Lookup   (dict[key])        | O(1)         | O(n)
 Remove   (dict.removeValue) | O(1)         | O(n)
 Count (dict.count)          | O(1)         | O(1)
 Iteration (for in)          | O(n)         | O(n)
 */

func basicHashingIntegersWithMapsOrDictionary(givenArray: [Int], noOfQuery: Int) {
    var mpp: [Int: Int] = [:]   // Dictionary<Int, Int>
    
    // prefetch / storing
    for num in givenArray {
        mpp[num, default: 0] += 1
        /*
         Storing:
         Dictionary (Hash Map in Swift):
         - Best/Average: O(1) per insert → O(n) total
         - Worst: O(n) per insert → O(n^2) total (rare)
         */
    }
    
    // iterate over dictionary (unordered)
    // for (key, value) in mpp {
    //     print("Key: \(key), Value: \(value)")
    // }
    
    // fetch
    var queriesLeft = noOfQuery
    while queriesLeft > 0 {
        print("Enter Query:")
        if let input = readLine(), let number = Int(input) {
            let result = mpp[number, default: 0]
            print("Output -> \(result)")
            /*
             Fetching:
             Dictionary (Hash Map in Swift):
             - Best/Average: O(1) per query
             - Worst: O(n) per query
             */
        }
        queriesLeft -= 1
    }
}
//T.C = O(n+q) - where n = givenArray.count, q = noOfQuery
//A.S = BigO(n)
 
 
 
