#include <iostream>
#include <climits>

using namespace std;


int main() {



    int array[] = { 10, 500, 30, 400, 2};
    int n = 5;

    for (int i = 0; i < n - 1 ; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            if (array[j] < array[i]){
                int temp = array[j];
                array[j] = array[i];
                array[i] = temp;
             }
        }    
    }


    for (int i = 0; i < n; i++)
    {
        cout<<array[i]<<"  ";
    }
    cout<<endl;

}