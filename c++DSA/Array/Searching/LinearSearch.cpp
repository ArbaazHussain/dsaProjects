#include <iostream>
#include <climits>

using namespace std;


int LinearSearch(int arr[], int n, int key) {

    for (int i = 0; i < n; i++)
    {
        if(arr[i] == key){
            return i;
        }
    }
    cout<<"Key Not Found";
    return -1;

}


int main() {

    int n;
    cout<<"Enter The Size of array"<<endl;
    cin>>n;

    int key;
    cout<<"Enter The Key to be Found"<<endl;
    cin>>key;
    
    int array[n];
    cout<<"Enter Elements in array"<<endl;
    for (int i = 0; i < n; i++)
    {
        cin>>array[i];
    }

    int result = LinearSearch(array,n,key);
    if (result != -1){
        cout<<"Key found at index "<<result<<endl;
    }else{
        cout<<"Key not found"<<endl;
    }
    

    return 0;

}
