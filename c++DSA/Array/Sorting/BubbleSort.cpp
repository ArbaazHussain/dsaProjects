#include <iostream>
#include <climits>

using namespace std;


int main() {


    int array[] = { 12, 45, 23, 51, 19, 8 };
    int n = 6;


    int counter = 1;
    while (counter<n)
    {

        for (int i = 0; i < n-counter; i++)
        {
            if (array[i]>array[i+1]){
                int temp = array[i];
                array[i] = array[i+1];
                array[i+1] = temp;
            }
        }
        counter++;
        
    }


    for (int i = 0; i < n; i++)  
            {
            cout<<array[i]<<"  ";
            }
        cout<<endl;
    

}






//My Technique
// for (int i = 0; i < n-1; i++)
//     {

//         for (int j = 0; j <= n-(i+2); j++)
//         {
//             int k = j + 1;
//             if (array[k] < array[j]){
//                 int temp = array[k];
//                 array[k] = array[j];
//                 array[j] = temp;
//             }     
//         } 

//     for (int i = 0; i < n; i++)
//             {
//             cout<<array[i]<<"  ";
//             }
//             cout<<endl;

//     }     