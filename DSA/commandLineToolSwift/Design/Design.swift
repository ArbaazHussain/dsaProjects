//
//  Design.swift
//  commandLineToolSwift
//
//  Created by Arbaaz Hussain on 08/11/25.
//

//import Foundation

// MARK: - LRU Cache--------------
//
class LruCacheNode {
    var key: Int
    var value: Int
    var prev: LruCacheNode?
    var next: LruCacheNode?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}


class LRUCache {
    private let capacity: Int
    private var cache: [Int: LruCacheNode] = [:]
    private let head = LruCacheNode(0, 0) // dummy head
    private let tail = LruCacheNode(0, 0) // dummy tail
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    // MARK: - Get value
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        // make node as MRU
        removeNode(node)
        insertRightAfterHead(node)
        return node.value
    }
    
    // MARK: - Put key-value
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            // Update existing node
            node.value = value
            // make node as MRU
            removeNode(node)
            insertRightAfterHead(node)
        } else {
            let newNode = LruCacheNode(key, value)
            cache[key] = newNode
            // make node as MRU
            insertRightAfterHead(newNode)
            
            // If capacity exceeded → remove LRU
            if cache.count > capacity {
                if let lru = removeBeforeTail() {
                    cache[lru.key] = nil
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func insertRightAfterHead(_ node: LruCacheNode) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }
    
    private func removeNode(_ node: LruCacheNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    // 🧩 Removes the node just before the dummy tail (Least Recently Used)
    private func removeBeforeTail() -> LruCacheNode? {
        guard let lru = tail.prev, lru !== head else { return nil }
        removeNode(lru)
        return lru
    }
}
/*
 Approach:
 LRU:
 
 DataSet:
 Node : (key , value)
 Hash map : (key, Node)
 
 MRU: Next To Head
 MLU: Before Tail
 
 Put :
 * Check for existing in hash map:
 * Check for capacity - (IF full then remove LRU guy before tail) -  delete key from hash map
 * Put Right After Head (as most latest used) - add key in hash map

 * If already exists:
 * Detete it and ut Right After Head (as most latest used) - delete/add key in hash map
 Get:
 * If it exists in hash map then return node address , update MRU by deleting before tail and adding after head - delete and add in Hashmat





 */
