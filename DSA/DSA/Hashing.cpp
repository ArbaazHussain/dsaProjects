//
//  Hashing.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 23/02/25.
//

#include <stdio.h>
#include <iostream>
#include <map>

using namespace std;
using std::cout;
using std::endl;


//MARK: -------Hashing---------



//MARK: basicHashingIntegers
void basicHashingIntegers(int givenArray[],int givenArraySize, int atMax, int noOfQuery) {
    int hashArray[atMax+1];
    memset(hashArray, 0, sizeof(hashArray)); // Fast zero initialization
    
    //prefetch
    for (int i=0; i<givenArraySize; i++) {
        int currentElement = givenArray[i];
        hashArray[currentElement]++;
    }
    //fetch
    while (noOfQuery--) {
        int number;
        cout<<"Enter Query"<<endl;
        cin >> number;
        cout<<"Output-> "<<hashArray[number]<<endl;
    }
}
/*
 - Call
 int givenArray[] = {1,2,5,5,5};
 int givenArraySize = sizeof(givenArray) / sizeof(givenArray[0]);
 basicHashingIntegers(givenArray,givenArraySize,12,5);
 */


//MARK: basicHashingIntegersWithMaps
//Map is used because We can store array of max size 1e6 in local function, 1e7 as global variable.
void basicHashingIntegersWithMaps(long long givenArray[],int givenArraySize, int noOfQuery) {
    map<long long int,long long int> mpp;
    
    //prefetch
    for (int i=0; i<givenArraySize; i++) {
        mpp[givenArray[i]]++;
        /*
         if ordered map:
         O(givenArraySize * log(givenArraySize))
         
         if unOrdered map:
         worst case        - givenArraySize * givenArraySize
         Best,Average case - givenArraySize * O(1)
         */
    }
    
    //iterate over map
//    for (const auto &pair : mpp) {
//        cout << "Key: " << pair.first << ", Value: " << pair.second << endl;
//    }
    
    //fetch
    while (noOfQuery--) {
        long long int number;
        cout<<"Enter Query"<<endl;
        cin >> number;
        cout<<"Output-> "<<mpp[number]<<endl;
        /*
         if ordered map:
         O(noOfQuery * log(givenArraySize))
         
         if unOrdered map:
         worst case        - noOfQuery * givenArraySize
         Best,Average case - noOfQuery * O(1)
         */
    }
}
//T.C = O((givenArraySize+noOfQuery)⋅log(givenArraySize))
/*
 We can take pair keys like <int,int> etc only in ordered map and not in UnOrdered map.
 
 Time Complexity of Maps:
 Ordered Map:
 logN for both storing and fetching (Case-:Best,Average,Worst)
 
 UnOrdered Map:
 O(1) for both storing and fetching (Case-:Best,Average)
 O(N) for both storing and fetching (Case-:Worst)
 
 Preference should be always given to unOrdered Map as worst case happens very rarely.
 */


//MARK: basicHashingSpecificCaseStringsWithAsci
/*
 //Only applicable when array has lowcase alphabets, to use for upper case replace 'a' to 'A'
 Formula ->
 'a'(97) - 'a'(97) = 0
 'b'(98) - 'a'(97) = 1
 'c'(99) - 'a'(97) = 2
 */
void basicHashingSpecificCaseStringsWithAsci(int givenArray[],int givenArraySize, int noOfQuery) {
    int hashArray[26] = {0};
    //prefetch
    for (int i=0; i<givenArraySize; i++) {
        char currentChar = givenArray[i];
        hashArray[currentChar-'a']++;
    }
    //fetch
    while (noOfQuery--) {
        char alphabet;
        cout<<"Enter Query"<<endl;
        cin >> alphabet;
        cout<<"Output-> "<<hashArray[alphabet-'a']<<endl;
    }
}
/*
 - Call
 int givenArray[] = {'a','b','f','d','f'};
 int givenArraySize = sizeof(givenArray) / sizeof(givenArray[0]);
 basicHashingSpecificCaseStringsWithAsci(givenArray,givenArraySize,5);
 */


//MARK: basicHashingCharacters
/*
 * The ASCII character set includes 256 characters
 * We can also use maps
 */
void basicHashingCharacters(int givenArray[],int givenArraySize, int noOfQuery) {
    int atMax = 256;
    int hashArray[atMax+1];
    memset(hashArray, 0, sizeof(hashArray)); // Fast zero initialization
    
    //prefetch
    for (int i=0; i<givenArraySize; i++) {
        int currentChar = givenArray[i];
        hashArray[currentChar]++;
    }
    //fetch
    while (noOfQuery--) {
        char character;
        cout<<"Enter Query"<<endl;
        cin >> character;
        cout<<"Output-> "<<hashArray[character]<<endl;
    }
}
/*
 - Call
 int givenArray[] = {'a','b','D','d','d'};
 int givenArraySize = sizeof(givenArray) / sizeof(givenArray[0]);
 basicHashingCharacters(givenArray,givenArraySize,5);
 */


//MARK: basicHashingCharactersWithMaps
void basicHashingCharactersWithMaps(int givenArray[],int givenArraySize, int noOfQuery) {
    map<char,int> mpp;
    
    //prefetch
    for (int i=0; i<givenArraySize; i++) {
        mpp[givenArray[i]]++;
    }
    
    //iterate over map
//    for (const auto &pair : mpp) {
//        cout << "Key: " << pair.first << ", Value: " << pair.second << endl;
//    }
    
    //fetch
    while (noOfQuery--) {
        char alphabet;
        cout<<"Enter Query"<<endl;
        cin >> alphabet;
        cout<<"Output-> "<<mpp[alphabet]<<endl;
    }
}
/*
 - Call
 int givenArray[] = {'a','b','D','d','d'};
 int givenArraySize = sizeof(givenArray) / sizeof(givenArray[0]);
 basicHashingCharactersWithMaps(givenArray, givenArraySize, 5);
 */


//MARK: main function--------------------------
//int main()
//{
//    int givenArray[] = {'a','b','D','d','d'};
//    int givenArraySize = sizeof(givenArray) / sizeof(givenArray[0]);
//    basicHashingCharactersWithMaps(givenArray, givenArraySize, 5);
//}
