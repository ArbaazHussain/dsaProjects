#include <iostream>
#include <climits>

using namespace std;

//Binary Search is only possible in sorted array.
int BinarySearch(int arr[], int n, int key) {

    int s = 0;
    int e = n;

    while (s<=e)
    {
        int mid = (s + e) / 2;

        if (arr[mid] == key){
            return mid;
        }

        else if(arr[mid]>key){
            e = mid-1;
        }
        else if(arr[mid]<key){
            s = mid+1;
        }
    }

    return -1;

// cout<<arr[n-1]<<endl;    
// cout<<"N = "<<n<<endl;
// cout<<"S = "<<s<<endl;
// cout<<"E = "<<e<<endl;
// int mid = (s + e) / 2;
// cout<<"Mid"<<mid<<endl;
// cout<<"Mid element in array"<<arr[mid]<<endl;
       
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

    int result = BinarySearch(array,n,key);
    if (result != -1){
        cout<<"Key found at index "<<result<<endl;
    }else{
        cout<<"Key not found"<<endl;
    }
    
    return 0;

}
