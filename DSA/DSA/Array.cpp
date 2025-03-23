//
//  Array.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 22/12/24.
//

#include <iostream>
#include <vector>

using namespace std;
using std::cout;
using std::endl;


//MARK: ----Array--------------------
/*
* Array Advantages -:
 random access
 cache friendlines
 
* Array Types -:
 Fixed Array
 Dynamic Array
 
* Vectors(Dynamic Array) Advantages as compare to Fixed Array:
 Dynamic size array
 rich library function
 easy to know size
 no need to pass size
 can be returned from a function
 by default initialized by default value
 can copy one factor to another.
 
* We can store array of size 1e6 in local function, 1e7 as global variable.
 */

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


//MARK: main function--------------------------
//int main()
//{
//    arrayBasic();
//    return 0;
//}
