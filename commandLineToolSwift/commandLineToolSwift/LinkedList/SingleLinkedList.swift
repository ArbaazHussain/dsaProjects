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

public class ListNode : Hashable{
    public var val : Int
    public var back : ListNode?
    public var next : ListNode?
    
    public init(data: Int, back: ListNode? = nil , next: ListNode? = nil) {
        self.val = data
        self.back = back
        self.next = next
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))  // unique object identity
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


//MARK: deletion
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


//MARK: reverseList
func reverseSingleLL(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var curr = head
    var next: ListNode? = nil

    while curr != nil {
        next = curr?.next       // store next node
        curr?.next = prev       // reverse current node’s link
        prev = curr             // move prev ahead
        curr = next             // move current ahead
    }
    //returns head
    return prev
}
//Approach = Two Pointer
//T.C = BigO(n)
//A.S = BigO(1)



//MARK: LinkedList Picked--------------------



//MARK: llHasCycle
//https://leetcode.com/problems/linked-list-cycle
//https://youtu.be/wiOo4DC5GGA?si=qJfPsBESsOhql_Xx
func llHasCycle(_ head: ListNode?) -> Bool {
    var visited = Set<ListNode>()
    var temp = head
    while let current = temp {
        if visited.contains(current) {
            return true
        }
        visited.insert(current)
        temp = current.next
    }
    return false
}
//Approach = set + ll
//T.C = BigO(n)
//A.S = BigO(n)


func hasCycleOptimal(_ head: ListNode?) -> Bool {
    if head?.next == nil{
        return false
    }
    var fast = head
    var slow = head
    while fast != nil && fast?.next != nil{
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
    }
    return false
}
//Approach = Floyd’s Cycle Detection Algorithm (Tortoise and Hare /slow+fast pointer)
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: mergeTwoLists
//https://leetcode.com/problems/merge-two-sorted-lists
//https://youtu.be/jXu-H7XuClE?si=p2uN8q__oub1FTtD
func mergeTwoListsBrute(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    /*
     1. append elements of list1 and list2 in array (2n)
     2. sort the array (nlogn) //n=2n
     2. convert array to LL and return its head(n)
     */
    return nil
}
//Approach = ^
//T.C = BigO(n1+n2 + nlogn + n1+n2)
//A.S = BigO(n1+n2)


func mergeTwoListsBetter(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var resultHead : ListNode?
    var resultHeadMover: ListNode?
    var templist1 = list1
    var templist2 = list2
    while templist1 != nil && templist2 != nil {
        let firstListEl = templist1?.val ?? -1
        let secondListEl = templist2?.val ?? -1
        
        let firstArrElNode = ListNode(data: firstListEl)
        let secondArrElNode = ListNode(data: secondListEl)
        
        if firstListEl < secondListEl {
            appendNewNodeInResult(firstArrElNode, &resultHead, &resultHeadMover)
            templist1 = templist1?.next
        }else if firstListEl > secondListEl {
            appendNewNodeInResult(secondArrElNode, &resultHead, &resultHeadMover)
            templist2 = templist2?.next
        }else{
            appendNewNodeInResult(firstArrElNode, &resultHead, &resultHeadMover)
            templist1 = templist1?.next
            appendNewNodeInResult(secondArrElNode, &resultHead, &resultHeadMover)
            templist2 = templist2?.next
        }
    }
    while templist1 != nil {
        let node = ListNode(data: templist1?.val ?? -1)
        appendNewNodeInResult(node, &resultHead, &resultHeadMover)
        templist1 = templist1?.next
    }
    while templist2 != nil {
        let node = ListNode(data: templist2?.val ?? -1)
        appendNewNodeInResult(node, &resultHead, &resultHeadMover)
        templist2 = templist2?.next
    }
    return resultHead
}

