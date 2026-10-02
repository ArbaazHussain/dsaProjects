//
//  PrefixInfixPostfixConversion.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 02/10/26.
//

import Foundation

//https://youtu.be/4pIc9UBHJtk?si=6DKSL9tpWB-g80U2


//MARK: InfixToPostfix
func infixToPostfix(_ s: String) -> String {
    var st: [Character] = [] // Array acting as our stack
    var result = ""
    
    for c in s {
        // If the scanned character is an operand, add it to the result string
        if c.isLetter || c.isNumber {
            result.append(c)
        }
        // If the scanned character is an '(', push it to the stack
        else if c == "(" {
            st.append(c)
        }
        // If the scanned character is a ')', pop from stack until an '(' is encountered
        else if c == ")" {
            while let top = st.last, top != "(" {
                result.append(st.removeLast())
            }
            st.removeLast() // Pop the '(' from the stack
        }
        // If an operator is scanned
        else {
            while let top = st.last, prec(c) <= prec(top) {
                result.append(st.removeLast())
            }
            st.append(c) // Push the current operator to the stack
        }
    }
    
    // Pop all the remaining elements from the stack
    while !st.isEmpty {
        result.append(st.removeLast())
    }
    return result
}
/*
 T.C = O(N) // We iterate through the string of length N once, and each character is pushed/popped at most once.
 A.S = O(N) // The stack and the result string take up to N space.
 
 
 APPROACH:
 Precedence: ^  >  * , /  >  + , -
 
 Traverse the string character by character ('c'). For each character, apply one of 4 rules:
 
 1. OPERAND (a-z, A-Z, 0-9):
 -> Add directly to Output: result.append(c)
 
 2. OPEN BRACKET '(':
 -> Push directly to Stack: st.append(c)
 
 3. CLOSE BRACKET ')':
 -> Pop from Stack ('st') to Output ('result') until you hit an '('.
 -> Pop and discard the '(' from the stack.
 
 4. OPERATOR (+, -, *, /, ^):
 -> Condition: WHILE Stack ('st') is NOT empty AND Stack Top Precedence >= Current Operator Precedence.
 -> Pop from Stack to Output: result.append(st.removeLast())
 -> After the loop finishes: Push the current Operator 'c' to Stack: st.append(c)
 
 FINAL CLEANUP:
 When the string traversal is done, pop everything remaining in the Stack ('st') to the Output ('result').
 
 
 Testing:
 let exp = "(p+q)*(m-n)"
 print("Infix expression: \(exp)")
 let postfix = infixToPostfix(exp)
 print("Postfix expression: \(postfix)")
 */


//MARK: InfixToPrefix
func infixToPrefix(_ s: String) -> String {
    // 1. Reverse the original string
    let reversedInfix = String(s.reversed())
    
    // 2. Swap the brackets (Safely, without the i++ skip bug)
    var modifiedInfix = ""
    for c in reversedInfix {
        if c == "(" {
            modifiedInfix.append(")")
        } else if c == ")" {
            modifiedInfix.append("(")
        } else {
            modifiedInfix.append(c)
        }
    }
    
    // 3. Apply Modified Infix-to-Postfix Logic
    var st: [Character] = []
    var postfix = ""
    
    for c in modifiedInfix {
        // OPERAND
        if c.isLetter || c.isNumber {
            postfix.append(c)
        }
        // OPEN BRACKET
        else if c == "(" {
            st.append(c)
        }
        // CLOSE BRACKET
        else if c == ")" {
            while let top = st.last, top != "(" {
                postfix.append(st.removeLast())
            }
            if !st.isEmpty { st.removeLast() } // Pop the '('
        }
        // OPERATOR
        else {
            // Right-Associative ('^') becomes Left-Associative
            if c == "^" {
                while let top = st.last, top != "(", prec(c) <= prec(top) {
                    postfix.append(st.removeLast())
                }
            }
            // Left-Associative (+, -, *, /) becomes Right-Associative
            else {
                while let top = st.last, top != "(", prec(c) < prec(top) {
                    postfix.append(st.removeLast())
                }
            }
            st.append(c) // Push current operator
        }
    }
    
    // Pop remaining operators
    while !st.isEmpty {
        postfix.append(st.removeLast())
    }
    
    // 4. Reverse the final postfix result to get the prefix expression
    return String(postfix.reversed())
}
/*
 T.C = O(N) // Reversing and traversing the string of length N takes O(N) time.
 A.S = O(N) // The stack and intermediate strings take up to O(N) space.
 
 
 Approach:
 Precedence: ^  >  * , /  >  + , -
 
 RULE OF THUMB: Reverse -> Swap Brackets -> Modified Postfix -> Reverse
 
 STEP 1: Reverse the original Infix string.
 
 STEP 2: Swap every '(' with ')' and every ')' with '('.
 
 STEP 3: Run the Infix-to-Postfix algorithm, but with a CRITICAL PRECEDENCE FLIP:
 (Because the string is reversed, operator associativity works backwards)
 
 Traverse the modified string character by character ('c'):
 1. OPERAND: Add to Output ('postfix').
 2. OPEN '(': Push to Stack ('st').
 3. CLOSE ')': Pop from Stack to Output until '('. Discard '('.
 4. OPERATOR (+, -, *, /, ^):
 -> For standard operators (+, -, *, /):
 Condition: WHILE Stack is not empty AND Stack Top Precedence > Current Precedence
 (Code: prec(c) < prec(top))  // <--- STRICTLY LESS THAN
 -> For Exponent (^):
 Condition: WHILE Stack is not empty AND Stack Top Precedence >= Current Precedence
 (Code: prec(c) <= prec(top)) // <--- LESS THAN OR EQUAL TO
 -> Pop to Output. Then Push 'c' to Stack.
 
 Cleanup: Pop everything remaining in Stack to Output.
 
 STEP 4: Reverse the Output string. This final reversed string is your Prefix answer!
 
 
 Testing:
 let exp = "(p+q)*(c-d)"
 print("Infix expression: \(exp)")
 let prefix = infixToPrefix(exp)
 print("Prefix expression: \(prefix)") // Output: *+pq-cd
 */


