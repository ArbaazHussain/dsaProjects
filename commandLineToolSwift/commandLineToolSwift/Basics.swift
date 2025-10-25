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
 - Swift does not have `long`, `long long` separately.
 - Instead, it provides fixed-size integers: Int8, Int16, Int32, Int64.
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
*/
