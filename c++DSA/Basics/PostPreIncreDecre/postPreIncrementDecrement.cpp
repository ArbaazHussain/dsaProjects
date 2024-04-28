#include <iostream>
using namespace std;

int main() {


//    int i = 1;
//    i = i++ + ++i;
//    cout<< i;


// int i = 1;
// int j = 2;
// int k;
//  // 1   2    1     2     3     4
// k = i + j + i++ + j++ + ++i + ++j ;
// cout<< i<<endl <<j<<endl <<k ;


// int i = 0;
// //   0     0     1     1
// i = i++ - --i + ++i - i--;
// cout << i;
   

  //  0    1   2
int i=1, j=2, k=3;
  //      1     2      3
int m =  i-- - j-- - k--;
cout<< i<<endl <<j<<endl <<k <<endl ;
cout<< m;
    
    
}