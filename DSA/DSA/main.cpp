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




//MARK: main function--------------------------
int main()
{
    cout<<"main file - main function"<<endl;
    //    //    int n = 8;
    //
    //    //    int array1[4] =  {30,10,8,2};
    //    //    int sizeOfArray = sizeof(array1)/sizeof(int);
    //
    ////    vector<int> vectorArray{1, 2, 8, 10, 11, 12, 19};
    ////    int res = findCeil(vectorArray, 5);
    ////    cout<<res<<endl;
    //
    //    //    vector<int> y =  leadersInArray(array2, sizeOfArray);
    //
    //    //    int tempArray[n];
    //    //    std::fill(tempArray,tempArray+n,0);
    //
    //    //    string s = "geeksforgeeks";
    //    //    string g = "forgeeksgeeks";
    //    //    string k = "checkThePush";
    //
    //    //    sort(g.begin(), g.end());
    //    //    cout<<s<<endl;
    //    //    cout<<g<<endl;
    int n = 5;
    if(n==0 || n==1){
        return n;
    }
    int a = 0;
    int b = 1;
    int c = 1;
    for (int i=2; i<=n; i++) {
        c = a+b;
        a = b;
        b = c;
    }
    return c;
    
    return 0;
}
