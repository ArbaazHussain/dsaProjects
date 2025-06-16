//
//  Array.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 22/12/24.
//

#include <iostream>
#include <vector>
#include <set>
#include <map>

using namespace std;
using std::cout;
using std::endl;


//MARK: ----Array------
/*
* Array Advantages -:
 random access
 cache friendlines
 
* Array Types -:
 Fixed Array
 Dynamic Array
 
* Vectors(Dynamic Array) Advantages as compare to Fixed Array:
 Dynamic size array
 rich library function(find,erase,insert,etc)
 easy to know size
 no need to pass size
 can be returned from a function
 by default initialized by default value
 we can copy copy a vector to another.
 
* We can store array of size 1e6 in local function, 1e7 as global variable.
 */



//MARK: Helper Functions
void deleteAtIndex(std::vector<int>& vec, int index) {
    if (index >= 0 && index < vec.size()) {
        vec.erase(vec.begin()+index);
    } else {
        std::cout << "Invalid index!" << std::endl;
    }
}

void reverseArrayFrmIndex(vector<int> &nums, int str, int end){
    while (str<=end) {
        swap(nums[str], nums[end]);
        str++;
        end--;
    }
}


//MARK: ------Gfg Basics------



//MARK: arrayBasic
void arrayBasic(){
    //Fixed Array-:
    int fixedArray[100]; //stack allocated
    
    int fixedArray1[] = {2,2,1,3,2,1,3,4,5}; //stack allocated
    
    int sizeOfArray = sizeof(fixedArray1)/sizeof(fixedArray1[0]);
    cout<<sizeOfArray<<endl;
    
    
    //Dynamic Array-:
    //allocate
    int *dynamicArray = new int[3];
    //deallocate
    delete[] dynamicArray;
    //remove pointer
    dynamicArray=NULL;
    
    
    //Vectors(Dynamic Array)-:
    vector<int> vectorArray{10, 5, 2, 3, 6};
    vector<int> currentVectorArray{};
    long int sizeOfVectorArray = vectorArray.size();
    cout<<sizeOfVectorArray<<endl;
}


