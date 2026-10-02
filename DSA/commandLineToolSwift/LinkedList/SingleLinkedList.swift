//
//  LinkedList.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 15/10/25.
//
import Foundation
//MARK: ----learn------
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
    
    public init(_ val: Int, _ back: ListNode? = nil , _ next: ListNode? = nil) {
        self.val = val
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
    let head = ListNode(nums[0])
    var mover = head
    for i in 1..<nums.count {
        let temp = ListNode(nums[i])
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
    if key==1{
        deletionOfHeadInLL(&head)
    }
    var index = 1
    var mover = head
    while mover != nil {
        if index == key-1 {
            mover?.next = mover?.next?.next
            return
        }
        mover = mover?.next
        index += 1
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
    let newHead = ListNode(val, head)
    head = newHead
}
//T.C = BigO(1)
//A.S = BigO(1)

func insertionAtTailInLL(_ head: inout ListNode?, _ val: Int) {
    var temp = head
    while temp?.next != nil {
        temp = temp?.next
    }
    let newTail = ListNode(val)
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
            let newNode = ListNode(val,temp?.next)
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
            let newNode = ListNode(val,temp?.next)
            temp?.next = newNode
            return
        }
        temp = temp?.next
    }
}
//val = toBeInserted , k = InsertBeforeThisElement
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Medium--------------------



//MARK: middleOfList
//https://youtu.be/7LjQ57RqgEc?si=y70W-3BMryUSDlHU
//https://leetcode.com/problems/middle-of-the-linked-list/
func middleNodeBrute(_ head: ListNode?) -> ListNode? {
    // If list is empty or has only one node
    if head == nil || head?.next == nil {
        return head
    }
    // Count nodes
    var count = 0
    var temp = head
    while temp != nil {
        count += 1
        temp = temp?.next
    }
    // Middle position (same as C++: count/2 + 1 for 1-based index)
    var mid = count / 2 + 1
    temp = head
    // Traverse to the middle node
    while temp != nil {
        mid -= 1
        if mid == 0 {
            break
        }
        temp = temp?.next
    }
    return temp
}
//T.C = BigO(n + n/2)
//A.S = BigO(1)

func middleNodeOptimal(_ head: ListNode?,
                       prefer: MiddlePreference = .right) -> ListNode? {
    var slow = head
    // THE MAGIC LINE:
    // If we want the right-middle, start 'fast' at head.
    // If we want the left-middle, give 'fast' a one-step head start.
    var fast = (prefer == .right) ? head : head?.next
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: reverseList
//https://youtu.be/D2vI2DNJGd8?si=6yElcpqiI212PSHJ
//https://leetcode.com/problems/reverse-linked-list/
func reverseSingleLLBrute(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return head
    }
    //Store the elements in stack
    var mover = head
    var stack = [Int]()
    
    while let current = mover?.val {
        stack.append(current)
        mover = mover?.next
    }
    //update the ll with element in stack
    mover = head
   
    while let current = stack.popLast(), mover != nil {
        mover?.val = current
        mover = mover?.next
    }
    return head
}
//Approach = stack + ls
//T.C = BigO(2n)
//A.S = BigO(n)

func reverseSingleLLOptimal(_ head: ListNode?) -> ListNode? {
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

func reverseSingleLLRecursive(_ head: ListNode?) -> ListNode? {
    return head
}
//Approach = recursion
//T.C = BigO()
//A.S = BigO()


//MARK: LinkedListCycle-isCycle
//https://youtu.be/wiOo4DC5GGA?si=qJfPsBESsOhql_Xx
//https://leetcode.com/problems/linked-list-cycle
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
//Approach = set
//T.C = BigO(n)
//A.S = BigO(n)

func hasCycleOptimal(_ head: ListNode?) -> Bool {
    if head?.next == nil{
        return false
    }
    var fast = head
    var slow = head
    while fast?.next != nil{
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
    }
    return false
}
//Approach = Floyd’s Cycle(Tortoise and Hare /slow+fast pointer)
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: commonCollisionPointNodeInCycle
func commonCollisionPointNodeInCycle(_ head: ListNode?,
                                     startIndex: Int = 1) -> (node:ListNode?,index:Int)? {
    if head?.next == nil {
        return nil
    }
    var fast = head
    var slow = head
    var count = startIndex // Initialize with your chosen starting index
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        count += 1
        if slow === fast {
            return (slow, count)
        }
    }
    return nil
}
//Approach = Floyd’s Cycle(Tortoise and Hare /slow+fast pointer)
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: LinkedListCycle2-cycleStartingPoint
//https://youtu.be/2Kd0KKmmHFc?si=7UreDPRjRvapeVB0
//https://leetcode.com/problems/linked-list-cycle-ii/description/
func linkedListCycle2Brute(_ head: ListNode?) -> ListNode? {
    var visited = Set<ObjectIdentifier>()
    var current = head
    while let node = current {
        let nodeId = ObjectIdentifier(node)
        if visited.contains(nodeId) {
            return node
        }
        visited.insert(nodeId)
        current = node.next
    }
    return nil
}
//Approach = set
//T.C = BigO(n)
//A.S = BigO(n)

