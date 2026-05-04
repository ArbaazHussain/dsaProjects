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
 
 Approximate ranges:
 - Int32  : −2^31 to 2^31 − 1
 - Int64  : −2^63 to 2^63 − 1
 - Float  : ~ ±3.4 × 10^38
 - Double : ~ ±1.7 × 10^308
 
 
 
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
