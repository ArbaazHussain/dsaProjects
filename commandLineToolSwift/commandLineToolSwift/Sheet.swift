//
//  Array+Sheet.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 05/11/25.
//

import Foundation


//MARK: 50 DSA

//https://www.linkedin.com/posts/bhavesh-arora-11b0a319b_50-dsa-interview-solutions-activity-7383342580555640832-iHIT?utm_source=share&utm_medium=member_desktop&rcm=ACoAACtueYQBQjvjsxKhHmnttrcRg2bAVe_sFlg

//MARK: Array,s--------------------
/*
 twoSum
 Maximum Subarray (Kadane’s Algorithm)
 Move Zeroes
 Rotate Array
 Trapping Rain Water
 */


//MARK: trappingRainWater
//https://leetcode.com/problems/trapping-rain-water
//https://youtu.be/1_5VuquLbXg?si=kkBFJYE1wBelJr_d
func trappingRainWater(_ height: [Int]) -> Int {
    let n = height.count
    guard n > 1 else { return 0 }
    var count = 0
    var leftMax = -1
    var rightMax = -1
    for i in 1..<n-1{
        let current = height[i]
        let previous = height[i-1]
        leftMax = max(previous, leftMax)
        rightMax = findRightMax(height, till: i+1)
        
        if current < leftMax && current < rightMax {
            let currentWaterCount = min(leftMax, rightMax) - current
            if currentWaterCount > 0 {
                count += currentWaterCount
            }
        }
    }
    return count
}
private func findRightMax(_ height: [Int], till index: Int) -> Int{
    var res = 0
    for i in stride(from: height.count-1, through: index, by: -1) {
        let current = height[i]
        if  current>res{
            res = current
        }
    }
    return res
}
//Approach = currentWaterCount = min(leftMax, rightMax) - currentIndex
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Strings--------------------
/*
 Valid Anagram
 Longest Palindromic Substring
 Group Anagrams
 Longest Common Prefix
 Roman to Integer
 */


//MARK: longestPalindrome
//https://leetcode.com/problems/longest-palindromic-substring
//https://youtu.be/uX0-xyPkR2w?si=gFQRECIT8Dq-r2tO
func longestPalindromeBrute(_ s: String) -> String {
    let sArray = Array(s)
    let n = sArray.count
    var res = ""
    for i in 0..<n{
        for j in i..<n{
            let subArray = Array(sArray[i...j])
            let isPalindrome = subArray == subArray.reversed()
            if isPalindrome {
                if subArray.count > res.count {
                    res = String(subArray)
                }
            }
        }
    }
    return res
}
//Approach = generateSubarrays and check
//T.C = BigO(n^2)
//A.S = BigO(1)


func longestPalindromeOptimal(_ s: String) -> String {
    if s.count <= 1 {
        return s
    }
    
    let chars = Array(s)
    let n = chars.count
    var LPS = ""
    
    for i in 1..<n {
        // ---- Odd-length palindrome ----
        var low = i
        var high = i
        while low >= 0 && high < n && chars[low] == chars[high] {
            low -= 1
            high += 1
        }
        
        let palindrome1 = String(chars[(low + 1)..<high])
        if palindrome1.count > LPS.count {
            LPS = palindrome1
        }
        
        // ---- Even-length palindrome ----
        low = i - 1
        high = i
        while low >= 0 && high < n && chars[low] == chars[high] {
            low -= 1
            high += 1
        }
        
        let palindrome2 = String(chars[(low + 1)..<high])
        if palindrome2.count > LPS.count {
            LPS = palindrome2
        }
    }
    return LPS
}
//Approach = start from 1 index and check for odd and even index
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: groupAnagrams
//https://leetcode.com/problems/group-anagrams
//https://youtu.be/C9V66KyZCP8?si=ERNDkJTpzul3GxSG
func groupAnagramsBrute(_ strs: [String]) -> [[String]] {
    let n = strs.count
    var res = [[String]]()
    var mappedIndex = [Int]()
    
    for i in 0..<n{
        guard !mappedIndex.contains(i) else { continue }
        var currentRes = [String]()
        
        currentRes.append(strs[i])
        mappedIndex.append(i)
        
        for j in 0..<n{
            guard i != j && !mappedIndex.contains(j) else { continue }
            let isAnagram = isAnagramOptimal(strs[i], strs[j])
            if isAnagram {
                currentRes.append(strs[j])
                mappedIndex.append(j)
            }
        }
        res.append(currentRes)
    }
    return res
}
//Approach = ls and check for anagram for each element
//T.C = BigO(n^n)
//A.S = BigO(n)


func groupAnagramsOptimal(_ strs: [String]) -> [[String]] {
    var res = [[String]]()
    var hashTable = [String:[String]]()
    for i in 0..<strs.count{
        let currentStr = strs[i]
        let currentSortedStr = String(strs[i].sorted())
        if hashTable[currentSortedStr] == nil {
            hashTable[currentSortedStr] = [currentStr]
        }else{
            hashTable[currentSortedStr]?.append(currentStr)
        }
    }
    for (_,values) in hashTable {
        var groupAnagram = [String]()
        for item in values {
            groupAnagram.append(item)
        }
        res.append(values)
    }
    return res
}
//Approach = sorting + mapping in hashmap
//T.C = BigO(2n)
//A.S = BigO(n)