func linkedListCycle2Optimal(_ head: ListNode?) -> ListNode? {
    //O(n)
    var collisionNode = commonCollisionPointNodeInCycle(head)?.node
    if collisionNode == nil {
        return nil
    }
    var startNode = head
    while startNode !== collisionNode {
        startNode = startNode?.next
        collisionNode = collisionNode?.next
    }
    return startNode
}
//Approach = commonCollisionPointNodeInCycle
//T.C = BigO(2n)
//A.S = BigO(1)


//MARK: lengthOfTheCycle
//https://youtu.be/I4g1qbkTPus?si=KptLKT1B1OCriREi
func lengthOfCycleBrute(_ head: ListNode?) -> Int {
    var visitedNodes: [ObjectIdentifier: Int] = [:]
    var mover = head
    var totalNodeCount = 1
    while let currentNode = mover {
        let nodeId = ObjectIdentifier(currentNode)
        if let cycleStartPointIndex = visitedNodes[nodeId] {
            return totalNodeCount - cycleStartPointIndex
        }
        visitedNodes[nodeId] = totalNodeCount
        mover = currentNode.next
        totalNodeCount += 1
    }
    return 0
}
//Approach = set
//T.C = BigO(n)
//A.S = BigO(n)

func lengthOfCycleOptimal(_ head: ListNode?) -> Int {
    //O(n)
    let commonCollisionPointNode = commonCollisionPointNodeInCycle(head)
    if commonCollisionPointNode == nil{
        return 0
    }
    let slow = commonCollisionPointNode?.node
    var fast = commonCollisionPointNode?.node?.next
    var count = 1
    while fast !== slow {
        count += 1
        fast = fast?.next
    }
    return count
}
//Approach = commonCollisionPointNodeInCycle
//T.C = BigO(2n)
//A.S = BigO(1)


//MARK: isPalindromeLL
//https://youtu.be/lRY_G-u_8jk?si=aJzn2-dK7onnLOhI
//https://leetcode.com/problems/palindrome-linked-list
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
    let secondHaldReversedHead = reverseSingleLLOptimal(slow?.next)
    
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
    slow?.next = reverseSingleLLOptimal(secondHaldReversedHead)
    
    return isPalin
}
//Approach = reverse 2nd half with (Floyd’s Cycle Detection Algorithm (Tortoise and Hare /slow+fast pointer))
//T.C = BigO(2n)
//A.S = BigO(1)


//MARK: oddEvenLinkedList
//https://youtu.be/qf6qp7GzD5Q?si=CCVhndFKTAsT0Lty
//https://leetcode.com/problems/odd-even-linked-list
func oddEvenListBrute(_ head: ListNode?) -> ListNode? {
    var oddPoint = head
    var oddValues = [Int]()
    var evenPoint = head?.next
    var evenValues = [Int]()
    
    while let currentOddPoint = oddPoint?.val  {
        oddValues.append(currentOddPoint)
        oddPoint = oddPoint?.next?.next
    }
    while let currentEvenPoint = evenPoint?.val  {
        evenValues.append(currentEvenPoint)
        evenPoint = evenPoint?.next?.next
    }
    
    var mover = head
    for oddValue in oddValues {
        mover?.val = oddValue
        mover = mover?.next
    }
    for evenValue in evenValues {
        mover?.val = evenValue
        mover = mover?.next
    }
    return head
}
//Approach = extract values then add in exiting nodes.
//T.C = BigO(2n)
//A.S = BigO(n)

