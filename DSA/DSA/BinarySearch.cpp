//
//  BinarySearch.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 16/06/25.
//

#include <stdio.h>
#include <iostream>

using namespace std;
using std::cout;
using std::endl;

/*
 *Conceptual Topics*
 firstAppearenceStandardBS
 lastAppearenceStandardBS
 
 implementLowerBoundOptimal
 implementUpperBound
 searchinRotatedSortedUniqArrayOptimal
 singleElementInSortedArray
 */


//MARK: binarySearch
int binarySearchIterative(vector<int>& nums, int target) {
    int n = nums.size();
    int low = 0;
    int high = n-1;
    
    while (low <= high) {
        int mid = (low + high) / 2;
        if(nums[mid] == target){
            return mid;
        }else if(target > nums[mid]){
            low = mid+1;
        }else {
            high = mid-1;
        }
    }
    return -1;
}
//Approach = BinarySearch
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)


int binarySearchRecursive(vector<int>& nums, int low, int high, int target) {
    if (low>high) {
        return -1;
    }
    int mid = (low+high)/2;
    if (nums[mid] == target){
        return mid;
    }else if (target>nums[mid]){
        return binarySearchRecursive(nums, mid+1, high, target);
    }else{
        return binarySearchRecursive(nums, low, mid-1, target);
    }
}
//Approach = BinarySearch
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(log base2 n)


//MARK: implementLowerBoundBrute
//smallest index such that arr[index]>=x
//https://www.geeksforgeeks.org/problems/implement-lower-bound/1
int implementLowerBoundBrute(vector<int>& nums, int k) {
    int n = nums.size();
    for (int i=0; i<n; i++) {
        if(nums[i]>=k){
            return i;
        }
    }
    return n;
}
//Approach = LinearSearch
//T.C = BigO(n) //n=nums.size()
//A.S = BigO(1)


//smallest index such that arr[index]>=x
int implementLowerBoundOptimal(vector<int>& arr, int target) {
    int ans = arr.size();
    int low=0;
    int high=arr.size()-1;
    while(low<=high){
        int mid = (low + high) / 2;
        if(arr[mid]>=target){
            ans=mid;
            high = mid-1;
        }else{
            low = mid+1;
        }
    }
    return ans;
}
//Approach = BinarySearch
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)
//Default function :lower_bound(arr.begin(), arr.end(), target)


//MARK: implementUpperBound
//smallest index such that arr[index]>x
int implementUpperBound(vector<int>& arr, int target) {
    int ans = arr.size();
    int low=0;
    int high=arr.size()-1;
    while(low<=high){
        int mid = (low + high) / 2;
        if(arr[mid]>target){
            ans=mid;
            high = mid-1;
        }else{
            low = mid+1;
        }
    }
    return ans;
}
//Approach:same as implementLowerBound just replace  if(arr[mid]>=target) with if(arr[mid]>target)
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)
//Default function :upper_bound(arr.begin(), arr.end(), target)


//MARK: searchInsertPositionMy
//https://leetcode.com/problems/search-insert-position/description/
int searchInsertPositionMy(vector<int>& nums, int target) {
    int n = nums.size();
    int low = 0;
    int high = n-1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if(nums[mid] == target){
            return mid;
        }else if(target > nums[mid]){
            low = mid+1;
        }else {
            high = mid-1;
        }
    }
    return low;
}
//Approach = StandardBinarySearch and return low
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)


void searchInsertPosition(vector<int>& nums, int target) {}
//Approach = same algo of implementLowerBoundOptimal


//MARK: findCeil
//implementLowerBoundOptimal
//Ceil - smallest index such that arr[index]>=x.   [*****<-]
//https://www.geeksforgeeks.org/problems/ceil-in-a-sorted-array/1
int findCeil(vector<int>& arr, int x) {
    int ans = -1;
    int low=0;
    int high=arr.size()-1;
    while(low<=high){
        int mid = (low + high) / 2;
        if(arr[mid]>=x){
            ans=mid;
            high = mid-1;
        }else{
            low = mid+1;
        }
    }
    return ans;
}
//Approach = same algo of implementLowerBoundOptimal
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)


//MARK: findFloor
//Ceil - largest index such that arr[index]<=x.    [->*****]
//https://www.geeksforgeeks.org/problems/floor-in-a-sorted-array-1587115620/1
int findFloor(vector<int>& arr, int x) {
    int ans = -1;
    int low=0;
    int high=arr.size()-1;
    while(low<=high){
        int mid = (low + high) / 2;
        if(arr[mid]<=x){
            ans=mid;
            low = mid+1;
        }else{
            high = mid-1;
        }
    }
    return ans;
}
//Approach = same type algo of implementLowerBoundOptimal
//T.C = BigO(log base2 n) //n=nums.size()
//A.S = BigO(1)


