//
//  Strings.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 21/09/25.
//

import Foundation

/*
 In Swift String there is no random access by index.

 Looping with String.index(offsetBy:) causes O(i) time complexity.
 func strIndexDemo(s: String) {
     let firstIndex = s.index(s.startIndex, offsetBy: 0)
     print(s[firstIndex])
 }

 For DSA problems, always convert String → [Character], operate, then String(array).
 “Although converting a String to an array costs O(n) once, it enables O(1) indexing and avoids repeated O(n) String.Index access, making it more efficient overall for DSA problems.”

 Use String.Index only when Unicode correctness matters (e.g., real text processing).
 */



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
/*
 (if stk.isEmpty() -> pushToStk+!pushToAns )
 (if !stk.isEmpty() -> pushToStk+pushToAns )
 */

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
    //create array of words
    var sArray = s.split(separator: " ")
    //reverse the array of words
    var start = 0
    var end = sArray.count - 1
    while start < end {
        sArray.swapAt(start, end)
        start += 1
        end -= 1
    }
    //join the reverse the array of words
    return sArray.joined(separator: " ")
}
//Approach = create array of words -> reverse the array
//T.C =
//A.S =


func reverseWords1(_ s: String) -> String {
    var sArray = Array(s)
    let n = sArray.count
    var ans = ""

    sArray.reverse()
    var i = 0
    while i < n {
        var currentWord = ""
        while i < n && sArray[i] != " " {
            currentWord.append(sArray[i])   //O(1) append to Character buffer
            i += 1
        }
        // Skip spaces
        i += 1
        if !currentWord.isEmpty {
            // avoids extra string creation
            if !ans.isEmpty{
                ans.append(" ")
            }
            ans.append(contentsOf: currentWord.reversed())
        }
    }
    return ans
}
//Approach - Reverse string -> reverse every word
//T.C = BigO(n)
//A.S = BigO(n)


//MARK: largestOddNumber
//https://leetcode.com/problems/largest-odd-number-in-string/description/
//https://youtu.be/y_7TC98ZO1Y?si=UPzs7Fq_cEDEw_t7
func largestOddNumber(_ num: String) -> String {
    //Avoiding TC for now
    let numArray = Array(num)
    let n = numArray.count
    var lastOddNumberIndex = -1
    for i in stride(from: n-1, through: 0, by: -1){
        if let currentNum = numArray[i].wholeNumberValue , (currentNum%2 != 0) {
            lastOddNumberIndex = i
            break
        }
    }
    return lastOddNumberIndex == -1 ? "" : String(numArray[0...lastOddNumberIndex])
}
//Approach = ConvertStringToArray + find last odd index
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Longest Common Prefix
//https://leetcode.com/problems/longest-common-prefix/description/
//https://youtu.be/wtOQaovlvhY?si=CZs70Mm9U6Qdp1Jv
func longestCommonPrefixBrute(_ strs: [String]) -> String {
    // Edge case: empty input
    if strs.isEmpty { return "" }
    
    // Convert first string to array of characters (reference)
    let first = Array(strs[0])
    var prefix = ""
    
    // Iterate through each character of the first string
    for i in 0..<first.count {
        let ch = first[i]
        
        // Compare this character with the same position in all other strings
        for j in 1..<strs.count {
            let currentStringArr = Array(strs[j])
            
            // If this string is shorter OR character mismatch → stop here
            if i >= currentStringArr.count || currentStringArr[i] != ch {
                return prefix
            }
        }
        
        // If all matched → add to prefix
        prefix.append(ch)
    }
    return prefix
}
//Approach = ls+BS
//T.C = BigO(n^2)
//A.S = BigO(1)


func longestCommonPrefixOptimal(_ strs: [String]) -> String {
    let n = strs.count
    if n == 0 { return "" }
    if n == 1 { return strs[0] }
    
    // Sort the array
    let sortedStrs = strs.sorted()
    
    // Convert first and last strings into character arrays
    let firstChars = Array(sortedStrs.first!)
    let lastChars = Array(sortedStrs.last!)
    
    // Find minimum length between them
    let minLength = min(firstChars.count, lastChars.count)
    
    var ans = ""
    for i in 0..<minLength {
        if firstChars[i] == lastChars[i] {
            ans.append(firstChars[i])
        } else {
            break
        }
    }
    return ans
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
    // If lengths don't match → not isomorphic
      guard s.count == t.count else { return false }
      // Convert both strings to character arrays for O(1) index access
      let sChars = Array(s)
      let tChars = Array(t)
      
      var mapST = [Character: Character]()
      var mapTS = [Character: Character]()
      
      for i in 0..<sChars.count {
          let charS = sChars[i]
          let charT = tChars[i]
          
          if let mapped = mapST[charS], mapped != charT {
              return false
          }
          if let mapped = mapTS[charT], mapped != charS {
              return false
          }
          // Create mapping both ways
          mapST[charS] = charT
          mapTS[charT] = charS
      }
      return true
}
//Approach = ls+dualMap
//T.C = BigO(n)
//A.S = BigO(1) //as there are limited char in asci.


func isIsomorphic1(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    let str1 = Array(s)
    let str2 = Array(t)
    
    var mapST: [Character: Character] = [:] // s → t
    var mapTS: [Character: Character] = [:] // t → s
    
    for i in 0..<str1.count {
        let firstChar = str1[i]
        let secondChar = str2[i]
        
        if let mapped = mapST[firstChar], mapped != secondChar {
            return false
        }
        if let mapped = mapTS[secondChar], mapped != firstChar {
            return false
        }
        mapST[firstChar] = secondChar
        mapTS[secondChar] = firstChar
    }
    return true
}
//Approach = ls+SingleMap
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
//Approach = sorting
//T.C = BigO(slogs+tlogt)
//A.S = BigO(s+t)


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

func hashTableForRomanToInt() -> [Character:Int]{
    var hashTable = [Character:Int]()
    hashTable["I"] = 1
    hashTable["V"] = 5
    hashTable["X"] = 10
    hashTable["L"] = 50
    hashTable["C"] = 100
    hashTable["D"] = 500
    hashTable["M"] = 1000
    return hashTable
}




//MARK: Strings Picked----------------------



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
//Approach = start from 1 index and check for odd and even length
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
            res -= currentRomanInt
        }
        lastRomanInt = currentRomanInt
    }
    return res
}
//Approach =
//T.C = BigO(n)
//A.S = BigO(1)


/*
 Revision:
 Strings Picked
 */