func oddEvenListOptimal(_ head: ListNode?) -> ListNode? {
    // 1. Corrected Names: head is Odd (1st node), head.next is Even (2nd node)
    let oddHead = head
    var oddMover = head
    
    let evenHead = head?.next
    var evenMover = head?.next
    // 2. Safer, standard loop condition checking the even pointer
    while evenMover != nil && evenMover?.next != nil {
        // Jump the odd pointer by 2
        oddMover?.next = oddMover?.next?.next
        oddMover = oddMover?.next
        
        // Jump the even pointer by 2
        evenMover?.next = evenMover?.next?.next
        evenMover = evenMover?.next
    }
    // 3. Connect the end of the odd list to the start of the even list
    // (The redundant if-statement is removed)
    oddMover?.next = evenHead
    return oddHead
}
//Approach = change next pointers
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: removeNthFromEnd
//https://youtu.be/3kMKYQ2wNIU?si=DtFDnPU7z9HMz_GM
//https://leetcode.com/problems/remove-nth-node-from-end-of-list
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var mover = head
    var count = 0
    while mover != nil {
        count += 1
        mover = mover?.next
    }
    if count == n {
        return head?.next
    }
    // Pass 2: Move exactly (count - n - 1) steps forward
    mover = head
    let stepsToTake = count - n - 1
    for _ in 0..<stepsToTake {
        mover = mover?.next
    }
    // Now 'mover' is exactly one node before the target. Rewire it.
    mover?.next = mover?.next?.next
    return head
}
//Approach = change next pointers
//T.C = BigO(2n)
//A.S = BigO(1)

func removeNthFromEndOptimal(_ head: ListNode?, _ n: Int) -> ListNode? {
    var fast = head
    var slow = head
    for _ in 0..<n{
        fast = fast?.next
    }
    //If first node to be removed then If fast fell off the edge, we need to delete the head
    if fast == nil {
        return head?.next
    }
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    slow?.next = slow?.next?.next
    return head
}
//Approach = (Measuring Tape) Approach
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deleteMiddleNode
//https://youtu.be/ePpV-_pfOeI?si=9AEFPE2-ZrVCxxVb
//https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list
func deleteMiddleBrute(_ head: ListNode?) -> ListNode? {
    if head?.next == nil{
        return nil
    }
    var mover = head
    var count = 0
    while mover != nil {
        mover = mover?.next
        count += 1
    }
    mover = head
    var midIndex = count/2
    while mover != nil {
        midIndex -= 1
        if midIndex == 0 {
            mover?.next = mover?.next?.next
            break
        }
        mover = mover?.next
    }
    return head
}
//Approach - find total nodes ...
//T.C = BigO(n + n/2)
//A.S = BigO(1)

func deleteMiddleOptimal(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        return nil
    }
    var slow = head
    var fast = head
    fast = fast?.next?.next
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    slow?.next = slow?.next?.next
    return head
}
//Approach - slow/fast pointer + skip a first slow iteration
//T.C = BigO(n + n/2)
//A.S = BigO(1)


//MARK: SortList
//https://youtu.be/8ocB7a_c-Cc?si=kgH6mUk2zjA8CBK3
//https://leetcode.com/problems/sort-list
func sortListBrute(_ head: ListNode?) -> ListNode? {
    var mover = head
    var values = [Int]()
    while let currentValue = mover?.val {
        values.append(currentValue)
        mover = mover?.next
    }
    values.sort()
    var index = 0
    mover = head
    while mover != nil {
        mover?.val = values[index]
        index += 1
        mover = mover?.next
    }
    return head
}
//Approach:
//T.C = BigO(2n + nlogn)
//A.S = BigO(n)

func sortListOptimal(_ head: ListNode?) -> ListNode? {
    // Base case: empty or single node
    guard let head = head, head.next != nil else {
        return head
    }
    
    // Find middle node (Explicitly requesting the Left-Middle for Merge Sort!)
    let middle = middleNodeOptimal(head, prefer: .left)
    
    // Split into two halves
    let right = middle?.next
    middle?.next = nil
    let left = head
    
    // Recursively sort both halves
    let sortedLeft = sortListOptimal(left)
    let sortedRight = sortListOptimal(right)
    
    // Merge sorted halves O(n)
    return mergeTwoSortedLinkedListsInSortedWay(sortedLeft, sortedRight)
}
//Approach:
//T.C = BigO(nlog * n)
//A.S = BigO(n)


