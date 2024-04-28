//
//  QueueViewController.swift
//  dsaPractice
//
//  Created by Arbaaz Hussain on 18/12/23.
//

import UIKit

class QueueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Example usage:
        // Example usage:
        var queue = Queue<Int>()

        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)

        print(queue.front()) // Output: 1
        print(queue.dequeue()) // Output: 1
        print(queue.front())
        print(queue.dequeue()) // Output: 2
        print(queue.front())
        
        DispatchQueue.global(qos: .background).async {
            
        }

    }

}
struct Queue<T> {
    private var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }

    func front() -> T? {
        return elements.first
    }
}

