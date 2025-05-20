//
//  main.cpp
//  DsaPracticeC++
//
//  Created by ekincare on 20/11/23.
//

#include <iostream>
#include <cstdlib>
#include <cmath>
#include <vector>
#include <iomanip>
#include <set>
#include <unordered_set>
#include <stack>
#include <map>

using namespace std;
long long int M = 1e9+7;

//MARK: Helper Functions--------------------------

int combineIntegers(int a, int b) {
    int digits = (b == 0) ? 1 : log10(b) + 1; // Find the number of digits in b
    return a * pow(10, digits) + b;
}

void deleteAtIndex(std::vector<int>& vec, int index) {
    if (index >= 0 && index < vec.size()) {
        vec.erase(vec.begin()+index);
    } else {
        std::cout << "Invalid index!" << std::endl;
    }
}

bool contains(const std::vector<int>& vec, int element) {
    // Use std::find to search for the element
    return std::find(vec.begin(), vec.end(), element) != vec.end();
}

void printPowerSetArrayofIntegersIterative(int arr[], int n){
    int size = pow(2, n);
    for (int i=0; i<(1<<n); i++) {
        for (int j=0; j<n; j++) {
            if((i&(1<<j))!=0){
                cout<<"-"<<arr[j]<<"-";
            }
        }
        cout<<"\n";
    }
}

void printPowerSetArrayofIntegersRecursive(int arr[], int current, int i, int n){
    if(i==n){
        cout<<current<<"\n";
        return;
    }
    printPowerSetArrayofIntegersRecursive(arr, current, i+1, n);
    current = combineIntegers(arr[i], current);
    printPowerSetArrayofIntegersRecursive(arr, current, i+1, n);
}


void printPowerSetRecursionRecursive(string s, string current, int i){
    if(i==s.length()){
        cout<<current<<"\n";
        return;
    }
    
    printPowerSetRecursionRecursive(s, current, i+1);
    current = current+s[i];
    printPowerSetRecursionRecursive(s, current, i+1);
}

void reverseArrayFrmIndex(vector<int> &nums, int str, int end){
    while (str<=end) {
        swap(nums[str], nums[end]);
        str++;
        end--;
    }
}

bool isPrimeEfficientMore(int n){
    if(n<=1){
        return false;
    }
    if (n==2 || n==3){
        return true;
    }
    if(n%2==0 || n%3==0){
        return false;
    }
    for (int i=5; i<=sqrt(n); i=i+6) {
        if(n%i==0 || n%(i+2)==0){
            return false;
        }
    }
    return true;
}


//MARK: PRACTICE

int practice(vector<int>& nums, int k) {
    int n = nums.size(); // size of the array.
    map<int, int> mp;
    int sum = 0;
    int maxLen = 0;
    for (int i = 0; i < n; i++) { // starting index
        sum += nums[i];
        if(sum == k){
            maxLen = max(maxLen, i+1);
        }
        int rem = sum-k;
        if(mp.find(rem) != mp.end()){
            int len = mp[rem] - i;
            maxLen = max(maxLen, len);
        }
        mp[sum] = i;
    }
    // Avoid this block for time complexity
//    for (int i=0; i<tempArray.size(); i++) {
//        cout<<tempArray[i]<<" ";
//    }
    return maxLen;
}
// T.C - BigO(n^3)
// A.S - BigO(1)


bool practice1(int arr[], int n) {
    return true;
}
// T.C - BigO(nums1*nums2)
// A.S - BigO(1)

int main() {
    int fixedArray[5] = {1,2,3,4,5};
    int n = sizeof(fixedArray)/sizeof(fixedArray[0]);
    //    vector<int> vectorArray1{2,2,3,3,4,5,6};
    //    vector<int> vectorArray2{1,2,3,3,5,6,6,7};
    vector<int> vectorArray1{1,2,3};
    vector<int> vectorArray2{18,28, 26 ,28, 47 ,48 ,49, 71 ,77, 83, 92};
   
    int res = practice(vectorArray1, 3);
    cout<<res<<endl;
    return 0;
}



/*
 Rivision Required-:
 -------- Maths -------
 fibenacchiRecursive
 factorialRecursive
 gcdEuclidRecursive
 
 prime factors (all questions)
 seive
 power (all questions)
 
 exactly3DivisorMyNaive - till n
 exactly3DivisorsEfficient - till n
 modInverse
 
 -------- Recursion -------
 except basics
 
 -------- Sorting -------
 merge and quick

 */


//void practice(vector<int> &nums){
//    int n = nums.size();
//    if(n==0 || n==1){
//        return;
//    }
//    int tempN = n;
//    for (int i=0; i<tempN; i++) {
//        while (nums[i] == 0 && i<(n-1)) {
//            for (int j=i; j<tempN-1; j++) {
//                nums[j] = nums[j+1];
//            }
//            tempN--;
//            nums[tempN] = 0;
//        }
//    }
//    for (int i=0; i<n; i++) {
//        cout<<nums[i]<<" ";
//    }
//}