//MARK: SortColors(0,1,2)
//https://youtu.be/gRII7LhdJWc?si=7vQskNhG0oN9iu4p
func sortColorsBrute(_ head: ListNode?) -> ListNode? {
    var mover = head
    var hashArray = Array(repeating: 0, count: 3)
    while let value = mover?.val {
        hashArray[value] += 1
        mover = mover?.next
    }
    mover = head
    for i in 0..<hashArray.count {
        let currentFreq = hashArray[i]
        for _ in 0..<currentFreq {
            mover?.val = i
            mover = mover?.next
        }
    }
    return head
}
//Approach:
//T.C = BigO(2n)
//A.S = BigO(1)

func sortColorsOptimal(_ head: ListNode?) -> ListNode? {
    // 1. Create Dummy Nodes to anchor the start of each pile
    let zeroDummy = ListNode(-1)
    var zeroMover: ListNode? = zeroDummy
    
    let oneDummy = ListNode(-1)
    var oneMover: ListNode? = oneDummy
    
    let twoDummy = ListNode(-1)
    var twoMover: ListNode? = twoDummy
    
    var mover = head
    
    while let currentNode = mover {
        if currentNode.val == 0 {
            // We just blindly attach to the next, no need to check for nil!
            zeroMover?.next = currentNode
            zeroMover = zeroMover?.next
        } else if currentNode.val == 1 {
            oneMover?.next = currentNode
            oneMover = oneMover?.next
        } else if currentNode.val == 2 {
            twoMover?.next = currentNode
            twoMover = twoMover?.next
        }
        mover = mover?.next
    }
    // 3. The Stitching (O(1) Time)
    // Connect the 0s to the 1s. If the 1s list is empty, connect straight to the 2s.
    zeroMover?.next = oneDummy.next ?? twoDummy.next
    
    // Connect the 1s to the 2s
    oneMover?.next = twoDummy.next
    
    // Terminate the 2s list to prevent infinite loops
    twoMover?.next = nil
    
    // 4. Return the real head of the list (skipping the -1 dummy)
    return zeroDummy.next
}
//Approach:
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: IntersectionOfTwoLL
//https://youtu.be/0DYoPz2Tpt4?si=ywb11Yk_utV0pl5y
//https://leetcode.com/problems/intersection-of-two-linked-lists
func getIntersectionNodeBrute(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var hashTable = Set<ObjectIdentifier>()
    var mover = headA
    while let node = mover {
        let nodeAddess = ObjectIdentifier(node)
        hashTable.insert(nodeAddess)
        mover = mover?.next
    }
    mover = headB
    while let node = mover {
        let nodeAddess = ObjectIdentifier(node)
        if hashTable.contains(nodeAddess){
            return node
        }
        mover = mover?.next
    }
    return nil
}
//Approach = hashing
//T.C = BigO(n+m)
//A.S = BigO(n)

func getIntersectionNodeOptimal1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    let count1 = lenthOfLL(headA)
    let count2 = lenthOfLL(headB)
    let diff = abs(count1 - count2)
    var runner1 = headA
    var runner2 = headB
    if count1 > count2 {
        for _ in 0..<diff {
            runner1 = runner1?.next
        }
    }else{
        for _ in 0..<diff {
            runner2 = runner2?.next
        }
    }
    while runner1 !== runner2 {
        runner1 = runner1?.next
        runner2 = runner2?.next
    }
    return runner1
}
//Approach = two pointer
//T.C = BigO(n+m)+(n-d)+(n)  =  BigO(n+m)
//A.S = BigO(1)

func getIntersectionNodeOptimal2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var runner1 = headA
    var runner2 = headB
    // They stop when they meet at the intersection OR when they both hit nil
    while runner1 !== runner2 {
        // If runner hits the end, teleport to the other head. Otherwise, step forward.
        runner1 = (runner1 == nil) ? headB : runner1?.next
        runner2 = (runner2 == nil) ? headA : runner2?.next
    }
    
    return runner1
}
//Approach: Relay Race (Two Pointers)
//T.C = BigO(max(n,m) - (n-m))  =  BigO(n+m)
//A.S = BigO(1)


