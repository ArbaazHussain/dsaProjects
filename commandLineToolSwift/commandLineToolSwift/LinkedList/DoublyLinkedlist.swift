//
//  DoublyLinkedlist.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 15/10/25.
//

import Foundation

//MARK: arrayToDLL
func arrayToDll(_ nums: [Int]) -> ListNode? {
    if nums.isEmpty {
        return nil
    }
    let head = ListNode(data: nums[0]) // First node
    var prev = head
    
    for i in 1..<nums.count {
        let temp = ListNode(data: nums[i], back: prev) // Create new node with back pointer to prev
        prev.next = temp // Link prev to new node
        prev = temp // Move prev forward
    }
    return head
}
//T.C = BigO(n)
//A.S = BigO(n)


//MARK: traversalOfDLL
//same as traversalOfLL


//MARK: deletionOfHeadInDLL
func deletionOfHeadInDLL(_ head: inout ListNode?) {
    if head == nil || head?.next == nil {
        // If only one node exists, delete it
        head = nil
        return
    }
    // Move head to next node and remove backward reference
    head = head?.next
    head?.back = nil
}
//T.C = BigO(1)
//A.S = BigO(1)


//MARK: deletionOfTailInDLL
func deletionOfTailInDLL(_ head: inout ListNode?) {
    // If only one node exists, delete it
    if head?.next == nil{
        head = nil
        return
    }
    var temp = head
    while temp?.next?.next != nil {
        temp = temp?.next
    }
    // temp now points to the second last node
    temp?.next?.back = nil
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deletionOfKthElementDll
func deletionOfKthElementDll(_ head: inout ListNode?, _ k: Int) {
    guard k >= 1 else {
        print("Invalid k")
        return
    }
    //deleting the head node
    if k == 1{
        deletionOfHeadInDLL(&head)
        return
    }
    var temp = head
    var currentIndex = 1
    // Traverse to the k-th node
    while temp != nil && currentIndex < k{
        temp = temp?.next
        currentIndex += 1
    }
    // If k is greater than the length of the list
    if temp == nil {
        print("K is out of bounds")
        return
    }
    let previousNode = temp?.back
    let nextNode = temp?.next
    previousNode?.next = nextNode
    nextNode?.back = previousNode
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deletionOfNodeWithKeyInDLL
func deletionOfNodeWithKeyInDLL(_ head: inout ListNode?, _ key: Int) {
    if key == head?.val{
        deletionOfHeadInDLL(&head)
        return
    }
    var temp = head
    // Traverse to the key node
    while temp != nil && temp?.val != key{
        temp = temp?.next
    }
    // If key is not found
    if temp == nil{
        print("key not found")
        return
    }
    let previousNode = temp?.back
    let nextNode = temp?.next
    previousNode?.next = nextNode
    nextNode?.back = previousNode
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deletionOfNodeInDLL
//Given node will never be tail
func deletionOfNodeInDLL(_ node: ListNode?) {
    guard let nodeToDelete = node else { return }
    guard let nextNode = nodeToDelete.next else { return }
    nodeToDelete.val = nextNode.val
    nodeToDelete.next = nextNode.next
    nextNode.next?.back = nodeToDelete
    
    //Optional but recommended cleanup
    nextNode.next = nil
    nextNode.back = nil
}
//T.C = BigO(1)
//A.S = BigO(1)


//MARK: Insertion
func insertionBeforeHeadDll(_ head: inout ListNode?, _ val: Int) {
    let newHead = ListNode(data: val,next: head)
    head?.back = head
    
    head = newHead
}
//T.C = BigO(1)
//A.S = BigO(1)


func insertionBeforeTailDll(_ head: inout ListNode?, _ val: Int) {
    // If only one node exists
    if head?.next == nil{
        let newNode = ListNode(data: val, next: head)
        head = newNode
        return
    }
    var temp = head
    // Traverse to the tail node
    while temp?.next != nil {
        temp = temp?.next
    }
    let previousNode = temp?.back
    let newNode = ListNode(data: val, back: previousNode, next: temp)
    temp?.back = newNode
    
    //if previousNode exits(The tail is not the head )
    if let prev = previousNode {
        prev.next = newNode
    } else {
        // The tail is also the head → newNode becomes the new head
        head = newNode
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


func insertionBeforeKthElementDll(_ head: inout ListNode?, _ k: Int, _ val: Int) {
    var currentIndex = 1
    var temp = head
    //traverse to kth node
    while temp != nil && currentIndex<k {
        temp = temp?.next
        currentIndex += 1
    }
    // If k is greater than the length of the list
    if temp == nil {
        print("k is greater than the length of the list")
        return
    }
    let previousNode = temp?.back
    let newNode = ListNode(data: val, back: previousNode, next: temp)
    temp?.back = newNode
    
    //if previousNode exits(kth is not the head)
    if let prev = previousNode {
        prev.next = newNode
    }else{
        // The kth is also the head → newNode becomes the new head
        head = newNode
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//given node is never head of the list
func insertionBeforeNodeDll(_ node: inout ListNode?, _ val: Int) {
    let previousNode = node?.back
    let newNode = ListNode(data: val, back: previousNode, next: node)
    node?.back = newNode
    previousNode?.next = newNode
}
//T.C = BigO(1)
//A.S = BigO(1)


//MARK: reverse
func reverseDLLBrute(_ head: inout ListNode?) {
    var stack = [Int]()
    var temp = head
    while temp != nil {
        stack.append(temp?.val ?? -1)
        temp = temp?.next
    }
    temp = head
    while temp != nil {
        temp?.val = stack.popLast() ?? -1
        temp = temp?.next
    }
}
//T.C = BigO(2n)
//A.S = BigO(n)


//MARK: reverse
func reverseDLLOptimal(_ head: inout ListNode?) {
    var current = head
    var last : ListNode? = nil
    while current != nil {
        //swap
        last = current?.back
        current?.back = current?.next
        current?.next = last
        //move to next node
        current = current?.back
    }
    head = last?.back
}
//T.C = BigO(n)
//A.S = BigO(n)





/*
 Revision:
 * DLL (2Oth Oct)
 - reverseDLLOptimal
 */
