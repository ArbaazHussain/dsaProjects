//
//  Strings.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 21/09/25.
//

import Foundation


//MARK: frequenciesOfCharacter
func frequenciesOfCharacter(_ str: String) {
    var hashTable : [Character:Int] = [:]
    //prefetch
    for item in str {
        hashTable[item, default: 0] += 1
    }
    for(char,count) in hashTable {
        print("\(char) -> \(count)")
    }
}
//Approach = hashing
//k=number of unique characters in string.
//T.C = BigO(n+k)
//A.S = BigO(k)


//MARK: removeOuterParentheses
//https://leetcode.com/problems/remove-outermost-parentheses/description/
//https://youtu.be/I0osO1BqiGw?si=sx9kvSaM6d0qomD2
func removeOuterParenthesesBrute(_ s: String) -> String {
    var stack: [Character] = []
    var ans = String()
    for item in s {
        if stack.isEmpty {
            stack.append(item)
        }else{
            if(stack.last != item){
                stack.removeLast()
            }else{
                stack.append(item)
            }
            if !stack.isEmpty {
                ans.append(String(item))
            }
        }
    }
    return ans
}
//Approach = stack+BS
//n=s.count
//T.C = BigO(n)
//A.S = BigO(n)


func removeOuterParenthesesOptimal(_ s: String) -> String {
    var ans = String()
    var count = 0
    for item in s {
        if item == "("{
            if(count != 0){
                ans.append(item)
            }
            count += 1
        }else{
            count -= 1
            if(count != 0){
                ans.append(item)
            }
        }
    }
    return ans
}
//Approach = ls+counter(use stack logic)
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: reverseWords
//https://leetcode.com/problems/reverse-words-in-a-string/description/
//https://www.youtube.com/watch?v=RitppzIdMCo
func reverseWords(_ s: String) -> String {
    //Avoiding TC for now
    let str = Array(s)
    let n = s.count
    
    var ans = ""
    var i = 0
    while i<n {
        var currentWord : String = ""
        while i<n && str[i] != " "{
            currentWord +=  String(str[i])
            i += 1
        }
        i += 1
        guard !currentWord.isEmpty else { continue }
        if !currentWord.isEmpty {
            if !ans.isEmpty {
                ans = currentWord + " " + ans
            } else {
                ans = currentWord
            }
        }
    }
    return ans
}
//Approach = ls+concate
//T.C = BigO(n)
//A.S = BigO(1)


func reverseWordsOptimal(_ s: String) -> String {
    //Avoiding TC for now
    var ans = s.split(separator: " ")
    var start = 0
    var end = ans.count - 1
    
    while start < end {
        ans.swapAt(start, end)
        start += 1
        end -= 1
    }
    return ans.joined(separator: " ")
}
//Approach = ls+defaultFunctions
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: largestOddNumber
//https://leetcode.com/problems/largest-odd-number-in-string/description/
//https://youtu.be/y_7TC98ZO1Y?si=UPzs7Fq_cEDEw_t7
func largestOddNumber(_ num: String) -> String {
    //Avoiding TC for now
    let numArray = Array(num)
    let n = numArray.count
    var lastOddIndex = -1
    for i in stride(from: n-1, through: 0, by: -1){
        if let currentNum = numArray[i].wholeNumberValue , (currentNum%2 != 0) {
            lastOddIndex = i
            break
        }
    }
    if lastOddIndex != -1 {
        return String(numArray[0...lastOddIndex])
    }else{
        return ""
    }
}

//Approach = find last odd index
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Longest Common Prefix
//https://leetcode.com/problems/longest-common-prefix/description/
//https://youtu.be/wtOQaovlvhY?si=CZs70Mm9U6Qdp1Jv
func longestCommonPrefixMyBrute(_ strs: [String]) -> String {
    //Avoiding TC for now
    let strsArray = Array(strs)
    let n = strsArray.count
    var res = ""
    let firstStringCount = strsArray[0].count
    for i in 0..<firstStringCount {
        let firstStringChar = Array(strsArray[0])[i]
        var isMatched = true
        for j in 1..<n {
            let jStringCount = strsArray[j].count
            guard jStringCount > i else {
                isMatched = false
                break
            }
            let jStringChar = Array(strsArray[j])[i]
            if(firstStringChar != jStringChar){
                isMatched = false
                break
            }
        }
        if isMatched {
            res.append(firstStringChar)
        }else{
            break
        }
    }
    return res
}
//Approach = ls+BS
//T.C = BigO(n^2)
//A.S = BigO(1)


func longestCommonPrefixOptimal(_ strs: [String]) -> String {
    if strs.isEmpty {return ""}
    if strs.count == 1 {return strs[0]}
    
    var prefix = ""
    //O(n log n)
    let sortedArr = strs.sorted()
    let first = Array(sortedArr.first!)
    let last = Array(sortedArr.last!)
    
    for i in 0..<min(first.count, last.count){
        if first[i] == last[i]{
            prefix.append(first[i])
        }else{
            break
        }
    }
    return prefix
}
//Approach = sort + match first and last element
//m = maximum length of a string
//T.C = BigO(n log n)
//A.S = BigO(n)