//MARK: insertElementInFixedArray
void insertElementInFixedArray(int arr[], int cap, int occupied, int x, int pos){
    if(pos>cap || pos<=0){
        cout<<"invalid position"<<endl;
        return;
    }
    if(cap==occupied){
        cout<<"no space"<<endl;
        return;
    }
    int index=pos-1;
    for (int i=occupied-1; i>=index; i--) {
        arr[i+1] = arr[i];
    }
    arr[pos-1] = x;
    //Avoid this block for time complexity
    for (int i=0; i<cap; i++) {
        cout<<arr[i]<<endl;
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: deleteElementInFixedArray
void deleteElementInFixedArray(int arr[], int cap, int x){
    int index=-1;
    //searching the element
    for (int i=0; i<cap; i++){
        if(arr[i]==x){
            index=i;
            break;
        }
    }
    if(index==-1){
        cout<<"element to be deleted is not present"<<endl;
        return;
    }
    for (int i=index; i<cap; i++) {
        if(i<cap-1){
            arr[i]=arr[i+1];
        }else{
            arr[i]=0;
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<cap; i++) {
        cout<<arr[i]<<endl;
    }
}
//T.C = BigO(n), if delete the last element then T.C is Big0(1)
//A.S = BigO(1)



//MARK: ------Strivers------



//MARK: largestElementBrute
int largestElementBrute(vector<int>& nums) {
    unsigned long int n = nums.size();
    std::sort(nums.begin(), nums.end());
    return nums[n-1];
}
//Approach = sorting
//T.C = BigO(n logn)
//A.S = BigO(n)


//MARK: largestElementOptimal
int largestElementOptimal(vector<int>& nums) {
    long int n = nums.size();
    int largestIndex=0;
    for (int i=1; i<n; i++) {
        if(nums[i]>nums[largestIndex]){
            largestIndex=i;
        }
    }
    return nums[largestIndex];
}
//Approach = linear search
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: secondLargestBrute
int secondLargestBrute(vector<int> &nums) {
    unsigned long int n = nums.size();
    std::sort(nums.begin(), nums.end());
    int secondLargestIndex = n-2;
    for (int i=secondLargestIndex; i>=0; i--) {
        if(nums[i] != nums[n-1]){
            return nums[i];
        }
    }
    return -1;
}
//Approach = sorting
//T.C = BigO( (nLogn) + n )
//A.S = BigO(n)


//MARK: secondLargestBetter
int secondLargestBetter(vector<int> &nums) {
    int max = nums[0];
    if(nums.size()==1){
        return max;
    }
    for (int i=1; i<nums.size(); i++) {
        if(nums[i]>max){
            max = nums[i];
        }
    }
    int secondMax = -1;
    for (int i=0; i<nums.size(); i++) {
        if(nums[i]>secondMax && nums[i]<max){
            secondMax = nums[i];
        }
    }
    return secondMax;
}
//Approach = linear search
//T.C = BigO(2n)
//A.S = BigO(1)


//MARK: secondLargestOptimal
int secondLargestOptimal(vector<int> &nums) {
    int secondMax = -1;
    int max = nums[0];
    
    for (int i=1; i<nums.size(); i++) {
        if(nums[i]>max){
            int tempMax = max;
            max = nums[i];
            secondMax = tempMax;
        }
        if(nums[i]<max && nums[i]>secondMax){
            secondMax = nums[i];
        }
    }
    return secondMax;
}
//Approach = linear search
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: isArraySortedInIncreasing
//https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/
int isArraySortedInIncreasing(int arr[], int n){
    for (int i=0; i<n-1; i++) {
        if(arr[i]>arr[i+1]){
            return false;
        }
    }
    return true;
}
//Approach = linear search
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: removeDuplicatesInSortedArrayMyBrute
//https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
void removeDuplicatesMy(vector<int>& nums) {
    unsigned long int n = nums.size();
    for (int i=0; i<n-1; i++) {
        while (nums[i]==nums[i+1]) {
            deleteAtIndex(nums, i+1);
            n = n-1;
            if(i==(n-1)){
                break;
            }
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<nums.size(); i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = my brute
// T.C - BigO(n^2)
// A.S - BigO(1)


//MARK: removeDuplicatesInSortedArrayBrute
int removeDuplicatesInSortedArrayBrute(vector<int>& nums){
    set<int> st;
    for (int i=0; i<nums.size(); i++) {
        st.insert(nums[i]);
    }
    int j=0;
    for (int val : st) {
        nums[j] = val;
        j++;
    }
    return st.size();
}
//Approach = set
//T.C = BigO(n*logn + n)
//A.S = BigO(n)


//MARK: removeDuplicatesInSortedArrayOptimal
int removeDuplicatesInSortedArrayOptimal(vector<int>& nums)
{
    unsigned long int n = nums.size();
    int i = 0;
    for (int j = 1; j < n; j++) {
        if (nums[i] != nums[j]) {
            i++;
            nums[i] = nums[j];
        }
    }
    return i + 1;
}
//Approach = two pointer
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: LeftRotateByOnePlace
void LeftRotateByOnePlace(vector<int> &nums){
    unsigned long int n = nums.size();
    int firstElement = nums[0];
    for (int i=1; i<n; i++) {
        nums[i-1] = nums[i];
    }
    nums[n-1] = firstElement;
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = linear
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: LeftRotateByDPlaceBrute
void LeftRotateByDPlaceBrute(vector<int> &nums, int d){
    int n = nums.size();
    if(d>n){
        d = d%n;
    }
    if(n == d ){
        return;
    }
    vector<int> tempArray{};
    int z = 0;
    for (int i=0; i<n; i++) {
        if(i<d){
            tempArray.push_back(nums[i]);
        }else{
            nums[z] = nums[i];
            z++;
        }
    }
    int x = n-d;
    for (int i=0; i<d; i++) {
        nums[x] = tempArray[i];
        x++;
    }
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = linear
// T.C - BigO(n+d)
// A.S - BigO(d)


//MARK: rightRotateByDPlaceBrute
//https://leetcode.com/problems/rotate-array/description/
void rightRotateByDPlaceBrute(vector<int> &nums, int d){
    int n = nums.size();
    if(d>n){
        d = d%n;
    }
    if(n == d ){
        return;
    }
    vector<int> tempArray{};
    for (int i=0; i<d; i++) {
        int x = nums[(n-1)-i];
        tempArray.push_back(x);
    }
    int z = 0;
    for (int i=n-1; i>=0; i--) {
        if(i>=d){
            nums[i] = nums[i-d];
        }else{
            nums[i] = tempArray[z];
            z++;
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = linear
// T.C - BigO(n+d)
// A.S - BigO(d)


//MARK: LeftRotateByDPlaceOptimal
void LeftRotateByDPlaceOptimal(vector<int> &nums, int d){
    int n = nums.size();
    if(d>n){
        d = d%n;
    }
    if(n == d){
        return;
    }
    reverseArrayFrmIndex(nums, 0, d-1);
    reverseArrayFrmIndex(nums, d, n-1);
    reverseArrayFrmIndex(nums, 0, n-1);
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = swap the parts of array
// T.C - BigO(2n)
// A.S - BigO(1)


//MARK: moveZeroesToEndBrute
//https://leetcode.com/problems/move-zeroes/description/
void moveZeroesToEnd(vector<int>& nums) {
    int n = nums.size();
    vector<int> tempArray{};
    for (int i=0; i<n; i++) {
        if(nums[i]!=0){
            tempArray.push_back(nums[i]);
        }
    }
    for (int i=0; i<n; i++) {
        if(i<tempArray.size()){
            nums[i] = tempArray[i];
        }else{
            nums[i] = 0;
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = linear
// T.C - BigO(2n)
// A.S - BigO(n)


//MARK: moveZeroesToEndOptimal
void moveZeroesToEndOptimal(vector<int>& nums) {
    int n = nums.size();
    int j = -1;
    bool gotFirstZero = false;
    for (int i=0; i<n; i++) {
        if(nums[i]==0 && !gotFirstZero){
            j = i;
            gotFirstZero = true;
            continue;
        }
        if(gotFirstZero){
            if(nums[i] != 0){
                swap(nums[j], nums[i]);
                j++;
            }
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<nums[i]<<" ";
    }
}
//Approach = two pointer
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: linearSearch
int linearSearch(vector<int> &nums, int target){
    int n = nums.size();
    for (int i=0; i<n; i++) {
        if(nums[i] == target ){
            return i;
        }
    }
    return -1;
}
//Approach = linear
// T.C - BigO(n)
// A.S - BigO(1)


//MARK: unionOfSortedArrayBrute
void unionOfSortedArrayBrute(vector<int>& nums1, vector<int>& nums2) {
    set<int> st;
    for (int i=0; i<nums1.size(); i++) {
        st.insert(nums1[i]);
    }
    for (int i=0; i<nums2.size(); i++) {
        st.insert(nums2[i]);
    }
    for (int val : st) {
        cout<<val<<" ";
    }
}
//Approach = set
// T.C - BigO(n1logn + n2logn)
// A.S - BigO(n1+n2)


//MARK: unionOfSortedArrayOptimal
void unionOfSortedArrayOptimal(vector<int>& nums1, vector<int>& nums2) {
    vector<int> unionArray{};
    int i = 0;
    int j = 0;
    while (i<nums1.size() && j<nums2.size()) {
        if(nums1[i] < nums2[j]){
            if(unionArray.size() == 0 || (unionArray.back() != nums1[i])){
                unionArray.push_back(nums1[i]);
            }
            i++;
        }else{
            if(unionArray.size() == 0 || (unionArray.back() != nums2[j])){
                unionArray.push_back(nums2[j]);
            }
            j++;
        }
    }
    while (i<nums1.size()) { // IF any element left in nums1
        if(unionArray.size() == 0 || (unionArray.back() != nums1[i])){
            unionArray.push_back(nums1[i]);
        }
        i++;
    }
    while (j<nums2.size()) { // If any elements left in nums2
        if(unionArray.size() == 0 || (unionArray.back() != nums2[j])){
            unionArray.push_back(nums2[j]);
        }
        j++;
    }
    //Avoid this block for time complexity
    for (int i=0; i<unionArray.size(); i++) {
        cout<<unionArray[i]<<" ";
    }
}
//Approach = two pointer
// T.C - BigO(n1+n2)
// A.S - BigO(n1+n2)


//MARK: intersectionOfSortedArrayBrute
//https://www.naukri.com/code360/problems/intersection-of-2-arrays_1082149
void intersectionOfSortedArrayBrute(vector<int>& nums1, vector<int>& nums2) {
    vector<int> unionArray{};
    int z = 0;
    for (int i=0; i<nums1.size(); i++) {
        for (int j=z; j<nums2.size(); j++) {
            if(nums1[i] == nums2[j]){
                unionArray.push_back(nums1[i]);
                z++;
                break;
            }
            if(nums2[j]>nums1[i]){
                break;
            }
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<unionArray.size(); i++) {
        cout<<unionArray[i]<<" ";
    }
}
//Approach = linear
// T.C - BigO(nums1*nums2)
// A.S - BigO(1)


//MARK: intersectionOfSortedArrayOptimal
void intersectionOfSortedArrayOptimal(vector<int>& nums1, vector<int>& nums2) {
    vector<int> unionArray{};
    int i = 0;
    int j = 0;
    while (i<nums1.size() && j<nums2.size()) {
        if(nums1[i] < nums2[j]){
            i++;
        }else if(nums1[i] > nums2[j]){
            j++;
        }else {
            unionArray.push_back(nums1[i]);
            i++;
            j++;
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<unionArray.size(); i++) {
        cout<<unionArray[i]<<" ";
    }
}
//Approach = two pointer
// T.C - BigO(n1+n2)
// A.S - BigO(n1+n2)


//MARK: missingNumberBrute
//https://leetcode.com/problems/missing-number/description/
int missingNumberBrute(vector<int>& nums) {
    for (int i=0; i<=nums.size(); i++) {
        bool isExist = false;
        for (int j=0; j<nums.size(); j++) {
            if(i == nums[j]){
                isExist = true;
                break;
            }
        }
        if(!isExist){
            return i;
        }
    }
    return -1;
}
//Approach = linear
//T.C = BigO(n*n)
//A.S = Big0 (1)


//MARK: missingNumberBetter
int missingNumberBetter(vector<int>& nums) {
    int n = nums.size();
        int hashArray[n+1];
        memset(hashArray, 0, sizeof(hashArray)); // Fast zero initialization
        
        for (int i=0; i<nums.size(); i++) {
            int currentItem = nums[i];
            hashArray[currentItem]++;
        }
        for (int i=0; i<n+1; i++) {
            if(hashArray[i] == 0){
                return i;
            }
        }
        return -1;
}
//Approach = hashing
//T.C = BigO(2n)
//A.S = Big0 (n)


//MARK: missingNumberOptimal1
int missingNumberOptimal1(vector<int>& nums) {
    int n = nums.size();
    int sum = n*(n+1)/2;
    int currentSum = 0;
    for (int i=0; i<n; i++) {
        currentSum = currentSum + nums[i];
    }
    return sum-currentSum;
}
//Approach = sumOfNnaturalNo
//T.C = BigO(n)
//A.S = Big0(1)


//MARK: missingNumberOptimal2
//This is slightly better than missingNumberOptimal1 bcz, array size can be big as 10^5 and sum of elements till 10^5 can be 10^10 which cannot be stored in int.
int missingNumberOptimal2(vector<int>& nums) {
    int n = nums.size();
    int xor1 = 0;
    int xor2 = 0;
    for (int i=0; i<=n; i++) {
        if(i<n){
            xor1 = xor1^i;
            xor2 = xor2^nums[i];
        }else{
            xor1 = xor1^i;
        }
    }
    return xor1^xor2;
}
//Approach = xor
//T.C = BigO(n)
//A.S = Big0(1)


//MARK: maxConsecutiveOnesOpitimal1(My)
//https://leetcode.com/problems/max-consecutive-ones/description/
int maxConsecutiveOnesOpitimal(vector<int>& nums) {
    int n = nums.size();
    int finalRes = 0;
    int currentRes = 0;
    for (int i=0; i<n; i++) {
        if(nums[i] == 1){
            currentRes++;
            if(i == (n-1)){
                finalRes = max(currentRes, finalRes);
                currentRes = 0;
            }
        }else if(nums[i] != 1){
            finalRes = max(currentRes, finalRes);
            currentRes = 0;
        }
    }
    return finalRes;
}
//Approach = linear
//T.C = BigO(n)
//A.S = Big0(1)


//MARK: maxConsecutiveOnesOpitimal2(stv)
int maxConsecutiveOnesOpitimal2(vector<int>& nums) {
    int n = nums.size();
    int cnt = 0;
    int maxi = 0;
    for (int i=0; i<n; i++) {
        if(nums[i] == 1){
            cnt++;
            maxi = max(maxi, cnt);
        }else {
            cnt = 0;
        }
    }
    return maxi;
}
//Approach = linear
//T.C = BigO(n)
//A.S = Big0(1)


//MARK: singleNumberBrute
//https://leetcode.com/problems/single-number/description/
int singleNumber(vector<int>& nums) {
    int n = nums.size();
    //Run a loop for selecting elements:
    for (int i = 0; i < n; i++) {
        int num = nums[i]; // selected element
        int cnt = 0;
        //find the occurrence using linear search:
        for (int j = 0; j < n; j++) {
            if (nums[j] ==  num)
                cnt++;
        }
        // if the occurrence is 1 return ans:
        if (cnt == 1) return num;
    }
    //This line will never execute
    //if the array contains a single element.
    return -1;
}
//Approach = linear
//T.C = BigO(n^2)
//A.S = Big0(1)


//MARK: singleNumberBetter1
int singleNumberBetter1(vector<int>& nums) {
    int n = nums.size();
    // Find the maximum element:
    int maxi = nums[0];
    for (int i = 0; i < n; i++) {
        maxi = max(maxi, nums[i]);
    }
    // Declare hash array of size maxi+1
    // And hash the given array:
    vector<int> hash(maxi + 1, 0);
    for (int i = 0; i < n; i++) {
        hash[nums[i]]++;
    }
    //Find the single element and return the answer:
    for (int i = 0; i < n; i++) {
        if (hash[nums[i]] == 1)
            return nums[i];
    }
    //This line will never execute
    //if the array contains a single element.
    return -1;
}
//Approach = hashing
//T.C = BigO(3n)
//A.S = BigO(maxElementInArray+1)


//MARK: singleNumberBetter2
//This is better than singleNumberBetter1 bcz, in singleNumberBetter1 we use hash array and it can not be used efficiently if we have -ve or very large elements(i.e: 10^12) in array.
int singleNumberBetter2(vector<int>& nums) {
    int n = nums.size();
    // Declare the hashmap.
    // And hash the given array:
    map<int, int> mpp;
    for (int i = 0; i < n; i++) {
        mpp[nums[i]]++;
    }
    //Find the single element and return the answer:
    for (auto it : mpp) {
        if (it.second == 1)
            return it.first;
    }
    //This line will never execute
    //if the array contains a single element.
    return -1;
}
//Approach = map

//M = size of the map
//T.C = BigO(N*logM) + O(M)
//A.S = BigO(M)


//MARK: singleNumberOptimal
int singleNumberOptimal(vector<int>& nums) {
    int n = nums.size();
    // XOR all the elements:
    int xorr = 0;
    for (int i = 0; i < n; i++) {
        xorr = xorr ^ nums[i];
    }
    return xorr;
}
//Approach = xor
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: longestSubarraywithsumKBrute1
//https://www.naukri.com/code360/problems/longest-subarray-with-sum-k_5713505
//https://leetcode.com/problems/subarray-sum-equals-k/description/
int longestSubarraywithsumKBrute1(vector<int>& nums, int k) {
    int n = nums.size();
    int len = 0;
    for (int i = 0; i < n; i++) { // starting index
        for (int j = i; j < n; j++) { // ending index
            // add all the elements of subarray = a[i...j]:
            long long sum = 0;
            for (int K = i; K <= j; K++) {
                sum += nums[K];
            }
            if (sum == k){
                len = max(len, j - i + 1);
            }
        }
    }
    return len;
}
//Approach = linear
//T.C = BigO(n^3)
//A.S = BigO(1)


//MARK: longestSubarraywithsumKBrute2
int longestSubarraywithsumKBrute2(vector<int>& nums, int k) {
    int n = nums.size(); // size of the array.
    int len = 0;
    for (int i = 0; i < n; i++) { // starting index
        long long s = 0; // Sum variable
        for (int j = i; j < n; j++) { // ending index
            // add the current element to
            // the subarray a[i...j-1]:
            s += nums[j];
            if (s == k) {
                len = max(len, j - i + 1);
            }
        }
    }
    return len;
}
//Approach = linear
//T.C = BigO(n^2)
//A.S = BigO(1)


//MARK: longestSubarraywithsumKBetter
//This is optimal solution if array is +ve and -ve elements
int longestSubarraywithsumKBetter(vector<int>& nums, int k) {
    int n = nums.size(); // size of the array.
    map<long long, int> preSumMap;
    long long sum = 0;
    int maxLen = 0;
    for (int i = 0; i < n; i++) {
        //calculate the prefix sum till index i:
        sum += nums[i];
        // if the sum = k, update the maxLen:
        if (sum == k) {
            maxLen = max(maxLen, i + 1);
        }
        // calculate the sum of remaining part i.e. x-k:
        long long rem = sum - k;
        //Calculate the length and update maxLen:
        if (preSumMap.find(rem) != preSumMap.end()) {
            int len = i - preSumMap[rem];
            maxLen = max(maxLen, len);
        }
        //Finally, update the map checking the conditions:
        if (preSumMap.find(sum) == preSumMap.end()) {
            preSumMap[sum] = i;
        }
    }
    return maxLen;
}
//Approach = linear+hashing
/*
 T.C -
 mppSize = map currentSize
 If orderedMap   : BigO(n*log(mppSize))
 If unOrderedMap : [BigO(n)] or [BigO(n^2) in case of worst case collision of map]
 
 A.S - BigO(n)
 */


//MARK: longestSubarraywithsumKOptimal
//This is optimal solution if array is only +ve and 0 elements
int longestSubarraywithsumKOptimal(vector<int>& nums, int k) {
    int n = nums.size(); // size of the array.
    int left = 0, right = 0; // 2 pointers
    long long sum = nums[0];
    int maxLen = 0;
    while (right < n) {
        // if sum > k, reduce the subarray from left
        // until sum becomes less or equal to k:
        while (left <= right && sum > k) {
            sum -= nums[left];
            left++;
        }
        // if sum = k, update the maxLen i.e. answer:
        if (sum == k) {
            maxLen = max(maxLen, right - left + 1);
        }
        // Move forward thw right pointer:
        right++;
        if (right < n) sum += nums[right];
    }
    return maxLen;
}
//T.C = BigO(2n)
//A.S = BigO(1)

 





//MARK: main function--------------------------
int main() {
    int fixedArray[] = {101,3,8,12,5,6,0,1001};
    int n = sizeof(fixedArray)/sizeof(fixedArray[0]);
    vector<int> vectorArray{1,1,2,2,2,3,3,1010};

    //Avoid this block for time complexity
//    for (int i=0; i<vectorArray.size(); i++) {
//        cout<<vectorArray[i]<<" ";
//    }

    cout<<endl;
    return 0;
}

