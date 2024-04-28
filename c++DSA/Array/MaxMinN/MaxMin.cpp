// Your First C++ Program
#include <iostream>
#include <climits>

using namespace std;

/*
int main() {


int array[7] = {34,43,433,43,783,879333,3};
int max = INT_MIN;
int min = INT_MAX;


for (int i = 0; i < 7; i++)
{
    if (array[i] > max){
        max = array[i];
    }

    if (array[i]< min) {
        min = array[i];
    }
}


cout<<"MAX = "<<max<<endl;
cout<<"MIN = "<<min<<endl;


}
*/

//2ND APPROACH ---------------------------------------
int main() {


int array[7] = {34,43,433,43,783,879333,3};
int maxNo = INT_MIN;
int minNo = INT_MAX;


for (int i = 0; i < 7; i++)
{
    maxNo = max(maxNo,array[i]);
    minNo = min(minNo,array[i]);
}


cout<<"MAX = "<<maxNo<<endl;
cout<<"MIN = "<<minNo<<endl;


}