func appendNewNodeInResult(_ newNode: ListNode, _ resultHead: inout ListNode?, _ resultHeadMover: inout ListNode?){
    if resultHead == nil {
        resultHead = newNode
        resultHeadMover = resultHead
    }else{
        resultHeadMover?.next = newNode
        resultHeadMover = resultHeadMover?.next
    }
}
//Approach = Two Pointer(same as union)
//T.C = BigO(max(n1,n2))
//A.S = BigO(n1+n2)


func mergeTwoListsOptimal(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var resultHead : ListNode?
    var resultHeadMover: ListNode?
    var templist1 = list1
    var templist2 = list2
    while templist1 != nil && templist2 != nil {
        let firstListEl = templist1?.val ?? -1
        let secondListEl = templist2?.val ?? -1
        
        if firstListEl < secondListEl {
            let next = templist1?.next
            appendNewNodeInResult1(templist1!, &resultHead, &resultHeadMover)
            templist1 = next
        }else if firstListEl > secondListEl {
            let next = templist2?.next
            appendNewNodeInResult1(templist2!, &resultHead, &resultHeadMover)
            templist2 = next
        }
        else{
            let templist1Next = templist1?.next
            let templist2Next = templist2?.next
            appendNewNodeInResult1(templist1!, &resultHead, &resultHeadMover)
            templist1 = templist1Next
            appendNewNodeInResult1(templist2!, &resultHead, &resultHeadMover)
            templist2 = templist2Next
        }
    }
    while templist1 != nil {
        let next = templist1?.next
        appendNewNodeInResult1(templist1!, &resultHead, &resultHeadMover)
        templist1 = next
    }
    while templist2 != nil {
        let next2 = templist2?.next
        appendNewNodeInResult1(templist2!, &resultHead, &resultHeadMover)
        templist2 = next2
    }
    return resultHead
}

func appendNewNodeInResult1(_ newNode: ListNode, _ resultHead: inout ListNode?, _ resultHeadMover: inout ListNode?){
    newNode.next = nil  // detach
    if resultHead == nil {
        resultHead = newNode
        resultHeadMover = resultHead
    }else{
        resultHeadMover?.next = newNode
        resultHeadMover = newNode
    }
}
//Approach = Two Pointer(same as union) , use existing nodes
//T.C = BigO(max(n1,n2))
//A.S = BigO(1)


//MARK: isPalindromeLL
//https://leetcode.com/problems/palindrome-linked-list
//https://youtu.be/lRY_G-u_8jk?si=aJzn2-dK7onnLOhI
func isPalindromeLLBrute(_ head: ListNode?) -> Bool {
    var llElements = [Int]()
    var tempHead = head
    //O(n)
    while let current = tempHead {
        llElements.append(current.val)
        tempHead = tempHead?.next
    }
    //O(n)
    return llElements == llElements.reversed()
}
//Approach = store the elements, reverse the elements and check
//T.C = BigO(2n)
//A.S = BigO(n)


func isPalindromeLLOptimal(_ head: ListNode?) -> Bool {
    guard head != nil && head?.next != nil else { return true }
    var slow = head
    var fast = head
    
    //Find the middle (slow will end at mid) 0(n/2)
    while fast?.next?.next != nil && fast?.next != nil  {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    //Reverse second half 0(n/2)
    let secondHaldReversedHead = reverseSingleLL(slow?.next)
    
    //Compare both halves
    var firstPointer = head
    var secondPointer = secondHaldReversedHead
    var isPalin = true
    
    //0(n/2)
    while let _ = secondPointer {
        if firstPointer?.val != secondPointer?.val {
            isPalin = false
            break
        }
        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next
    }
    //Restore the list (always restore!) 0(n/2)
    slow?.next = reverseSingleLL(secondHaldReversedHead)
    
    return isPalin
}
//Approach = reverse 2nd half with (Floyd’s Cycle Detection Algorithm (Tortoise and Hare /slow+fast pointer))
//T.C = BigO(2n)
//A.S = BigO(1)



/*
 Revision: 20 Oct
 - reverseDLLOptimal
 */
