//
//  StringViewController.swift
//  dsaPractice
//
//  Created by ekincare on 03/11/23.
//

import UIKit
import Foundation

class StringVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        practice(s: "abc")
    }
    
    private func practice(s:String){
        //let lastChar = s[s.index(s.startIndex, offsetBy: 3)]
        var rev = "a"
        for char in s{
            rev = rev + "\(char)"
        }
        print(rev)
    }
    
    private func reverseString(text: String) -> String{
        var reversedString = ""
        for char in text{
            reversedString = "\(char)" + reversedString
        }
        return reversedString
    }
    
    private func findVovelsAndConsonnts(text: String){
        var vovels = 0
        var consonants = 0
        for char in text{
            let k = "\(char)"
            if k == "a" || k == "e" || k == "i" || k == "o" || k == "u"{
                vovels += 1
            }else{
                consonants += 1
            }
        }
        print(vovels)
        print(consonants)
    }
    
    private func findPalindromeOrNot(_ n : String) -> Bool{
        let length = n.count
        if(length<=0){
            return true
        }
        for i in 0...(length)/2{
            let firstChar = n[n.index(n.startIndex, offsetBy: i)]
            let lastChar  = n[n.index(n.startIndex, offsetBy: length-1-i)]
            if(firstChar != lastChar){
                return false
            }
        }
        return true
    }
    
    func areAnagrams(_ str1: String, _ str2: String) -> Bool {
        // Check if the lengths are the same
        guard str1.count == str2.count else {
            return false
        }

        // Create character frequency dictionaries for both strings
        var charCount1 = [Character: Int]()
        var charCount2 = [Character: Int]()

        // Count the frequency of characters in the first string
        for char in str1 {
            charCount1[char, default: 0] += 1
        }

        // Count the frequency of characters in the second string
        for char in str2 {
            charCount2[char, default: 0] += 1
        }

        // Compare the character frequencies
        return charCount1 == charCount2
    }
}