//MARK: firstAndLastInSortedArray
//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
void firstAndLastInSortedArrayLbUb(vector<int>& nums, int target) {
    int lower = implementLowerBoundOptimal(nums, target);
    // Target not found or out of bounds
    if (lower == -1 || lower == nums.size() || nums[lower] != target) {
        cout<<-1<<"  "<< -1<<endl;
        return;
    }
    int upper = implementUpperBound(nums, target) - 1;
    cout<<lower<< "  "<<upper<<endl;
}
//Approach = lowerBound + upperBound
//T.C = BigO(2(log base2 n)) //n=nums.size()
//A.S = BigO(1)


int firstAppearenceStandardBS(vector<int>& nums, int target) {
    int ans = -1;
    int low=0;
    int high=nums.size()-1;
    while (low<=high) {
        int mid=(low+high)/2;
        if(nums[mid]==target){
            ans = mid;
            high=mid-1;
        }else if(nums[mid]>target){
            high=mid-1;
        }else{
            low=mid+1;
        }
    }
    return ans;
}

int lastAppearenceStandardBS(vector<int>& nums, int target) {
    int ans = -1;
    int low=0;
    int high=nums.size()-1;
    while (low<=high) {
        int mid=(low+high)/2;
        if(nums[mid]==target){
            ans = mid;
            low=mid+1;
        }else if(nums[mid]>target){
            high=mid-1;
        }else{
            low=mid+1;
        }
    }
    return ans;
}

void firstAndLastInSortedArrayStanardBS(vector<int>& nums, int target) {
    int firstAppearence = firstAppearenceStandardBS(nums, target);
    if(firstAppearence == -1){
        cout<<-1<<"  "<<-1<<endl;
        return;
    }
    int lastAppearence = lastAppearenceStandardBS(nums, target);
    cout<<firstAppearence<<"  "<<lastAppearence<<endl;
}
//Approach = standard BS for first and last occurence.
//T.C = BigO(2(log base2 n)) //n=nums.size()
//A.S = BigO(1)


//MARK: numberOfOccurrence
//https://www.naukri.com/code360/problems/occurrence-of-x-in-a-sorted-array_630456
int numberOfOccurrence(vector<int>& arr, int n, int x) {
    int firstAppearence = firstAppearenceStandardBS(arr, x);
    if(firstAppearence == -1){
        return 0;
    }else{
        int lastAppearence = lastAppearenceStandardBS(arr, x);
        return (lastAppearence-firstAppearence) + 1;
    }
}
//Approach = standard BS for first and last occurence.
//T.C = BigO(2(log base2 n)) //n=nums.size()
//A.S = BigO(1)


//MARK: searchinRotatedSortedArray-UniqueElements
//https://leetcode.com/problems/search-in-rotated-sorted-array/description/
int searchinRotatedSortedUniqArrayBrute(vector<int>& nums, int target) {
    int res = -1;
    for (int i=0; i<nums.size(); i++) {
        if(nums[i]==target){
            res = i;
        }
    }
    return res;
}
//Approach = ls
//T.C = BigO(n)
//A.S = BigO(1)


int searchinRotatedSortedUniqArrayOptimal(vector<int>& nums, int target) {
    int ans = -1;
    int low=0;
    int high=nums.size()-1;
    while (low<=high) {
        int mid=(low+high)/2;
        int midElement = nums[mid];
        int lowElement = nums[low];
        int highElement = nums[high];
        
        if(target==midElement){
            return mid;
        }else if((midElement>=lowElement)) { //check if left is sorted
            if(target>=lowElement && target<=midElement){
                high = mid-1;
            }else{
                low = mid+1;
            }
        }else{ //check if right is sorted
            if(target>=midElement && target<=highElement){
                low = mid+1;
            }else{
                high = mid-1;
            }
        }
    }
    return ans;
}
//Approach = standard BS + check for sorted half
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: searchinRotatedSortedArray-Dublicates
//https://leetcode.com/problems/search-in-rotated-sorted-array-ii/description/
int searchinRotatedSortedDubliArrayBrute(vector<int>& nums, int target) {
    int res = -1;
    for (int i=0; i<nums.size(); i++) {
        if(nums[i]==target){
            res = i;
        }
    }
    return res;
}
//Approach = ls
//T.C = BigO(n)
//A.S = BigO(1)