//MARK: IsomorphicStrings
//https://youtu.be/ogTMIFPjNkQ?si=f-rTyNZIcqolXeQR
//https://youtu.be/YVlIJV2XSa8?si=JU0tDPbzAGZsAamr
//https://leetcode.com/problems/isomorphic-strings/description/
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if(s.count != t.count){
        return false
    }
    var m1 : [Character:Character] = [:]
    var m2 : [Character:Character] = [:]
    //Avoiding TC for now
    let str1 = Array(s)
    let str2 = Array(t)
    
    for i in 0..<str1.count {
        let firstChar = str1[i]
        let secondChar = str2[i]
        if let value = m1[firstChar] , value != secondChar {
            return false
        }else if let value = m2[secondChar] , value != firstChar {
            return false
        }else{
            m1[firstChar] = secondChar
            m2[secondChar] = firstChar
        }
    }
    return true
}
//Approach = ls+singleMap
//T.C = BigO(n)
//A.S = BigO(1) //as there are limited char in asci.


func isIsomorphic1(_ s: String, _ t: String) -> Bool {
    if(s.count != t.count){
        return false
    }
    var m1 : [Character:Character] = [:]
    //Avoiding TC for now
    let str1 = Array(s)
    let str2 = Array(t)
    
    for i in 0..<str1.count {
        let firstChar = str1[i]
        let secondChar = str2[i]
        if let value = m1[firstChar] , value != secondChar {
            return false
        }else if let (key, _) = m1.first(where: { $0.value == secondChar }) {
            if key != firstChar {
                return false
            }
        }else{
            m1[firstChar] = secondChar
        }
    }
    return true
}
//Approach = ls+dualMap
//T.C = BigO(n)
//A.S = BigO(1) //as there are limited char in asci.


//MARK: leftRotateStringByDPlaces
func leftRotateStringByDPlaces(_ str: String, _ d: Int) -> String {
    //Avoiding TC for now
    var chars = Array(str)
    let n = chars.count
    let d = d % n  // handle d > n
    if d == 0 || n == d {
        return str
    }
    // Reverse first d characters
    reverseCharArray(&chars, 0, d - 1)
    // Reverse remaining characters
    reverseCharArray(&chars, d, n - 1)
    // Reverse entire array
    reverseCharArray(&chars, 0, n - 1)
    return String(chars)
}
//Approach = swap the parts of array
// T.C - BigO(2n)
// A.S - BigO(1)


//MARK: Rotate String
//https://leetcode.com/problems/rotate-string/description/
//https://www.youtube.com/watch?v=2aT0Gm7-CtE&list=PLKPljATxsmLOYaHdR9Ns_DgXLHeNdgxW3&index=58
func rotateStringAndCheckBrute(_ s: String, _ goal: String) -> Bool {
    if(s == goal){
        return true
    }else if s.count != goal.count{
        return false
    }
    for i in 1..<s.count{
        let roatatedString = leftRotateStringByDPlaces(s, i)
        if(roatatedString == goal){
            return true
        }
    }
    return false
}
//Approach = try all possible rotations and check
//T.C = BigO(n*2n) //n=s.length()
//A.S = BigO(1)


func rotateStringAndCheckOptimal1(_ s: String, _ goal: String) -> Bool {
    if s == goal {
        return true
    }else if s.count != goal.count {
        return false
    }
    var q1 = Array(s)
    let q2 = Array(goal)
    var k = s.count - 1
    
    while k != 0 {
        let frontChar = q1.removeFirst()
        q1.append(frontChar)
        if(q1 == q2){
            return true
        }
        k -= 1
    }
    return false
}
//Approach = queue
//s=s.length() g=goal.length()
//T.C = BigO(s)
//A.S = BigO(s+g)


func rotateStringAndCheckOptimal2(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else {
        return false
    }
    let str = s + s
    return str.contains(goal)
}


//MARK: isAnagram
//https://leetcode.com/problems/valid-anagram/description/
//https://youtu.be/wKF6L9Zo8PQ?si=FoACftFZTiUPgnm9
func isAnagramBrute(_ s: String, _ t: String) -> Bool {
    let sortedS = s.sorted()
    let sortedT = t.sorted()
    return sortedS  == sortedT
}
//Approach = sortm = t.count
//n=s.count ,
//T.C = BigO(nlogn+mlogm)
//A.S = BigO(n+m)


func isAnagramOptimal(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    //Avoiding TC for now
    let sArray = Array(s)
    let tArray = Array(t)
    var hashTable : [Character:Int] = [:]
    for i in 0..<s.count{
        let firstChar = sArray[i]
        let secondChar = tArray[i]
        hashTable[firstChar ,default: 0] += 1
        hashTable[secondChar ,default: 0] -= 1
    }
    //Avoiding TC since there are limited char
    for val in hashTable.values {
        if val != 0{
            return false
        }
    }
    return true
}
//Approach = hashing
//n=s.count
//T.C = BigO(n)
//A.S = BigO(1) //since there are limited char







//MARK: Helper Functions
 func reverseCharArray(_ chars: inout [Character], _ start: Int, _ end : Int){
     var start = start
     var end = end
     while start <= end {
         chars.swapAt(start, end)
         start += 1
         end -= 1
     }
}
