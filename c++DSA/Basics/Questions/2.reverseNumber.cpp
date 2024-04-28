#include <iostream>  
using namespace std;  


int main()  
{  


int n, reversedNo=0;    
cout<<"Enter a number: ";    
cin>>n;    


  while(n>0)    
  {    
     int lastDigit=n%10;      
     reversedNo=reversedNo*10+lastDigit;    
     n= n/10;
  }    

 cout<<"Reversed Number: "<<reversedNo<<endl;   

return 0;  
}  