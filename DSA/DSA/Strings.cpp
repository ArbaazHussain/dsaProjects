//
//  Strings.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 02/07/25.
//

#include <stdio.h>
#include <iostream>
#include <stack>
#include <map>

using namespace std;
using std::cout;
using std::endl;


//MARK: Helper Functions
string reverseSubstring(string s, int start, int end) {
    while (start < end) {
        swap(s[start], s[end]);
        start++;
        end--;
    }
    return s;
}

string leftRotateStringByD(string s, int d) {
    int n = s.size();
    if (n == 0) return s;

    d = d % n;
    if (d == 0) return s;

    // Reverse first d characters
    s = reverseSubstring(s, 0, d - 1);
    // Reverse remaining n - d characters
    s = reverseSubstring(s, d, n - 1);
    // Reverse the whole string
    s = reverseSubstring(s, 0, n - 1);

    return s;
}
//Approach = swap the parts of array
// T.C - BigO(2n)
// A.S - BigO(1)


//MARK: frequenciesOfCharacter
void frequenciesOfCharacter(string Str) {
    int hashArray[26] = {0};
    int hashArraySize = sizeof(hashArray)/sizeof(hashArray[0]);
    //prefetch
    for (int i=0; i<Str.length(); i++) {
        char currentChar = Str[i];
        int charIndex = currentChar - 'a';
        hashArray[charIndex]++;
    }
    for (int i=0; i<hashArraySize; i++) {
        char currentChar = 'a' + i;
        cout<<currentChar<<" "<<hashArray[i]<<endl;
    }
}
//Approach = hashing
//n=Str.length() , hashArraySize = 26
//T.C = BigO(n+hashArraySize)
//A.S = BigO(hashArraySize)


//MARK: removeOuterParentheses
//https://youtu.be/I0osO1BqiGw?si=sx9kvSaM6d0qomD2
//https://leetcode.com/problems/remove-outermost-parentheses/description/
string removeOuterParenthesesBrute(string s) {
    std::stack<char> st;
    string ans = "";
    for (char ch : s) {
        if(st.size() == 0){
            st.push(ch);
        }else{
            if(st.top() != ch){
                st.pop();
            }else{
                st.push(ch);
            }
            if(st.size() != 0){
                ans.push_back(ch);
            }
        }
    }
    return ans;
}
//Approach = stack+...
//n=s.length()
//T.C = BigO(n)
//A.S = BigO(n)


string removeOuterParenthesesOptimal(string s) {
    int count = 0;
    string ans = "";
    for (char ch : s) {
        if(ch == '('){
            if(count != 0){
                ans.push_back(ch);
            }
            count++;
        }else{
            count--;
            if(count != 0){
                ans.push_back(ch);
            }
        }
    }
    return ans;
}
//Approach = ls+counter
//n=s.length()
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: reverseWords
//https://leetcode.com/problems/reverse-words-in-a-string/description/
string reverseWordsMyOptimal(string s) {
    string res = "";
    string currentString = "";
    int n = s.size();
    bool firstWord = true;
    for (int i = 0; i < n; i++) {
        char currentChar = s[i];
        if (currentChar != ' ') {
            currentString += currentChar;
            if (i == n - 1 && !currentString.empty()) {
                if (!firstWord) {
                    res = " " + res;
                }
                res = currentString + res;
            }
        } else {
            if (!currentString.empty()) {
                if (!firstWord){
                    res = " " + res;
                }
                res = currentString + res;
                currentString = "";
                firstWord = false;
            }
        }
    }
    return res;
}
//Approach = ls+concate
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: largestOddNumber
//https://leetcode.com/problems/largest-odd-number-in-string/description/
//https://youtu.be/y_7TC98ZO1Y?si=UPzs7Fq_cEDEw_t7
string largestOddNumberOptimal(string num) {
    int n = num.length();
    int oddIndex = -1;
    for (int i = n-1; i>=0; i--) {
        int currentNum = num[i] - '0';
        if(currentNum%2 != 0){
            oddIndex = i;
            break;
        }
    }
    if(oddIndex == -1){
        return "";
    }else{
        return num.substr(0, oddIndex+1);
    }
}
//Approach = reverseLs
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Longest Common Prefix
//https://youtu.be/wtOQaovlvhY?si=CZs70Mm9U6Qdp1Jv
//https://leetcode.com/problems/longest-common-prefix/description/
string longestCommonPrefixBrute(vector<string>& strs) {
    if (strs.empty()) return "";
    for (int i = 0; i < strs[0].size(); ++i) {
        char c = strs[0][i];
        for (int j = 1; j < strs.size(); ++j) {
            if (i >= strs[j].size() || strs[j][i] != c) {
                return strs[0].substr(0, i);
            }
        }
    }
    return strs[0];  // all characters matched
}
//Approach = ls+...
//T.C = BigO(longestCommonPrefix*n)
//A.S = BigO(1)