//MARK: romanToInt
//https://leetcode.com/problems/roman-to-integer
//https://youtu.be/ULNj8zXNeC0?si=6BOVVETKOEU1c0Kr
//To understand - dry run for 4,6 (Int->Roman)
func romanToInt(_ s: String) -> Int {
    let sArray = Array(s)
    let n = sArray.count
    let hashTable = hashTableForRomanToInt()
    
    var lastRomanInt = hashTable[sArray[n-1]] ?? -1
    var res = lastRomanInt
    
    for i in (0..<n-1).reversed() {
        let currentRomanInt =  hashTable[sArray[i]] ?? -1
        if (currentRomanInt >= lastRomanInt) {
            res += currentRomanInt
        }else{
            res += -currentRomanInt
        }
        lastRomanInt = currentRomanInt
    }
    return res
}
//Approach = 
//T.C = BigO(n)
//A.S = BigO(1)



//MARK: LL--------------------
/*
 reverse
 llHasCycle
 */


//MARK: llHasCycle--------------------
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
//T.C = BigO()
//A.S = BigO()


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
    var resultCurrent: ListNode?
    var templist1 = list1
    var templist2 = list2
    while templist1 != nil && templist2 != nil {
        let firstListEl = templist1?.val ?? -1
        let secondListEl = templist2?.val ?? -1
        
        let firstArrElNode = ListNode(data: firstListEl)
        let secondArrElNode = ListNode(data: secondListEl)
        
        if firstListEl < secondListEl {
            appendNewNodeInResult(firstArrElNode, &resultHead, &resultCurrent)
            templist1 = templist1?.next
        }else if firstListEl > secondListEl {
            appendNewNodeInResult(secondArrElNode, &resultHead, &resultCurrent)
            templist2 = templist2?.next
        }else{
            appendNewNodeInResult(firstArrElNode, &resultHead, &resultCurrent)
            templist1 = templist1?.next
            appendNewNodeInResult(secondArrElNode, &resultHead, &resultCurrent)
            templist2 = templist2?.next
        }
    }
    while templist1 != nil {
        let node = ListNode(data: templist1?.val ?? -1)
        appendNewNodeInResult(node, &resultHead, &resultCurrent)
        templist1 = templist1?.next
    }
    while templist2 != nil {
        let node = ListNode(data: templist2?.val ?? -1)
        appendNewNodeInResult(node, &resultHead, &resultCurrent)
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
    var resultCurrent: ListNode?
    var templist1 = list1
    var templist2 = list2
    while templist1 != nil && templist2 != nil {
        let firstListEl = templist1?.val ?? -1
        let secondListEl = templist2?.val ?? -1
        
        if firstListEl < secondListEl {
            let next = templist1?.next
            appendNewNodeInResult1(templist1!, &resultHead, &resultCurrent)
            templist1 = next
        }else if firstListEl > secondListEl {
            let next = templist2?.next
            appendNewNodeInResult1(templist2!, &resultHead, &resultCurrent)
            templist2 = next
        }
        else{
            let templist1Next = templist1?.next
            let templist2Next = templist2?.next
            appendNewNodeInResult1(templist1!, &resultHead, &resultCurrent)
            templist1 = templist1Next
            appendNewNodeInResult1(templist2!, &resultHead, &resultCurrent)
            templist2 = templist2Next
        }
    }
    while templist1 != nil {
        let next = templist1?.next
        appendNewNodeInResult1(templist1!, &resultHead, &resultCurrent)
        templist1 = next
    }
    while templist2 != nil {
        let next2 = templist2?.next
        appendNewNodeInResult1(templist2!, &resultHead, &resultCurrent)
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
    let secondHaldReversedHead = reverseList(slow?.next)
    
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
    slow?.next = reverseList(secondHaldReversedHead)
    
    return isPalin
}
//Approach = reverse 2nd half with(Tortoise and Hare /slow+fast pointer)
//T.C = BigO(2n)
//A.S = BigO(1)



//MARK: Stk-Queue----------------



//MARK: isValidParentheses
//https://leetcode.com/problems/valid-parentheses
//https://youtu.be/TaWs8tIrnoA?si=6JXuoFsnl5AHUEwl
func isValidParentheses(_ s: String) -> Bool {
    var stack: [Character] = []
    for c in s {
        if c == "(" {
            stack.append(")")
        } else if c == "{" {
            stack.append("}")
        } else if c == "[" {
            stack.append("]")
        } else if stack.isEmpty || stack.removeLast() != c {
            return false
        }
    }
    return stack.isEmpty
}
/*
 Approach =
 For every opening bracket,add its relative closing bracket
 For every closing bracket,just look at the top of stack. If same pop else return false.
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
            let (a, b) = getLastTwoNum(&numbers)
            numbers.append(a * b)
        case "/":
            let (a, b) = getLastTwoNum(&numbers)
            numbers.append(a / b)
        case "+":
            let (a, b) = getLastTwoNum(&numbers)
            numbers.append(a + b)
        case "-":
            let (a, b) = getLastTwoNum(&numbers)
            numbers.append(a - b)
        default:
            numbers.append(Int(token) ?? 0)
        }
    }
    return numbers.last ?? -1
}

func getLastTwoNum(_ numbers: inout [Int]) -> (a: Int, b: Int) {
    guard numbers.count > 1 else { return (a: 0, b: 0) }
    let b = numbers.removeLast()
    let a = numbers.removeLast()
    return (a: a, b: b)
}




/*
Revision:
 reverseList
 */
