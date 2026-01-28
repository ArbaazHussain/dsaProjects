//
//  Untitled.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 07/09/25.
//

/*
 Precision Datatype in Swift =>
 Double > Float > (Int64>Int32>Int16>Int8) > Character

 Notes:
 - Swift does not have `long`, `long long` separately, Instead, it provides fixed-size integers: Int8, Int16, Int32, Int64.
 - `Int` is platform dependent (32-bit on 32-bit systems, 64-bit on 64-bit systems).
 - Character in Swift is Unicode scalar-based, not just ASCII (more powerful than C++ char).

 Operator Precedence in Swift =>
 * Swift also follows precedence and associativity rules similar to BODMAS.
 * Multiplication (*) and Division (/) share the same precedence and are evaluated left to right.
 * Addition (+) and Subtraction (-) also share precedence, evaluated left to right.

 Operators        | Precedence   | Associativity
 ---------------------------------------------------
 () (parentheses) | Highest      | Left to right
 * / %            | High         | Left to right
 + -              | Medium       | Left to right
 =                | Low          | Right to left

 Overflow ranges in Swift =>
 - Swift integers are exact-sized, and overflow will cause runtime error
   (unless you use &+, &-, &* operators for overflow-safe wrapping).
 
 Approximate Ranges:
 Int32       -> -2,147,483,648  to  2,147,483,647
 Int64       -> -9,223,372,036,854,775,808  to  9,223,372,036,854,775,807
 Float       -> ~ ±3.4e38
 Double      -> ~ ±1.7e308
 
 
 
 /*
  DICTIONARY:
  - A Dictionary is a collection of key–value pairs, where each key is unique and is used to access its value.
  - Swift Dictionary is unordered by default, If you need ordered behavior (like C++ std::map), store values in a Dictionary and sort the keys when iterating.
  - Dictionary is the preferred choice, since worst-case O(n) lookups
  are rare and average-case performance is O(1).
  
  Operation                   | Average Case | Worst Case
  --------------------------------------------------------
  Insert / Update (dict[key]) | O(1)         | O(n)
  Lookup   (dict[key])        | O(1)         | O(n)
  Remove   (dict.removeValue) | O(1)         | O(n)
  Count (dict.count)          | O(1)         | O(1)
  Iteration (for in)          | O(n)         | O(n)
  
  
  SET:
  Set is an unordered collection of unique values (no duplicates).
  | Operation                                   |    Average Case     | Worst case |
  | ------------------------------------------- | ------------------: | ---------: |
  | Insert (`set.insert(element)`)              |            **O(1)** |   **O(n)** |
  | Lookup / Contains (`set.contains(element)`) |            **O(1)** |   **O(n)** |
  | Remove (`set.remove(element)`)              |            **O(1)** |   **O(n)** |
  | Count (`set.count`)                         |            **O(1)** |   **O(1)** |
  | Iteration (`for in set`)                    |            **O(n)** |   **O(n)** |
  | Union / Intersection / Subtract             |            **O(n)** |   **O(n)** |
  */

*/




//MARK: HOF
extension Array {
    func myCustomFilter(isIncluded: (Element)->Bool) -> [Element]{
        var result = [Element]()
        for item in self {
            let isIncluded = isIncluded(item)
            if isIncluded {
                result.append(item)
            }
        }
        return result
    }
    func myCustomMap<T>(transformedElement: (Element)->T) -> [T]{
        var result = [T]()
        for item in self {
            result.append(transformedElement(item))
        }
        return result
    }
    func myCustomCompactMap<T>(transformedElement: (Element)->(T?)) -> [T]{
        var result = [T]()
        for item in self {
            if let transformedElement = transformedElement(item) {
                result.append(transformedElement)
            }
        }
        return result
    }
    func myCustomFlatMap<T>(transformedElement: (Element)->[T]) -> [T]{
        var result = [T]()
        for item in self {
            let transformedEl = transformedElement(item)
            result.append(contentsOf: transformedEl)
        }
        return result
    }
}

//let array = [[1,2,3], [4,5,6]]
//let a = array.myCustomFlatMap { element in
//    element
//}
//print(a)