//MARK: PostfixToInfix
func postfixToInfix(_ s: String) -> String {
    var st: [String] = [] // Stack to hold intermediate infix strings
    
    for c in s {
        // 1. If the character is an operand, push it to the stack as a String
        if c.isLetter || c.isNumber {
            st.append(String(c))
        }
        // 2. If the character is an operator
        else {
            // Pop the top two operands.
            // NOTE: The first pop is the RIGHT operand, the second pop is the LEFT operand.
            if let operand2 = st.popLast(), let operand1 = st.popLast() {
                
                // Combine them with the operator in the middle and wrap in parentheses
                let newExpr = "(" + operand1 + String(c) + operand2 + ")"
                
                // Push the newly formed expression back to the stack
                st.append(newExpr)
            }
        }
    }
    // The final remaining element in the stack is the complete infix expression
    return st.last ?? ""
}
/*
 T.C = O(N) // We traverse the string of length N exactly once.
 A.S = O(N) // The stack holds the strings, which collectively take up to O(N) memory.
 
 
 Approach:
 Data Structure: Stack of STRINGS (not Characters)
 RULE OF THUMB: Operand -> Push | Operator -> Pop Two & Combine
 
 Traverse the Postfix string left to right, character by character ('c'):
 
 1. OPERAND (a-z, A-Z, 0-9):
 -> Convert to String and Push directly to the Stack ('st').
 
 2. OPERATOR (+, -, *, /, ^):
 -> Pop the top element: This is operand2 (the RIGHT side).
 -> Pop the next element: This is operand1 (the LEFT side).
 -> Combine them: "(" + operand1 + operator + operand2 + ")"
 -> Push this new combined string back onto the Stack.
 
 FINAL RESULT:
 When the string traversal is complete, the Stack will contain exactly ONE element.
 Pop it. That string is your final Infix expression!
 
 =============================================================================
 EXECUTION TRACE (Example: ab+c*)
 =============================================================================
 'a' -> Push "a"          | Stack: ["a"]
 'b' -> Push "b"          | Stack: ["a", "b"]
 '+' -> Pop "b", Pop "a"  | Combine: "(a+b)"  | Push "(a+b)"  | Stack: ["(a+b)"]
 'c' -> Push "c"          | Stack: ["(a+b)", "c"]
 '*' -> Pop "c", Pop "(a+b)" | Combine: "((a+b)*c)" | Push "((a+b)*c)"
 Result: "((a+b)*c)"
 
 
 Testing:
 let postfixExp = "pq+mn-*"
 print("Postfix expression: \(postfixExp)")
 let infix = postfixToInfix(postfixExp)
 print("Infix expression: \(infix)") // Output: ((p+q)*(m-n))
 */


