//
//  Linkedlist.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 14/07/25.
//

#include <stdio.h>
#include <iostream>

using namespace std;
using std::cout;
using std::endl;

//MARK: ----Linkedlist------
/*
 *Where it is used?
 ->Stack, queue, browsers.
 
 *Why array is not used in stack?
 Although vector is dynamic, it's not ideal for queues due to slow pop_front() (O(n)) and costly resizing. For stacks, it works but frequent resizing during growth involves copying all elements to new memory, which affects performance.
 
 
 */
template <typename T>
class Node {
public:
    T data;          // data of generic type
    Node<T>* next;   // pointer to the next node

    // Constructor with data and next pointer
    Node(T data1, Node<T>* next1) {
        data = data1;
        next = next1;
    }
    // Constructor with only data
    Node(T data1) {
        data = data1;
        next = nullptr;
    }
};

 
//MARK: arrayToLL
Node<int>* arrayToLL(vector<int>& nums) {
    if(nums.size() == 0){
        return nullptr;
    }
    Node<int>* head = new Node<int>(nums[0]);
    Node<int>* mover = head;
    for (int i=1; i<nums.size(); i++) {
        Node<int>* temp = new Node(nums[i]);
        mover->next = temp;
        mover = temp;
    }
    return head;
}
//T.C = BigO(n)
//A.S = BigO(n)


//MARK: traversalOfLL
void traversalOfLL(Node<int>* head) {
    if(head == NULL) return ;
    Node<int>* temp = head;
    while(temp){
        cout<<temp->data<<" ";
        temp = temp->next;
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: lenthOfLL
int lenthOfLL(Node<int>* head) {
    if(head == NULL) return 0;
    int count = 0;
    Node<int>* temp = head;
    while(temp){
        temp = temp->next;
        count++;
    }
    return count;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: searchInLL
bool searchInLL(Node<int>* head, int key) {
    if(head == NULL) return false;
    Node<int>* temp = head;
    while(temp){
        if(temp->data == key){
            return true;
        }
        temp = temp->next;
    }
    return false;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Deletion
Node<int>* deletionOfHead(Node<int>* head) {
    if(head == NULL){
        return nullptr;
    }
    Node<int>* temp = head;
    head = head->next;
    delete temp;
    return head;
}
//T.C = BigO(1)
//A.S = BigO(1)


Node<int>* deletionOfTail(Node<int>* head) {
    if(head==NULL || head->next == NULL){
        return nullptr;
    }
    Node<int>* temp = head;
    while(temp->next->next != NULL){
        temp = temp->next;
    }
    delete temp->next;
    temp->next = nullptr;
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


Node<int>* deletionAtKthElement(Node<int>* head, int k) {
    if(head == NULL) return nullptr;
    if(k==1){
        Node<int>* deletedHead = deletionOfHead(head);
        return deletedHead;
    }
    Node<int>* temp = head;
    Node<int>* prev = NULL;
    int count = 0;
    while(temp!=NULL){
        count++;
        if(count==k){
            prev->next = prev->next->next;
            delete temp;
            break;
        }
        prev = temp;
        temp = temp->next;
    }
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


Node<int>* deletionOfNode(Node<int>* head, int k) {
    if(head == NULL) return nullptr;
    if(head->data == k){
        Node<int>* deletedHead = deletionOfHead(head);
        return deletedHead;
    }
    Node<int>* temp = head;
    Node<int>* prev = NULL;
    while(temp!=NULL){
        if(temp->data==k){
            prev->next = prev->next->next;
            delete temp;
            break;
        }
        prev = temp;
        temp = temp->next;
    }
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


//https://leetcode.com/problems/delete-node-in-a-linked-list/description/
struct ListNode {
      int val;
      ListNode *next;
      ListNode(int x) : val(x), next(NULL) {}
};
void DeleteNodeInLinkedList(ListNode* node) {
    ListNode* temp = node;
    while(temp->next != NULL){
        ListNode* next = temp->next;;
        temp->val =  next->val;
        if(next->next == NULL){
            temp->next = nullptr;
            break;
        }else{
            temp = temp->next;
        }
    }
}
//T.C = BigO(n)
//A.S = BigO(1)
 

//MARK: Insertion
Node<int>* insertionAtHead(Node<int>* head, int val) {
    Node<int>* headToAdd = new Node<int>(val, head);
    return headToAdd;
}
//T.C = BigO(1)
//A.S = BigO(1)


Node<int>* insertionAtTail(Node<int>* head, int val) {
    Node<int>* tailToAdd = new Node<int>(val);
    if(head==NULL){
        return tailToAdd;
    }
    Node<int>* temp = head;
    while(temp->next != NULL){
        temp = temp->next;
    }
    temp->next = tailToAdd;
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


Node<int>* insertionAtKthElement(Node<int>* head, int k, int val) {
    Node<int>* newNode = new Node<int>(val);
    if(head == NULL){
        if(k==1){
            newNode->next = head;
            return newNode;
        }else{
            return nullptr;
        }
    }
    if(k==1){
        newNode->next = head;
        return newNode;
    }
    Node<int>* temp = head;
    int count = 0;
    while(temp!=NULL){
        count++;
        if(count==(k-1)){
            newNode->next = temp->next;
            temp->next = newNode;
            break;
        }
        temp = temp->next;
    }
    return head;
}
//val = toBeInserted , k = InsertAtThisPosition
//T.C = BigO(n)
//A.S = BigO(1)


Node<int>* insertionBeforeNode(Node<int>* head, int k, int val) {
    if(head == NULL){
        return nullptr;
    }
    Node<int>* temp = head;
    if(temp->data == k){
        return new Node<int>(val,head);
    }
    while(temp!=NULL){
        if(temp->next != NULL && temp->next->data == k){
            Node<int>* newNode = new Node<int>(val);
            newNode->next = temp->next;
            temp->next = newNode;
            break;
        }
        temp = temp->next;
    }
    return head;
}
//val = toBeInserted , k = InsertBeforeThisElement
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: main function--------------------------
//int main() {
//    vector<int> vectorArray1{6,7,8,9,10};
//    Node<int>* head = arrayToLL(vectorArray1);
//    traversalOfLL(head);
//    cout<<endl;
//    return 0;
//}
