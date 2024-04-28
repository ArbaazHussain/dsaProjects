//
//  StackViewController.swift
//  dsaPractice
//
//  Created by ekincare on 22/11/23.
//

import UIKit

/*
 While Swift itself doesn't have a specific "stack" data structure in its standard library
 
 */


class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let my = myStackWithLinkedList<Int>()
        my.push(data: 10)
        my.push(data: 20)
        print(my.peak())
        my.pop()
        print(my.peak())
    }
    
}

struct myStackWithArray<T>{
    private var elements = [T]()
    
    mutating func push(element:T){
        elements.append(element)
    }
    
    mutating func pop() -> T?{
        return elements.popLast()
    }
    
    func peak() -> T?{
        return elements.last
    }
    
    func size() -> Int{
        return elements.count
    }
    
    var isEmpty: Bool{
        return elements.isEmpty
    }
}

class myStackWithLinkedList<T>{
    private var head : Node<T>?
    private var currentSize = 0
    
    func push(data:T){
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
        currentSize += 1
    }
    
    func pop() -> T?{
        if(head == nil){
            print("Empty")
        }
        let res = head?.data
        head = head?.next
        currentSize -= 1
        return res
    }
    
    func size() -> Int{
        return currentSize
    }
    
    func peak() -> T?{
        if(head == nil){
            print("Empty")
        }
        return head?.data
    }
}