//MARK: PrefixToInfix
func prefixToInfix(_ s: String) -> String {
    var st: [String] = [] // Stack to hold intermediate infix strings
    
    // 1. Traverse the prefix string in REVERSE (Right to Left)
    for c in s.reversed() {
        
        // 2. If the character is an operand, push it to the stack as a String
        if c.isLetter || c.isNumber {
            st.append(String(c))
        }
        // 3. If the character is an operator
        else {
            // Pop the top two operands.
            // NOTE: Because we are reading right-to-left, the FIRST pop is the LEFT operand (operand1),
            // and the SECOND pop is the RIGHT operand (operand2). This is opposite to Postfix!
            if let operand1 = st.popLast(), let operand2 = st.popLast() {
                
                // Combine them with the operator in the middle and wrap in parentheses
                let newExpr = "(" + operand1 + String(c) + operand2 + ")"
                
                // Push the newly formed expression back to the stack
                st.append(newExpr)
            }
        }
    }
    // The final remaining element in the stack is the complete infix expression
    return st.last ?? ""
}
/*
 T.C = O(N) // We traverse the string of length N exactly once.
 A.S = O(N) // The stack holds the strings, which collectively take up to O(N) memory.
 
 Approach:
 Data Structure: Stack of STRINGS (not Characters)
 
 RULE OF THUMB: Read REVERSE -> Operand = Push | Operator = Pop Two (Left then Right)
 
 Traverse the Prefix string RIGHT TO LEFT (Reverse order), character by character ('c'):
 
 1. OPERAND (a-z, A-Z, 0-9):
 -> Convert to String and Push directly to the Stack ('st').
 
 2. OPERATOR (+, -, *, /, ^):
 -> Pop the top element: This is operand1 (the LEFT side).
 -> Pop the next element: This is operand2 (the RIGHT side).
 -> Combine them: "(" + operand1 + operator + operand2 + ")"
 -> Push this new combined string back onto the Stack.
 
 FINAL RESULT:
 When the string traversal is complete, the Stack will contain exactly ONE element.
 Pop it. That string is your final Infix expression!
 
 =============================================================================
 EXECUTION TRACE (Example: *+ab c)  <-- reading from right to left!
 =============================================================================
 'c' -> Push "c"          | Stack: ["c"]
 'b' -> Push "b"          | Stack: ["c", "b"]
 'a' -> Push "a"          | Stack: ["c", "b", "a"]
 '+' -> Pop "a", Pop "b"  | Combine: "(a+b)"  | Push "(a+b)"  | Stack: ["c", "(a+b)"]
 '*' -> Pop "(a+b)", Pop "c" | Combine: "((a+b)*c)" | Push "((a+b)*c)"
 Result: "((a+b)*c)"
 
 
 Testing:
 let prefixExp = "*+pq-mn"
 print("Prefix expression: \(prefixExp)")
 let infix = prefixToInfix(prefixExp)
 print("Infix expression: \(infix)") // Output: ((p+q)*(m-n))
 */


