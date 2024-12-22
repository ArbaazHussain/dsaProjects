//
//  main.cpp
//  DSA
//
//  Created by ekincare on 09/08/23.
//

#include <iostream>
#include <cstdlib>
#include <cmath>
#include <vector>
#include <iomanip>
#include <set>
#include <unordered_set>
#include <stack>

using namespace std;


//MARK: ----Array--------------------

//MARK: arrayBasic
void arrayBasic(){
    //Fixed Array-:
    int fixedArray[100];
    int fixedArray2[] = {2,2,1,3,2};
    int sizeOfArray = sizeof(fixedArray2)/sizeof(fixedArray2[5]); //le
    
    
    //Dynamic Array-:
    //allocate
    int *dynamicArray = new int[3];
    //deallocate
    delete[] dynamicArray;
    //remove pointer
    dynamicArray=NULL;
    
    
    //Vectors-:
    vector<int> vectorArray{10, 5, 2, 3, 6};
    vector<int> currentVectorArray{};
    int sizeOfVectorArray = vectorArray.size();
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


//MARK: largestElementIndex
int largestElementIndex(int arr[], int n){
    int largestIndex=0;
    for (int i=1; i<n; i++) {
        if(arr[i]>arr[largestIndex]){
            largestIndex=i;
        }
    }
    return largestIndex;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: secondlargestElementIndexNaive
int secondlargestElementIndexNaive(int arr[], int n){
    int largestIndex=largestElementIndex(arr, n);
    
    int secondLargestIndex=-1;
    
    for (int i=0; i<n; i++) {
        if(arr[i]!=arr[largestIndex]){
            if(secondLargestIndex==-1){
                secondLargestIndex=i;
            }
            else if(arr[i]>arr[secondLargestIndex]){
                secondLargestIndex=i;
            }
        }
    }
    return secondLargestIndex;
}
//T.C = BigO(n^2)
//A.S = BigO(1)


//MARK: secondlargestElementIndexEfficient
int secondlargestElementIndexEfficient(int arr[], int n){
    int largest= 0;
    int secondLargest = -1;
    for (int i=1; i<n; i++) {
        if(arr[i]>arr[largest]){
            secondLargest=largest;
            largest=i;
        }else if(arr[i]<arr[largest]){
            if(arr[i]>arr[secondLargest]){
                secondLargest=i;
            }
        }
    }
    return secondLargest;
} //T.C = Theta(n)
//A.S = BigO(1)


//MARK: isArraySortedInIncreasing
int isArraySortedInIncreasing(int arr[], int n){
    for (int i=1; i<n; i++) {
        if(arr[i-1]>arr[i]){
            return false;
        }
    }
    return true;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: reverseArray1
void reverseArray1(int arr[], int n){
    for (int i=0; i<n/2; i++) {
        int j=n-i-1;
        int temp=arr[i];
        arr[i]=arr[j];
        arr[j]=temp;
    }
    //Avoid this for T.C
    for (int j=0; j<n; j++) {
        cout<<arr[j]<<" ";
    }
}
//T.C = BigO(n) - i.e(n/2)
//A.S = BigO(1)


//MARK: reverseArray2
void reverseArray2(int arr[], int n){
    int start=0;
    int end=n-1;
    while (start<end) {
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        
        start++;
        end--;
    }
    //Avoid this for T.C
    for (int j=0; j<n; j++) {
        cout<<arr[j]<<" ";
    }
}
//T.C = BigO(n) - i.e(n/2)
//A.S = BigO(1)


//MARK: removeDuplicateeGfgNaive
int removeDuplicateSortedArrayGfgNaive(int a[],int n){
    int temp[n];
    
    temp[0]=a[0];
    int res=1;
    
    for (int i=1; i<n; i++) {
        if(temp[res-1]!=a[i]){
            temp[res]=a[i];
            res++;
        }
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<res; i++) {
        a[i]=temp[i];
    }
    return res;
}
//T.C = Theta(n)
//A.S = Theta(n)


//MARK: removeDuplicateeEfficient
void removeDuplicateSortedArrayEfficient(int arr[],int n){
    int res = 1;
    for (int i=1; i<n; i++) {
        if(arr[i] != arr[res-1]){
            arr[res] = arr[i];
            res++;
        }
    }
}
//T.C = Theta(n)
//A.S = BigO (1)


//MARK: moveZerosToEnd
void moveZerosToEndMyNaive(int arr[], int n) {
    int temp[n];
    int newN=0;
    int zeroInsertionAtLastCount=0;
    for (int i=0; i<n; i++) {
        if(arr[i]!=0){
            temp[newN]=arr[i];
            newN++;
        }else{
            temp[(n-1)-zeroInsertionAtLastCount]=0;
            zeroInsertionAtLastCount++;
        }
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<temp[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = Theta(n)


//MARK: moveZerosToEndGfgNaive
void moveZerosToEndGfgNaive(int arr[], int n) {
    for (int i=0; i<n; i++) {
        if(arr[i]==0){
            for (int j=i+1; j<n; j++) {
                if(arr[j]!=0){
                    int temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                    break;
                }
            }
        }
    }
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n^2)
//A.S = BigO (1)


//MARK: moveZerosToEndEfficient
void moveZerosToEndEfficient(int arr[], int n) {
    int count=0;
    for (int i=0; i<n; i++) {
        if(arr[i]!=0){
            int temp=arr[i];
            arr[i]=arr[count];
            arr[count]=temp;
            
            count++;
        }
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = BigO (1)


//MARK: leftRotateArrayByOne
void leftRotateArrayByOne(int arr[], int n) {
    int firstElement=arr[0];
    for (int i=0; i<n-1; i++) {
        arr[i]=arr[i+1];
    }
    arr[n-1]=firstElement;
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = BigO (1)



//MARK: LeftRotateArraybyDPlacesGfgEfficient
/*
 if(d==n) { no change }
 else if(d>n) {d = d-n}
 */
void LeftRotateArraybyDPlacesGfgEfficient(int arr[], int d, int n){
    if(n==d){
        return;
    }
    int temp[d];
    
    for (int i=0; i<d; i++) {
        temp[i]=arr[i];
    }
    for (int i=0; i<n-d; i++) {
        arr[i]=arr[i+d];
    }

    for (int i=0; i<d; i++) {
        arr[n-d+i]=temp[i];
    }
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(n)
//A.S = Theta(d)


//MARK: LeftRotateArraybyDPlacesGfgEfficient(Reversal Algorithm)
void LeftRotateArrayReverse(int arr[], int low, int high)
{
    while(low < high)
    {
        swap(arr[high], arr[low]);
        low++;
        high--;
    }
}
void LeftRotateArraybyDPlacesGfgReversal(int arr[], int d, int n){
    LeftRotateArrayReverse(arr, 0, d - 1);
    LeftRotateArrayReverse(arr, d, n - 1);
    LeftRotateArrayReverse(arr, 0, n - 1);
    
    //Avoid this block for time complexity
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}
//T.C = Theta(2n)  i.e=(d+(n-d)+n)
//A.S = Big0 (1)


//MARK: leadersInArrayNaive
void leadersInArrayNaive(int arr[], int n){
    for (int i=0; i<n; i++) {
        bool isLeader=true;
        for (int j=i; j<n; j++) {
            if(arr[j]>arr[i]){
                isLeader=false;
                break;
            }
        }
        if(isLeader){
            cout<<arr[i]<<" ";
        }
    }
}
//T.C = Big0 (n^2)
//A.S = Big0 (1)


//MARK: leadersInArrayEfficient
void leadersInArrayEfficient(int arr[], int n){
    int currentLeader = arr[n - 1];
    cout<<currentLeader<<" ";
    
    for(int i=n-2; i>=0; i--)
    {
        if(arr[i]>currentLeader)
        {
            currentLeader=arr[i];
            cout<<currentLeader<<" ";
        }
    }
}
//T.C = Theta(n)
//A.S = Big0 (1)


//MARK: maximumDifferenceProblemWithOrderNaive
int maximumDifferenceProblemWithOrderNaive(int A[], int n){
    int max=INT_MIN;;
    for(int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            if(j>i && ((A[j]-A[i])>max)){
                max=A[j]-A[i];
            }
        }
    }
    return max;
}
//T.C = Theta(n^2)
//A.S = Big0 (1)


//MARK: maximumDifferenceProblemWithOrderEfficient
int maximumDifferenceProblemWithOrderEfficient(int A[], int n){
    
    return 0;
}
//T.C = Theta(n)
//A.S = Big0 (1)


//MARK: frequenciesInSortedArrayMy
void frequenciesInSortedArrayMy(int arr[], int n){
    for (int i=0; i<n; i++) {
        int count=1;
        for (int j=i+1; i<n; j++) {
            if(arr[j]>arr[i]){
                cout<<arr[i]<<" "<<count<<endl;
                i=(j-1);
                break;
            }
            if(arr[i]==arr[j]){
                count++;
            }
        }
    }
}
//T.C = Theta(n^2)
//A.S = Big0 (1)


//MARK: frequenciesInSortedArrayGfg
void frequenciesInSortedArrayGfg(int arr[], int n)
{
    int freq = 1, i = 1;
    while(i < n)
    {
        while(i < n && arr[i] == arr[i - 1])
        {
            freq++;
            i++;
        }
        cout<<arr[i - 1] << " " << freq << endl;
        i++;
        freq = 1;
    }
    if(n==1 || arr[n-1]!=arr[n-2])
        cout<<arr[n-1] + " " + 1;
}

//T.C = Theta(n)
//A.S = Big0 (1)

//Swift code
/*
 func practice(arr: inout [Int]){
     var freq = 1
     if(arr.count==1){
         print("\(arr[0]) \(freq)")
     }
     for i in 1..<arr.count{
         if(arr[i-1] != arr[i]){
             print("\(arr[i-1]) \(freq)")
             freq = 1
         }else{
             freq += 1
         }
        
         if(i == arr.count-1){
             if(arr[i-1]==arr[i]){
                 print("\(arr[i]) \(freq)")
             }else{
                 print("\(arr[i]) \(freq)")
             }
         }
     }
 }
 //T.C = Theta(n)
 //A.S = Big0 (1)
 */


//Top 50 Array Coding Problems for Interviews
//https://www.geeksforgeeks.org/top-50-array-coding-problems-for-interviews/
int peakElement(int arr[], int n){
    for(int i=0; i<n; i++) {
        if(n==1){
            return 1;
        }
        if(i==0){
            if(arr[i]>arr[i+1]){
                return i;
            }
        }else if(i==n-1){
            if(arr[i]>arr[i+1]){
                return i;
            }
        }
        if(arr[i]>arr[i-1] && arr[i]>arr[i+1]){
            return i;
        }
    }
    return -1;
}


pair<long long, long long> getMinMax(long long a[], int n) {
    long int max = a[0];
    long int min = a[0];
    
    for (int i=1; i<n; i++) {
        if(a[i]>max){
            max = a[i];
        }
        if(a[i]<min){
            min = a[i];
        }
    }
    return std::make_pair(min, max);
}

int kthSmallest(int arr[], int l, int r, int k) {
    //code here
    return 0;
}

int findFrequency(vector<int> v, int x){
    int n = v.size();
    int count = 0;
    for (int i=0; i<n;i++) {
        if(v[i]==x){
            count++;
        }
    }
    return count;
}

//Sort an array of 0s, 1s and 2s
void sort012(int a[], int n)
{
    // code here
}

vector<int> subarraySum(vector<int>arr, int n, long long s)
{
    for (int i=1; i<=n; i++) {
        int count = arr[i-1];
        if(count == s){
            cout<<i<<" "<<endl;
            vector<int> resultVector{i};
            return resultVector;
        }
        for (int j=i+1; j<=n; j++) {
            if(count>s){
                count = 0;
                break;
            }
            count = count + arr[j-1];
            if(count == s){
                cout<<i<<" "<<j<<endl;
                vector<int> resultVector{i,j};
                return resultVector;
            }
        }
    }
    vector<int> resultVector{-1};
    return resultVector;
}

void segregateElements(int arr[],int n)
{
    int count=0;
    for (int i=0; i<n; i++) {
        if(arr[i]>=0){
            int temp = arr[count];
            arr[count] = arr[i];
            arr[i] = temp;
            count++;
        }
    }
    for (int i=0; i<n; i++) {
        cout<<arr[i]<<" ";
    }
}

int doUnion(int a[], int n, int b[], int m)  {
    unordered_set<int> s;
    for (int i=0; i<n; i++) s.insert(a[i]);
    for (int j=0; j<m; j++) s.insert(b[j]);
    
//    for (int k=0; k<s.size(); k++) {
//        cout<<a[k]<<endl;
//    }
    return s.size();
}



//MARK: LinkedList ------------------
struct Node{
    int data;
    Node *next;
    
    Node(int x){
        data = x;
        next = NULL;
    }
};

void printLinkedlist(Node *head){
    Node *curr = head;
    while (curr != NULL) {
        cout<<curr->data<<" ";
        curr = curr->next;
    }
}



//MARK: Stack --------------------
struct MyStackUsingVector{
    vector<int> v;
    
    void push(int x){
        v.push_back(x);
    }
    
    int pop(){
        int res=v.back();
        v.pop_back();
        return res;
    }
    
    int peek(){
        return v.back();
    }
    
    int size(){
        return v.size();
    }
    
    bool isEmpty(){
        return v.empty();
    }
};

void MyStackUsingSTL(){
    stack<int> stack;
    
    stack.push(21);// The values pushed in the stack should be of the same data which is written during declaration of stack
    stack.push(22);
    stack.push(24);
    stack.push(25);
    int num=0;
    stack.push(num);
    stack.pop();
    stack.pop();
    stack.pop();

    while (!stack.empty()) {
        cout << stack.top() <<" ";
        stack.pop();
    }
}

//MARK: main function--------------------------
int main()
{
    cout<<"arbaaz";
    //    int n = 8;
    
    //    int array1[4] =  {30,10,8,2};
    //    int sizeOfArray = sizeof(array1)/sizeof(int);
    
    //    vector<int> vectorArray{1,2,7,5};
    //    vector<int> y =  leadersInArray(array2, sizeOfArray);
    
    //    int tempArray[n];
    //    std::fill(tempArray,tempArray+n,0);
    
    //    string s = "geeksforgeeks";
    //    string g = "forgeeksgeeks";
    //    string k = "checkThePush";
    
    //    sort(g.begin(), g.end());
    //    cout<<s<<endl;
    //    cout<<g<<endl;
    return 1;
    return 0;
}
