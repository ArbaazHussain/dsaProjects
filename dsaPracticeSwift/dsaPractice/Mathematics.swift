//
//  BasicQuestions.swift
//  dsaPractice
//
//  Created by Arbaaz Etelligens on 20/06/22.
//

import UIKit


class BasicQuestions: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(checkNumberIsPrimeOrNot(1))
        print(findPrimeNumbersBetweenToNumber(2, 15))

        print(findReverseOfNumber(000001))
        print(checkArmstrongNumber(370))

        print(findFactorialOfNumber(5))
        print(findNcr(5, 10))

        print(fibenacchiSeries(5))
        drawPacalTrinagle(5)
        print(findSumOfnNaturalNumbers(3))
        swapNoWithoutThirdVaraible()
    }
    

}


extension BasicQuestions{
    
    
    private func checkNumberIsPrimeOrNot(_ no : Int) -> Bool?{
        var isPrime = true
        if no ==  1{
            isPrime = false
            return isPrime
        }
        for i in 2..<no {
            if no % i == 0 {
                isPrime = false
                return isPrime
            }
        }
        return isPrime
    }
    
    
    private func findPrimeNumbersBetweenToNumber(_ no1: Int, _ no2: Int) -> [Int] {
        var primeNumbers : [Int] = []
        for i in no1+1..<no2{
            let isPrime = checkNumberIsPrimeOrNot(i)
            if isPrime!{
                primeNumbers.append(i)
            }
        }
        return primeNumbers
        
    }
    
    
    private func findReverseOfNumber(_ no : Int) -> Int{
        var oldNumber = no
        var reversedNo = 0
        var lastDigitNo = 0
        while oldNumber>0{
            //Finding Last digit of old number
            lastDigitNo = oldNumber % 10
            reversedNo = (reversedNo * 10) + lastDigitNo
            //Removing last digit of old number
            oldNumber = oldNumber / 10
        }
        return reversedNo
    }
    
    
    private func checkArmstrongNumber(_ no: Int) -> Bool {
        var givenNumber = no
        var lastDigit = 0
        var newNumber = 0
        while givenNumber>0{
            lastDigit = givenNumber % 10
            newNumber = newNumber + (lastDigit*lastDigit*lastDigit)
            givenNumber = givenNumber / 10
        }
        if no == newNumber{
            return true
        }
        return false
    }
    
    
    private func findFactorialOfNumber(_ no: Int) -> Int{
        var fact = 1
        
//        for i in 1...no{
//            fact = fact * i
//        }
        return fact
    }
    
    
    private func findNcr(_ n: Int, _ r: Int) -> Int{
        let ncr = findFactorialOfNumber(n) / (findFactorialOfNumber(n-r) * findFactorialOfNumber(r))
        return ncr
    }
    

    private func fibenacchiSeries(_ no : Int) {
        var t1 = 0
        var t2 = 1
        var nextTerm = t1 + t2
        for _ in 1...no{
            print(t1)
            nextTerm = t1 + t2
            t1 = t2
            t2 = nextTerm
        }
    }
    
    
    private func drawPacalTrinagle(_ no : Int){
//        for i in 0...no - 1{
//            for j in 0...i{
//                print(findNcr(i, j),terminator: "")
//            }
//            print("")
//        }
    }
    
    
    private func findSumOfnNaturalNumbers(_ n: Int) -> Int{
        return n * (n+1)/2
    }
    
    
    private func swapNoWithoutThirdVaraible(){
        var a = 10
        var b = 20
        
        b = b + a
        a = b - a
        b = b - a
        
        print(a)
        print(b)
    }
    
}