//MARK: addOneToLL
//https://youtu.be/aXQWhbvT3w0?si=ksXmqQdKttdYrORt
//https://www.geeksforgeeks.org/problems/add-1-to-a-number-represented-as-linked-list/1
func addOneToLlIterative(_ head: ListNode?) -> ListNode? {
    let reversedLL = reverseSingleLLOptimal(head)
    var mover = reversedLL
    var carry = 1
    while let currentValue = mover?.val {
        if carry == 0 {
            break
        }
        let total = currentValue + carry
        if total == 10{
            mover?.val = 0
            carry = 1
        }else{
            mover?.val = total
            carry = 0
        }
        if mover?.next == nil && carry != 0 {
            let node = ListNode(carry)
            mover?.next = node
            break
        }
        mover = mover?.next
    }
    return reverseSingleLLOptimal(reversedLL)
}
//Approach: reverse + addition(carryForward)
//T.C = BigO(n)
//A.S = BigO(1)

func addOneToLlRecursive(_ head: ListNode?) -> ListNode? {
    return nil
}
//Approach: Recursive
//T.C = BigO()
//A.S = BigO()


//MARK: addOneToLL
//https://youtu.be/LBVsXSMOIk4?si=0-WwlN6Sx7zOM2VC
//https://leetcode.com/problems/add-two-numbers
func addTwoNumbersOptimal(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var mover1 = l1
    var mover2 = l2
    var carry = 0
    
    // The Dummy Node (you cleverly named it answerArray to mirror your first approach)
    let answerArray = ListNode(0)
    var answerArrayMover = answerArray
    
    // Phase 1: Checking for nodes from both linked lists
    while let mover1Val = mover1?.val , let mover2Val = mover2?.val {
        let total = mover1Val + mover2Val + carry
        if total < 10 {
            answerArrayMover.next = ListNode(total)
            carry = 0
        } else {
            let lastDigit = total % 10
            answerArrayMover.next = ListNode(lastDigit)
            let afterRemovingLastDigit = total / 10
            carry = afterRemovingLastDigit
        }
        mover1 = mover1?.next
        mover2 = mover2?.next
        answerArrayMover = answerArrayMover.next!
    }
    // Phase 2: Checking for nodes from the remaining unfinished linked list
    var mover = mover1 ?? mover2
    while let moverVal = mover?.val {
        let total = moverVal + carry
        if total < 10 {
            answerArrayMover.next = ListNode(total)
            carry = 0
        } else {
            let lastDigit = total % 10
            answerArrayMover.next = ListNode(lastDigit)
            let afterRemovingLastDigit = total / 10
            carry = afterRemovingLastDigit
        }
        mover = mover?.next
        answerArrayMover = answerArrayMover.next!
    }
    // Phase 3: Handling any final leftover carry
    if carry != 0 {
        answerArrayMover.next = ListNode(carry)
        answerArrayMover = answerArrayMover.next!
    }
    return answerArray.next
}
//Approach =
//T.C = BigO(max(n+m))
//A.S = BigO(max(n+m))

func addTwoNumbersOptimalClean(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var mover1 = l1
    var mover2 = l2
    var carry = 0
    let answerHead = ListNode(0)
    var answerHeadMover = answerHead
    
    while mover1 != nil || mover2 != nil || carry != 0  {
        let val1 = mover1?.val ?? 0
        let val2 = mover2?.val ?? 0
        let total = val1 + val2 + carry
        let lastDigit = total % 10
        carry = total / 10
        answerHeadMover.next = ListNode(lastDigit)
        
        mover1 = mover1?.next
        mover2 = mover2?.next
        answerHeadMover = answerHeadMover.next!
    }
    return answerHead.next
}
//Approach =
//T.C = BigO(max(n+m))
//A.S = BigO(max(n+m))



//MARK: Picked--------------------



