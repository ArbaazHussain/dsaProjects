//
//  Pattern.swift
//  dsaPractice
//
//  Created by Arbaaz Etelligens on 19/06/22.
//




//MARK: RectanglePattern
//        ******
//        ******
//        ******
//        ******


//        for _ in 0...n{
//            for _ in 0...n{
//                print("*",terminator: "")
//            }
//            print("")
//        }




//MARK: Half pyramid using numbers
//        1
//        22
//        333
//        4444
//        55555


//        for i in 1...n{
//            for _ in 1...i{
//                print(i,terminator: "")
//            }
//            print("")
//        }




//MARK: Floyd's triange
//        1
//        2 3
//        4 5 6
//        7 8 9 10
//        11 12 13 14 15


//        for i in 1...n{
//            for _ in 1...i{
//                print("\(count) ",terminator: "")
//                count += 1
//            }
//            print("")
//        }




//MARK: Hollow Rectangle Pattern
//        * * * * *
//        *       *
//        *       *
//        *       *
//        * * * * *


//        for i in 1...n{
//            for j in 1...n{
//
//                if i==1 || i==n || j==1 || j==n{
//                    print("* ",terminator: "")
//                }else{
//                    print("  ",terminator: "")
//                }
//
//            }
//            print("")
//        }




//MARK: Inverted half pyramid ++++
//        * * * * *
//        * * * *
//        * * *
//        * *
//        *


//                for i in (1...n).reversed(){
//                    for _ in 1...i{
//
//                        print("* ",terminator: "")
//
//                    }
//                    print("")
//                }




//MARK: half pyramid after 180 rotation ++++
//        *
//      * *
//    * * *
//  * * * *
//* * * * *

//        for i in 1...n{

//            for j in 1...n {
//
//                if j <= n-i{
//                    print("  ",terminator: "")
//                }else{
//                    print("* ",terminator: "")
//                }
//
//            }
//            print("")
//        }




//MARK: Pattern
//        *****
//         ****
//          ***
//           **
//            *

//        for i in (1...n).reversed(){
//            for j in 1...n{
//                if(j<=n-i){
//                    print(" ",terminator: "")
//                }else{
//                    print("*",terminator: "")
//                }
//            }
//            print("")
//        }




//MARK: Inverted Pattern
// 12345
// 1234
// 123
// 12
// 1

//        for i in (1...n).reversed(){
//
//            for j in 1...i {
//                print("\(j) ",terminator: "")
//            }
//            print("")
//
//        }




//MARK: 0-1 PATTERN
// 1
// 0 1
// 1 0 1
// 0 1 0 1
// 1 0 1 0 1

//        for i in (1...n){
//
//            for j in 1...i {
//                if (i+j) % 2 == 0{
//                    print("1 ",terminator: "")
//                }else{
//                    print("0 ",terminator: "")
//                }
//            }
//            print("")
//
//        }





//MARK: Rhombus Pattern
//         * * * * *
//       * * * * *
//     * * * * *
//   * * * * *
// * * * * *

//        for i in 1...n{
//            for j in 1...2*n-i{
//                if(j<=n-i){
//                    print(" ",terminator: " ")
//                }else{
//                    print("*",terminator: " ")
//                }
//            }
//            print("")
//        }




//MARK: Number Pattern Pyramid
//        1
//       1 2
//      1 2 3
//     1 2 3 4
//    1 2 3 4 5

//        for i in (1...n){
//            var count=1
//            for j in 1...n{
//                if(j<=n-i){
//                    print(" ",terminator: "")
//                }else{
//                    print("\(count) ",terminator: "")
//                    count+=1
//                }
//            }
//            print("")
//        }




//MARK: Star Pattern
//        *
//       * *
//      * * *
//     * * * *
//    * * * * *
//     * * * *
//      * * *
//       * *
//        *

//        for i in (1...2*n-1){
//            if(i<=n){
//                for j in 1...n{
//                    if(j<=n-i){
//                        print(" ",terminator: "")
//                    }else{
//                        print("* ",terminator: "")
//                    }
//                }
//                print("")
//            }else{
//                for j in 1...n{
//                    if(j<=i-n){
//                        print(" ",terminator: "")
//                    }else{
//                        print("* ",terminator: "")
//                    }
//                }
//                print("")
//            }
//        }




//MARK: Star Pattern
//        *
//        **
//        ***
//        ****
//        *****
//        ****
//        ***
//        **
//        *

//        for i in 1...2*n-1{
//
//            if i <= n{
//                for _ in 1...i{
//                    print("*",terminator: "")
//                }
//            }else
//            {
//                for _ in stride(from: (2*n-i), to: 0, by: -1){
//                    print("*",terminator: "")
//                }
//            }
//            print("")
//        }



