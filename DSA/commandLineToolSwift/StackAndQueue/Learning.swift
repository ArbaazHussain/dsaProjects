//
//  Stack.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 15/10/25.
//

import Foundation

/*
 Stack Operations- Push    , Pop    , Top  , size  ,isEmpty
 Queue Operations- enqueue , dequeue, front, size  ,isEmpty
 */



//MARK: StackUsingArray
struct StackUsingArray<T> {
    private var elements = [T]()
    
    /// Push an element onto the stack
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    /// Pop the top element from the stack
    mutating func pop() -> T?{
        elements.popLast()
    }
    
    /// Peek at the top element without removing it
    func top() -> T? {
        return elements.last
    }
    
    /// Get the number of elements in the stack
    var size : Int {
        elements.count
    }
    
    /// Check if the stack is empty
    var isEmpty : Bool {
        elements.isEmpty
    }
    
    /// Optional: Clear all elements
    mutating func clear() {
        elements.removeAll()
    }
}


//MARK: QueueUsingArray
struct QueueUsingArray<T> {
    private var elements: [T] = []
    private var head = 0
    
    /// Adds an element to the end of the queue.
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    /// Removes and returns the front element from the queue. Returns nil if the queue is empty.
    mutating func dequeue() -> T? {
        guard head < elements.count else { return nil }
        
        let value = elements[head]
        head += 1
        
        // Cleanup: if we've dequeued more than half of a large array, free memory
        if elements.count > 100 {
            if head > elements.count / 2 {
                elements.removeFirst(head)
                head = 0
            }
        }
        return value
    }
    
    /// Returns the front element without removing it.
    func front() -> T? {
        return isEmpty ? nil : elements[head]
    }
    
    /// Returns the number of elements in the queue.
    var size: Int {
        return elements.count - head
    }
    
    /// Returns true if the queue is empty.
    var isEmpty: Bool {
        return head >= elements.count
    }
    
    /// Optional: Clear all elements
    mutating func clear() {
        elements.removeAll()
        head = 0
    }
}


//MARK: StackUsingLinkedList
struct StackUsingLinkedList<T> {
    private var head: GenericLLNode<T>? = nil
    private var count: Int = 0
    
    /// Push an element onto the stack
    mutating func push(_ value: T) {
        let newNode = GenericLLNode(value: value, next: head)
        head = newNode
        count += 1
    }
    
    /// Pop the top element from the stack. Returns nil if empty.
    mutating func pop() -> T? {
        guard let currentHead = head else {
            return nil // Stack underflow
        }
        head = currentHead.next
        count -= 1
        return currentHead.value
    }
    
    /// Peek at the top element without removing it
    func top() -> T? {
        return head?.value
    }
    
    /// Returns the number of elements in the stack.
    var size: Int {
        return count
    }
    
    /// Check if the stack is empty
    var isEmpty: Bool {
        return head == nil
    }
    
    /// Optional: Clear all elements
    mutating func clear() {
        head = nil
        count = 0
    }
}


//MARK: QueueUsingLinkedList
struct QueueUsingLinkedList<T> {
    private var head: GenericLLNode<T>? = nil
    private var tail: GenericLLNode<T>? = nil
    private var count: Int = 0
    
    /// Enqueue: Add an element to the end of the queue
    mutating func enqueue(_ value: T) {
        let newNode = GenericLLNode(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            // If the queue was empty, newNode is now head as well
            head = newNode
        }
        tail = newNode
        count += 1
    }
    
    /// Dequeue: Remove and return the front element of the queue
    mutating func dequeue() -> T? {
        guard let headNode = head else {
            return nil // Queue is empty
        }
        
        head = headNode.next
        
        // If the queue is now empty after removing last element, update tail to nil
        if head == nil {
            tail = nil
        }
        count -= 1
        return headNode.value
    }
    
    /// Peek: Return the front element without removing it
    func peek() -> T? {
        return head?.value
    }
    
    /// Number of elements in the queue
    var size: Int {
        return count
    }
    
    /// Check if the queue is empty
    var isEmpty: Bool {
        return head == nil
    }
    
    /// Optional: Clear all elements
    mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
}


//MARK: MinStack
//https://leetcode.com/problems/min-stack/description/
class MinStack {
    init() {}
    private var stack = [(val: Int, min: Int)]()
    
    func push(_ val: Int) {
        if stack.count == 0 {
            stack.append((val,val))
        }else{
            let currentMin = stack.last?.min ?? val
            stack.append((val, min(val, currentMin)))
        }
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        stack.last?.val ?? -1
    }
    