string longestCommonPrefixOptimal(vector<string>& strs) {
    string ans="";
    sort(strs.begin(),strs.end());
    int n=strs.size();
    string first=strs[0],last=strs[n-1];
    for(int i=0;i<min(first.size(),last.size());i++){
        if(first[i]!=last[i]){
            return ans;
        }
        ans+=first[i];
    }
    return ans;
}
//Approach = ls+...
//T.C = BigO()
//A.S = BigO()


//MARK: IsomorphicStrings
//https://youtu.be/ogTMIFPjNkQ?si=f-rTyNZIcqolXeQR
//https://youtu.be/YVlIJV2XSa8?si=JU0tDPbzAGZsAamr
//https://leetcode.com/problems/isomorphic-strings/description/
bool isIsomorphic(string s, string t) {
    map<char, char> m1, m2;
    if(s.size() != t.size()){
        return false;
    }
    for (int i=0; i<s.size(); i++) {
        char firstChar = s[i];
        char secondChar = t[i];
        if(m1.find(firstChar) != m1.end()){
            if(m1[firstChar] != secondChar){
                return false;
            }
        }else if(m2.find(secondChar) != m2.end()){
            if(m2[secondChar] != firstChar){
                return false;
            }
        }else{
            m1[firstChar] = secondChar;
            m2[secondChar] = firstChar;
        }
    }
    return true;
}
//Approach = ls+map
//T.C = BigO(n)
//A.S = BigO(1) //as there are limited char in asci.


//MARK: Rotate String
//https://leetcode.com/problems/rotate-string/description/
bool rotateStringAndCheckMyBrute(string s, string goal) {
    if(s.length() != goal.length()){
        return false;
    }else if(s==goal){
        return true;
    }
    string rotatedString = s;
    for (int i=1; i<=s.length()-1; i++) {
        string currentRotatedString = leftRotateStringByD(rotatedString, 1);
        rotatedString = currentRotatedString;
        if(rotatedString==goal){
            return true;
        }
    }
    return false;
}
//Approach = try all possible rotations and check
//T.C = BigO(n*2n) //n=s.length()
//A.S = BigO(1)


bool rotateStringAndCheckOptimal(string s, string goal) {
    if(s.length() != goal.length()){
        return false;
    }else if(s==goal){
        return true;
    }
    queue<char> q1,q2;
    for (int i=0; i<s.length(); i++) {
        q1.push(s[i]);
    }
    for (int i=0; i<s.length(); i++) {
        q2.push(goal[i]);
    }
    int k=goal.length()-1;
    while (k!=0) {
        char frontChar = q2.front();
        q2.pop();
        q2.push(frontChar);
        if(q1==q2){
            return true;
        }
        k--;
    }
    return false;
}
//Approach = queue
//s=s.length() goal=goal.length()
//T.C = BigO(s+2n)
//A.S = BigO(s+n)


//MARK: isAnagram
//https://youtu.be/wKF6L9Zo8PQ?si=FoACftFZTiUPgnm9
//https://leetcode.com/problems/valid-anagram/description/
bool isAnagramBrute(string s, string t) {
    if (s.length() != t.length()) {
        return false;
    }
    sort(s.begin(), s.end());
    sort(t.begin(), t.end());
    return s == t;
}
//Approach = sort
//T.C = BigO(nlogn+mlogm)
//A.S = BigO(n+m)


bool isAnagramOptimal(string s, string t) {
    if (s.length() != t.length()) {
        return false;
    }
    
    vector<int> count(26, 0);
    for (int i = 0; i < s.length(); i++) {
        count[s[i] - 'a']++;
        count[t[i] - 'a']--;
    }
    //Avoiding TC since there are limited char
    for (int val : count) {
        if (val != 0) {
            return false;
        }
    }
    return true;
}
//Approach = hashing
//T.C = BigO(n+m)
//A.S = BigO(1) //since we have at most





//MARK: main function--------------------------
//int main() {
//    int fixedArray[] = {101,3,8,12,5,6,0,1001};
//    int n = sizeof(fixedArray)/sizeof(fixedArray[0]);
//    cout<<removeOuterParenthesesBrute("()()");
//    cout<<endl;
//    return 0;
//}
