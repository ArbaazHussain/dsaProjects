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
    cout<<"main file - main function";
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