bool searchinRotatedSortedDubliArrayOptimal(vector<int>& nums, int target) {
    int ans = false;
    int low=0;
    int high=nums.size()-1;
    while (low<=high) {
        int mid=(low+high)/2;
        int midElement = nums[mid];
        int lowElement = nums[low];
        int highElement = nums[high];
        
        if(target==midElement){
            return true;
        }else if(lowElement == midElement && midElement == highElement){
            low++;
            high--;
            continue;
        }
        else if((midElement>=lowElement)) { //check if left is sorted
            if(target>=lowElement && target<=midElement){
                high = mid-1;
            }else{
                low = mid+1;
            }
        }else{ //check if right is sorted
            if(target>=midElement && target<=highElement){
                low = mid+1;
            }else{
                high = mid-1;
            }
        }
    }
    return ans;
}
//Approach = standard BS + check for sorted half
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: minimumInRotatedSortedArray
//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/
int minimumInRotatedSortedArray(vector<int>& nums, int target) {
    int ans = INT_MAX;
    int low=0;
    int high=nums.size()-1;
    while (low<=high) {
        int mid=(low+high)/2;
        int midElement = nums[mid];
        int lowElement = nums[low];
        if(midElement>=lowElement) { //check if left is sorted
            ans = min(lowElement, ans);
            low = mid+1;
        }else{ //check if right is sorted
            ans = min(midElement, ans);
            high = mid-1;
        }
    }
    return ans;
}
//Approach = standard BS + check for sorted half
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: howManyTimesArrayRotated
int howManyTimesArrayRotated(vector<int>& nums, int target) {
    int ans = INT_MAX;
    int ansIndex = -1;
    int low=0;
    int high=nums.size()-1;
    while (low<=high) {
        int mid=(low+high)/2;
        int midElement = nums[mid];
        int lowElement = nums[low];
        if(midElement>=lowElement) { //check if left is sorted
            if(lowElement<ans){
                ans = lowElement;
                ansIndex = low;
            }
            low = mid+1;
        }else{ //check if right is sorted
            if(midElement<ans){
                ans = midElement;
                ansIndex = mid;
            }
            high = mid-1;
        }
    }
    return ansIndex;
}
//Approach = minimumInRotatedSortedArray
//T.C = BigO(logn)
//A.S = BigO(1)


//MARK: singleElementInSortedArray
int singleElementInSortedArrayBrute1(vector<int>& nums) {
    int n=nums.size();
    if(n==1){
        return nums[0];
    }
    for (int i=0; i<n; i++) {
        if(i==0){
            if(nums[i]!=nums[i+1]){
                return nums[i];
            }
        }else if(i==(n-1)){
            if(nums[n-1]!=nums[n-2]){
                return nums[n-1];
            }
        }else if(nums[i]!=nums[i-1] && nums[i]!=nums[i+1]){
            return nums[i];
        }
    }
    return -1;
}
//Approach = ls
//T.C = BigO(n)
//A.S = BigO(1)


int singleElementInSortedArrayBrute2(vector<int>& nums) {
    int n = nums.size(); //size of the array.
    int res = 0;
    for (int i=0; i<n; i++) {
        res ^= nums[i];
    }
    return res;
}
//Approach = ls + xor
//T.C = BigO(n)
//A.S = BigO(1)


int singleElementInSortedArrayOptimal(vector<int>& nums) {
    int n = nums.size(); //size of the array.
    //Edge cases:
    if (n == 1) return nums[0];
    if (nums[0] != nums[1]) return nums[0];
    if (nums[n - 1] != nums[n - 2]) return nums[n - 1];
    int low = 1, high = n - 2;
    while (low <= high) {
        int mid = (low + high) / 2;
        //if arr[mid] is the single element:
        if (nums[mid] != nums[mid + 1] && nums[mid] != nums[mid - 1]) {
            return nums[mid];
        }
        //we are in the left:
        if ((mid % 2 == 1 && nums[mid] == nums[mid - 1])
            || (mid % 2 == 0 && nums[mid] == nums[mid + 1])) {
            //eliminate the left half:
            low = mid + 1;
        }
        //we are in the right:
        else {
            //eliminate the right half:
            high = mid - 1;
        }
    }
    // dummy return statement:
    return -1;
}
//Approach = bs + logic
//T.C = BigO(logn)
//A.S = BigO(1)





//MARK: main function--------------------------
int main() {
    int fixedArray[] = {101,3,8,12,5,6,0,1001};
    int n = sizeof(fixedArray)/sizeof(fixedArray[0]);
    vector<int> vectorArray{5,7,7,8,8,10};

//    firstAndLastInSortedArray(vectorArray, 0);
    //Avoid this block for time complexity
//    for (int i=0; i<vectorArray.size(); i++) {
//        cout<<vectorArray[i]<<" ";
//    }

    cout<<endl;
    return 0;
}