    func getMin() -> Int {
        stack.last?.min ?? -1
    }
}
//Approach: push elements in stack with recent min
//T.C = BigO(1)
//A.S = BigO(n)


//MARK: StackUsingQueue
//https://youtu.be/tqQ5fTamIN4?si=mjxUNuDHkWoMBrku
//https://leetcode.com/problems/implement-stack-using-queues
//Approach: Use Array to simulate a Queue
struct StackUsingQueue {
    private var queue = [Int]()  // Use Array to simulate a Queue
    
    mutating func push(_ x: Int) {
        let size = queue.count
        queue.append(x)
        
        //bring old element to the last
        for _ in 0..<size {
            queue.append(queue.removeFirst())
        }
    }
    
    mutating func pop() -> Int {
        return queue.removeFirst()
    }
    
    func top() -> Int {
        return queue.first ?? -1
    }
    
    func empty() -> Bool {
        queue.isEmpty
    }
}


//MARK: QueueUsingStacks
//https://youtu.be/tqQ5fTamIN4?si=mjxUNuDHkWoMBrku
//https://leetcode.com/problems/implement-queue-using-stacks
/*
 Approach: Use Array to simulate a Queue
 Steps:
 inputStack -> outputStack
 data -> inputStack
 outputStack -> inputStack
*/
class QueueUsingStacks {
    private var inputStack = [Int]()
    private var outputStack = [Int]()
    
    func push(_ x: Int) {
        // Move all from inputStack → outputStack
        while let top = inputStack.popLast() {
            outputStack.append(top)
        }
        
        // Push the new data into inputStack
        inputStack.append(x)
        
        // Move everything back to inputStack
        while let top = outputStack.popLast() {
            inputStack.append(top)
        }
    }
    
    func pop() -> Int {
        return inputStack.popLast() ?? -1
    }
    
    func peek() -> Int {
        guard let top = inputStack.last else {
            return -1
        }
        return top
    }
    
    func empty() -> Bool {
        inputStack.isEmpty
    }
}


//MARK: Picked----------------



//MARK: isValidParentheses
//https://youtu.be/TaWs8tIrnoA?si=6JXuoFsnl5AHUEwl
//https://leetcode.com/problems/valid-parentheses
func isValidParentheses(_ s: String) -> Bool {
    var stack: [Character] = []
    for c in s {
        if c == "(" {
            stack.append(")")
        } else if c == "{" {
            stack.append("}")
        } else if c == "[" {
            stack.append("]")
        }else{
            let top = stack.popLast()
            if c != top{
                return false
            }
        }
    }
    return stack.isEmpty
}
/*
 Approach =
 For every opening bracket,add its relative closing bracket
 For every closing bracket,just look at the top of stack. If top and current char are same then continue else return false.
 T.C = BigO(n)
 A.S = BigO(n)
 */


//MARK: evalRPN
//https://leetcode.com/problems/evaluate-reverse-polish-notation
//https://youtu.be/vvnaANhNSes?si=diiVAOlLTIhJuEkQ
func evalRPN(_ tokens: [String]) -> Int {
    var numbers = [Int]()
    for token in tokens {
        switch token {
        case "*":
            let (a, b) = fetchAndRemoveLastTwoNumFromArr(&numbers)
            numbers.append(a * b)
        case "/":
            let (a, b) = fetchAndRemoveLastTwoNumFromArr(&numbers)
            numbers.append(a / b)
        case "+":
            let (a, b) = fetchAndRemoveLastTwoNumFromArr(&numbers)
            numbers.append(a + b)
        case "-":
            let (a, b) = fetchAndRemoveLastTwoNumFromArr(&numbers)
            numbers.append(a - b)
        default:
            numbers.append(Int(token) ?? 0)
        }
    }
    return numbers.last ?? -1
}


//MARK: Helper functions
func fetchAndRemoveLastTwoNumFromArr(_ numbers: inout [Int]) -> (a: Int, b: Int) {
    guard numbers.count > 1 else { return (a: 0, b: 0) }
    let b = numbers.removeLast()
    let a = numbers.removeLast()
    return (a: a, b: b)
}


// Helper function to return precedence of operators
func prec(_ c: Character) -> Int {
    if c == "^" {
        return 3
    } else if c == "/" || c == "*" {
        return 2
    } else if c == "+" || c == "-" {
        return 1
    } else {
        return -1
    }
}
