//
//  Sorting.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 25/03/25.
//

#include <stdio.h>
#include <iostream>

using namespace std;
using std::cout;
using std::endl;


//MARK: selectionSort
//Select the minimum element and place it at the beginning.
void selectionSort(vector<int> &arr){
    unsigned long n = arr.size();
    for (int i=0; i<n-1; i++) {
        int minIndex = i;
        for (int j=i+1; j<n; j++) {
            if(arr[j]<arr[minIndex]){
                minIndex = j;
            }
        }
        if(minIndex != i){
            swap(arr[i], arr[minIndex]);
        }
    }
    //Printing final values
    for (int i = 0; i < n; i++) {
        cout<<arr[i]<<" ";
    }
}
/*
 T.C -: Best,Average,Worst O(n^2)
 A.S -: O(1)
 */


//MARK: bubbleSort
//Repeatedly swap adjacent elements if they are in the wrong order, and push max to last
void bubbleSort(vector<int> &arr){
    unsigned long n = arr.size();
    for (int i=0; i<n-1; i++) {
        bool didSwap = false;
        for (int j=0; j<n-1-i; j++) {
            if(arr[j]>arr[j+1]){
                swap(arr[j], arr[j+1]);
                didSwap = true;
            }
        }
        if(didSwap==false){
            break;
        }
    }
    //Printing final values
    for (int k = 0; k < n; k++) {
        cout<<arr[k]<<" ";
    }
}
/*
 T.C -:
 Best          - O(n) /when array is sorted
 Average,Worst - O(n^2)
 A.S -: O(1)
 */


//MARK: insersionSort
//Insert each element into its correct position in the sorted left part.
void insersionSort(vector<int> &arr){
    unsigned long n = arr.size();
    for (int i=0; i<n; i++) {
        int j = i;
        while (j>0 && arr[j-1]>arr[j]) {
            swap(arr[j-1], arr[j]);
            j--;
        }
        for (int k = 0; k < n; k++) {
            cout<<arr[k]<<" ";
        }
        cout<<endl;
    }
    //Printing final values
//    for (int k = 0; k < n; k++) {
//        cout<<arr[k]<<" ";
//    }
}
//9,14,15,12,6,8,13
/*
 T.C -:
 Best          - O(n) /when array is sorted
 Average,Worst - O(n^2)
 A.S -: O(1)
 */


//MARK: ---------MainFunction----------

//int main()
//{
//    cout<<"Sorting - main function"<<endl;
//    //int array[] =  {13,46,24,52,20,19};
//    vector<int> vectorArray{13,44,24,52,20,9};
//    insersionSort(vectorArray);
//    cout<<endl;
//    return 0;
//}
