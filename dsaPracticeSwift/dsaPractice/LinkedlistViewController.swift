//
//  LinkedlistViewController.swift
//  dsaPractice
//
//  Created by ekincare on 22/11/23.
//

import UIKit

class Node<T> {
    var data: T
    var next: Node?

    init(data: T) {
        self.data = data
        self.next = nil
    }
}

class LinkedlistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        createLinkedListAutoAndTraverse()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: createLinkedListManuallyAndTraverse
    private func createLinkedListManuallyAndTraverse(){
        let head : Node = Node(data: 10.0)
        head.next = Node(data: 20)
        head.next?.next = Node(data: 30)
        traverse(head: head)
    }
    
    private func traverse<T>(head: Node<T>?){
        var current = head
        while current != nil{
            print(current!.data)
            current = current?.next
        }
    }
    
    //MARK: createLinkedListAutoAndTraverse
    private func createLinkedListAutoAndTraverse(){
        let linkedList = myLinkedList<Int>()
        linkedList.append(data: 1)
        linkedList.append(data: 2)
        linkedList.append(data: 3)
        linkedList.append(data: 101)
        
        linkedList.traverse()
    }
    
}


class myLinkedList<T> {
    var head: Node<T>?
    
    // Function to append a new node to the end of the linked list
    func append(data: T) {
        let newNode = Node(data: data)
        if head == nil {
            head = newNode
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    func traverse(){
        var current = head
        while current != nil{
            print(current!.data)
            current = current?.next
        }
    }

}
