#include <iostream>
using namespace std;


int main() {


// int row,col;
// cout<<"enter row"<<endl;
// cin>>row;
// cout<<"enter col"<<endl;
// cin>>col;


int n; 
cout<<"enter n"<<endl;
cin>>n;
// int n = 5;
// int count = 0;






//Inverted Pattern----------------------------------------------------------
// 12345
// 1234
// 123
// 12
// 1
// for (int i = n; i >= 1; i--)
// {
//     for (int j = 1; j <= i; j++)
//     {
//         cout<<j;
//     }
//     cout<<endl;
// }





// 0-1 PATTERN---------------------------------------------------------------
// 1 
// 0 1 
// 1 0 1 
// 0 1 0 1 
// 1 0 1 0 1 

// for (int i = 1; i <= n; i++)
// {
//     for (int j = 1; j <= i; j++)
//     {
//         if ( (i+j) % 2 == 0){
//             cout<<"1 ";
//         }else{
//             cout<<"0 ";
//         }
//     }
//     cout<<endl;
// }





//Rhombus Pattern--------------------------------------------------------------
//         * * * * * 
//       * * * * * 
//     * * * * * 
//   * * * * * 
// * * * * * 

// for (int i = 1; i <= n; i++)
// {
//     for (int j = 1; j<= n-i; j++)
//     {
//         cout<<"  "; 
//     }
//     for (int k = 1; k <= n; k++)
//     {
//         cout<<"* ";
//     }
//     cout<<endl;
    
// }





//NUMBER PATTERN-------------------------------------------------------------
//     1 
//    1 2 
//   1 2 3 
//  1 2 3 4 
// 1 2 3 4 5 

// for (int i = 1; i <= n; i++)
// {
//     for (int j = 1; j<= n-i; j++)
//     {
//         cout<<" "; 
//     }
//     for (int k = 1; k <= i; k++)
//     {
//         cout<<k<<" ";
//     }
//     cout<<endl;
// }





//Palindromic Pattern (My method)--------------------------------------------

//     1
//    212
//   32123
//  4321234
// 543212345

// for (int i = 1; i <= n; i++)
// {

//     int j;
//     for (j = 1; j <= n-i; j++)
//     {
//          cout<<" "; 
//     }

//     int k = i;
//     for (; j<=n; j++){
//         cout<<k--;
//     }

//     for (int z = 2; z <= i; z++)
//     {
//             cout<<z;
//     }
    
//     cout<<endl;
// }





//Palindromic Pattern -------------------------------------------------------

//     1
//    212
//   32123
//  4321234
// 543212345

// for (int i = 1; i <= n; i++)
// {

//     int j;
//     for (j = 1; j <= n-i; j++)
//     {
//          cout<<" "; 
//     }

//     int k = i;
//     for (; j<=n; j++){
//         cout<<k--;
//     }

//     k = 2;
//     for (; j <= n+i-1; j++)
//     {
//             cout<<k++;
//     }
    
//     cout<<endl;
// }
    


//STAR PATTERN------------------------------------------------------------
//         * 
//       * * * 
//     * * * * * 
//   * * * * * * * 
// * * * * * * * * * 
// * * * * * * * * * 
//   * * * * * * * 
//     * * * * * 
//       * * * 
//         * 

for (int i = 1; i <= n; i++)
{

    for (int j = 1; j <= n-i; j++)
    {
         cout<<"--"; 
    }

    for (int k = 1; k <= ((2*i)-1); k++)
    {
        cout<<"* "; 
    }

    cout<<endl;
}


for (int i = n; i >= 1; i--)
{

    for (int j = 1; j <= n-i ; j++)
    {
       cout<<"  ";
    }
    
    for (int k = 1; k <= 2*i - 1; k++)
    {
        cout<<"* ";
    }

    cout<<endl;
}




















}