//MARK: mergeTwoLists
//https://youtu.be/jXu-H7XuClE?si=p2uN8q__oub1FTtD
//https://leetcode.com/problems/merge-two-sorted-lists
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
    var list1Mover = list1
    var list2Mover = list2
    while list1Mover != nil && list2Mover != nil {
        let firstListEl = list1Mover?.val ?? -1
        let secondListEl = list2Mover?.val ?? -1
        
        let firstArrElNode = ListNode(firstListEl)
        let secondArrElNode = ListNode(secondListEl)
        
        if firstListEl < secondListEl {
            appendNewNodeInResult(firstArrElNode, &resultHead, &resultHeadMover)
            list1Mover = list1Mover?.next
        }else if firstListEl > secondListEl {
            appendNewNodeInResult(secondArrElNode, &resultHead, &resultHeadMover)
            list2Mover = list2Mover?.next
        }else{
            appendNewNodeInResult(firstArrElNode, &resultHead, &resultHeadMover)
            list1Mover = list1Mover?.next
            appendNewNodeInResult(secondArrElNode, &resultHead, &resultHeadMover)
            list2Mover = list2Mover?.next
        }
    }
    while list1Mover != nil {
        let node = ListNode(list1Mover?.val ?? -1)
        appendNewNodeInResult(node, &resultHead, &resultHeadMover)
        list1Mover = list1Mover?.next
    }
    while list2Mover != nil {
        let node = ListNode(list2Mover?.val ?? -1)
        appendNewNodeInResult(node, &resultHead, &resultHeadMover)
        list2Mover = list2Mover?.next
    }
    return resultHead
}
func appendNewNodeInResult(_ newNode: ListNode,
                           _ resultHead: inout ListNode?,
                           _ resultHeadMover: inout ListNode?){
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
    var list1Mover = list1
    var list2Mover = list2
    while list1Mover != nil && list2Mover != nil {
        let firstListEl = list1Mover?.val ?? -1
        let secondListEl = list2Mover?.val ?? -1
        
        if firstListEl < secondListEl {
            let next = list1Mover?.next
            appendNewNodeInResult1(list1Mover!, &resultHead, &resultHeadMover)
            list1Mover = next
        }else if firstListEl > secondListEl {
            let next = list2Mover?.next
            appendNewNodeInResult1(list2Mover!, &resultHead, &resultHeadMover)
            list2Mover = next
        }
        else{
            let templist1Next = list1Mover?.next
            let templist2Next = list2Mover?.next
            appendNewNodeInResult1(list1Mover!, &resultHead, &resultHeadMover)
            list1Mover = templist1Next
            appendNewNodeInResult1(list2Mover!, &resultHead, &resultHeadMover)
            list2Mover = templist2Next
        }
    }
    while list1Mover != nil {
        let next = list1Mover?.next
        appendNewNodeInResult1(list1Mover!, &resultHead, &resultHeadMover)
        list1Mover = next
    }
    while list2Mover != nil {
        let next2 = list2Mover?.next
        appendNewNodeInResult1(list2Mover!, &resultHead, &resultHeadMover)
        list2Mover = next2
    }
    return resultHead
}
func appendNewNodeInResult1(_ newNode: ListNode,
                            _ resultHead: inout ListNode?,
                            _ resultHeadMover: inout ListNode?){
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
//MARK: Helper functions
func createLinkedListWithCycle(values: [Int], pos: Int) -> ListNode? {
    guard !values.isEmpty else { return nil }
    
    let head = ListNode(values[0])
    var current = head
    
    // We will store a reference to the node where the cycle should begin
    var cycleNode: ListNode? = (pos == 0) ? head : nil
    
    // Build the rest of the linked list
    for i in 1..<values.count {
        let newNode = ListNode(values[i])
        current.next = newNode
        current = newNode
        
        // If the current index matches 'pos', save this node
        if i == pos {
            cycleNode = newNode
        }
    }
    
    // current is now the tail. Connect its 'next' to the cycleNode!
    // (If pos was -1, cycleNode remains nil, so no cycle is created)
    current.next = cycleNode
    
    return head
}
func mergeTwoSortedLinkedListsInSortedWay(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummyNode = ListNode(-1)
    var temp: ListNode? = dummyNode
    
    var l1 = list1
    var l2 = list2
    
    while let node1 = l1, let node2 = l2 {
        if node1.val <= node2.val {
            temp?.next = node1
            l1 = node1.next
        } else {
            temp?.next = node2
            l2 = node2.next
        }
        temp = temp?.next
    }
    
    temp?.next = l1 ?? l2
    return dummyNode.next
}
//T.C = BigO(n+m)
//A.S = BigO(1)
enum MiddlePreference {
    case left
    case right
}
/*
2 oct
 */
