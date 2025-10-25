//
//  LinkedList.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 15/10/25.
//

import Foundation

//MARK: ----Linkedlist------
/*
 *Where it is used?
 ->Stack, queue, browsers.
 
 *Why array is not used in queue/stack?
 Although vector is dynamic, it's not ideal for queues due to slow pop_front() (O(n)) and costly resizing. For stacks, it works but frequent resizing during growth involves copying all elements to new memory, which affects performance.
 
 
 */

public class ListNode{
    public var val : Int
    public var back : ListNode?
    public var next : ListNode?
    
    public init(data: Int, back: ListNode? = nil , next: ListNode? = nil) {
        self.val = data
        self.back = back
        self.next = next
    }
}

public class GenericLLNode<T>{
    public var value : T
    public var back : GenericLLNode?
    public var next : GenericLLNode?
    
    public init(value: T, back: GenericLLNode? = nil , next: GenericLLNode? = nil) {
        self.value = value
        self.back = back
        self.next = next
    }
}


//MARK: arrayToLL
func arrayToLL(_ nums: [Int]) -> ListNode? {
    if nums.isEmpty {
        return nil
    }
    let head = ListNode(data: nums[0])
    var mover = head

    for i in 1..<nums.count {
        let temp = ListNode(data: nums[i])
        mover.next = temp
        mover = temp
    }
    return head
}
//T.C = BigO(n)
//A.S = BigO(n)


//MARK: traversalOfLL
func traversalOfLL(_ head: ListNode?) {
    var temp = head
    while let current = temp {
        print(current.val, terminator: " ")
        temp = current.next
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: lenthOfLL
func lenthOfLL(_ head: ListNode?) -> Int{
    var count = 0
    var temp = head
    while temp != nil{
        count += 1
        temp = temp?.next
    }
    return count
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: searchInLL
func searchInLL(_ head: ListNode?, _ key: Int) -> Bool{
    var temp = head
    while let current = temp {
        if current.val == key{
            return true
        }
        temp = temp?.next
    }
    return false
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deletionOfHead
func deletionOfHeadInLL(_ head: inout ListNode?) {
    head = head?.next
}
//T.C = BigO(1)
//A.S = BigO(1)


func deletionOfTailInLL(_ head: inout ListNode?) {
    if head?.next == nil{
        head = nil
    }
    var temp = head
    while temp?.next?.next != nil {
        temp = temp?.next
    }
    temp?.next = nil
}
//T.C = BigO(n)
//A.S = BigO(1)


func deletionAtKthElementInLL(_ head: inout ListNode?, _ key: Int) {
    if key == 1 {
        deletionOfHeadInLL(&head)
        return
    }
    var currentIndex = 0
    var temp = head
    while temp != nil {
        currentIndex += 1
        if(key == currentIndex+1){
            let kThNode = temp?.next
            temp?.next = temp?.next?.next
            kThNode?.next = nil
            return
        }
        temp = temp?.next
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


func deletionOfNode1InLL(_ head: inout ListNode?, _ key: Int) {
    if key == head?.val {
        deletionOfHeadInLL(&head)
    }
    var temp = head
    while temp != nil {
        if(temp?.next?.val == key){
            temp?.next = temp?.next?.next
            return
        }
        temp = temp?.next
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//https://leetcode.com/problems/delete-node-in-a-linked-list/description/
func deletionOfNode2InLL(_ node: ListNode?) {
    guard let node else { return }
    guard let next = node.next else { return }
    node.val = next.val
    node.next = next.next
}
//T.C = BigO(1)
//A.S = BigO(1)


//MARK: Insertion
func insertionAtHeadInLL(_ head: inout ListNode?, _ val: Int) {
    let newHead = ListNode(data: val, next: head)
    head = newHead
}
//T.C = BigO(1)
//A.S = BigO(1)


func insertionAtTailInLL(_ head: inout ListNode?, _ val: Int) {
    var temp = head
    while temp?.next != nil {
        temp = temp?.next
    }
    let newTail = ListNode(data: val)
    temp?.next = newTail
}
//T.C = BigO(n)
//A.S = BigO(1)


func insertionAtKthElementInLL(_ head: inout ListNode?, _ k:Int, _ val:Int) {
    if k == 1{
        insertionAtHeadInLL(&head, val)
        return
    }
    var currentIndex = 0
    var temp = head
    while temp != nil {
        currentIndex += 1
        if(k == currentIndex+1){
            let newNode = ListNode(data: val,next: temp?.next)
            temp?.next = newNode
            return
        }
        temp = temp?.next
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


func insertionBeforeNodeInLL(_ head: inout ListNode?, _ k:Int, _ val:Int) {
    if(head?.val == k){
        insertionAtHeadInLL(&head, val)
        return
    }
    var temp = head
    while temp != nil {
        if(temp?.next?.val == k){
            let newNode = ListNode(data: val,next: temp?.next)
            temp?.next = newNode
            return
        }
        temp = temp?.next
    }
}
//val = toBeInserted , k = InsertBeforeThisElement
//T.C = BigO(n)
//A.S = BigO(1)