//MARK: PostfixToPrefix
// Main function to convert Postfix to Prefix
func postfixToPrefix(_ s: String) -> String {
    var st: [String] = [] // Stack to hold intermediate prefix strings
    
    // 1. Traverse the postfix string from Left to Right
    for c in s {
        
        // 2. If the character is an operand, push it to the stack as a String
        if c.isLetter || c.isNumber {
            st.append(String(c))
        }
        // 3. If the character is an operator
        else {
            // Pop the top two operands.
            // NOTE: The first pop is the RIGHT operand, the second pop is the LEFT operand.
            if let operand2 = st.popLast(), let operand1 = st.popLast() {
                
                // Combine them in PREFIX format: Operator first, then Left, then Right.
                // Notice there are no parentheses needed in Prefix!
                let newExpr = String(c) + operand1 + operand2
                
                // Push the newly formed expression back to the stack
                st.append(newExpr)
            }
        }
    }
    // The final remaining element in the stack is the complete prefix expression
    return st.last ?? ""
}
/*
 T.C = O(N) // We traverse the string of length N exactly once.
 A.S = O(N) // The stack holds the strings, which collectively take up to O(N) memory.
 
 Approach:
 Data Structure: Stack of STRINGS (not Characters)
 
 RULE OF THUMB: Operand -> Push | Operator -> Pop Two & Put Operator First
 
 Traverse the Postfix string LEFT TO RIGHT, character by character ('c'):
 
 1. OPERAND (a-z, A-Z, 0-9):
 -> Convert to String and Push directly to the Stack ('st').
 
 2. OPERATOR (+, -, *, /, ^):
 -> Pop the top element: This is operand2 (the RIGHT side).
 -> Pop the next element: This is operand1 (the LEFT side).
 -> Combine them PREFIX style: operator + operand1 + operand2
 -> Push this new combined string back onto the Stack.
 
 FINAL RESULT:
 When the string traversal is complete, the Stack will contain exactly ONE element.
 Pop it. That string is your final Prefix expression!
 
 =============================================================================
 EXECUTION TRACE (Example: ab+c*)
 =============================================================================
 'a' -> Push "a"          | Stack: ["a"]
 'b' -> Push "b"          | Stack: ["a", "b"]
 '+' -> Pop "b", Pop "a"  | Combine: "+ab"    | Push "+ab"    | Stack: ["+ab"]
 'c' -> Push "c"          | Stack: ["+ab", "c"]
 '*' -> Pop "c", Pop "+ab"| Combine: "*+abc"  | Push "*+abc"  | Stack: ["*+abc"]
 Result: "*+abc"
 
 
 Testing:
 let postfixExp = "pq+mn-*"
 print("Postfix expression: \(postfixExp)")
 let prefix = postfixToPrefix(postfixExp)
 print("Prefix expression: \(prefix)") // Output: *+pq-mn
 */


//MARK: PrefixToPostfix
func prefixToPostfix(_ s: String) -> String {
    var st: [String] = [] // Stack to hold intermediate postfix strings
    
    // 1. Traverse the prefix string in REVERSE (Right to Left)
    for c in s.reversed() {
        
        // 2. If the character is an operand, push it to the stack as a String
        if c.isLetter || c.isNumber {
            st.append(String(c))
        }
        // 3. If the character is an operator
        else {
            // Pop the top two operands.
            // NOTE: Because we are reading right-to-left, the FIRST pop is the LEFT operand (operand1),
            // and the SECOND pop is the RIGHT operand (operand2).
            if let operand1 = st.popLast(), let operand2 = st.popLast() {
                
                // Combine them in POSTFIX format: Left first, then Right, then Operator.
                // No parentheses needed!
                let newExpr = operand1 + operand2 + String(c)
                
                // Push the newly formed expression back to the stack
                st.append(newExpr)
            }
        }
    }
    
    // The final remaining element in the stack is the complete postfix expression
    return st.last ?? ""
}
/*
 T.C = O(N) // We traverse the string of length N exactly once.
 A.S = O(N) // The stack holds the strings, which collectively take up to O(N) memory.
 
 Approach:
 Data Structure: Stack of STRINGS (not Characters)
 
 RULE OF THUMB: Read REVERSE -> Operand = Push | Operator = Pop Two & Put Operator Last
 
 Traverse the Prefix string RIGHT TO LEFT (Reverse order), character by character ('c'):
 
 1. OPERAND (a-z, A-Z, 0-9):
 -> Convert to String and Push directly to the Stack ('st').
 
 2. OPERATOR (+, -, *, /, ^):
 -> Pop the top element: This is operand1 (the LEFT side).
 -> Pop the next element: This is operand2 (the RIGHT side).
 -> Combine them POSTFIX style: operand1 + operand2 + operator
 -> Push this new combined string back onto the Stack.
 
 FINAL RESULT:
 When the string traversal is complete, the Stack will contain exactly ONE element.
 Pop it. That string is your final Postfix expression!
 
 =============================================================================
 EXECUTION TRACE (Example: *+ab c)  <-- reading from right to left!
 =============================================================================
 'c' -> Push "c"          | Stack: ["c"]
 'b' -> Push "b"          | Stack: ["c", "b"]
 'a' -> Push "a"          | Stack: ["c", "b", "a"]
 '+' -> Pop "a", Pop "b"  | Combine: "ab+"    | Push "ab+"    | Stack: ["c", "ab+"]
 '*' -> Pop "ab+", Pop "c"| Combine: "ab+c*"  | Push "ab+c*"  | Stack: ["ab+c*"]
 Result: "ab+c*"
 
 
 Testing:
 let prefixExp = "*+pq-mn"
 print("Prefix expression: \(prefixExp)")
 let postfix = prefixToPostfix(prefixExp)
 print("Postfix expression: \(postfix)") // Output: pq+mn-*
 */
