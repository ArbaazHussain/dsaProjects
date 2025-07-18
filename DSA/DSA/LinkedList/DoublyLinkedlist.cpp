//
//  DoubleLinkedlist.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 16/07/25.
//

#include <stdio.h>
#include <iostream>
//#include "Node.h"

using namespace std;
using std::cout;
using std::endl;

//MARK: ----DoubleLinkedlist------

template <typename T>
class Node {
public:
    T data;          // data of generic type
    Node<T>* next;   // pointer to the next node
    Node<T>* back;

    // Constructor with data and next pointer
    Node(T data1, Node<T>* next1, Node<T>* back1) {
        data = data1;
        next = next1;
        back = back1;
    }
    // Constructor with only data
    Node(T data1) {
        data = data1;
        next = nullptr;
        back = nullptr;
    }
};


//MARK: arrayToDll
Node<int>* arrayToDll(vector<int>& nums) {
    if(nums.size() == 0){
        return nullptr;
    }
    Node<int>* head = new Node(nums[0]);
    Node<int>* prev = head;
    for (int i=1; i<nums.size(); i++) {
        Node<int>* temp = new Node<int>(nums[i], nullptr, prev);
        prev->next = temp;
        prev = temp;
    }
    return head;
}
//T.C = BigO(n)
//A.S = BigO(n)


//MARK: traversalOfDll
void traversalOfDll(Node<int>* head) {
    if(head == NULL) return ;
    Node<int>* temp = head;
    while(temp){
        cout<<temp->data<<" ";
        temp = temp->next;
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Deletion
Node<int>* deletionOfHeadDll(Node<int>* head) {
    if(head == NULL || head->next == NULL){
        return nullptr;
    }
    Node<int>* prev = head;
    
    head = head->next;
    head->back = nullptr;
    prev->next = nullptr;
    delete prev;
    return head;
}
//T.C = BigO(1)
//A.S = BigO(1)


Node<int>* deletionOfTailDll(Node<int>* head) {
    if(head == NULL || head->next == NULL){
        return nullptr;
    }
    Node<int>* temp = head;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    Node<int>* prev = temp->back;
    prev->next = nullptr;
    temp->back = nullptr;
    delete temp;
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


Node<int>* deletionOfKthElementDll(Node<int>* head, int k) {
    if(head == NULL){
        return nullptr;
    }
    int count = 0;
    Node<int>* temp = head;
    while (temp!= NULL) {
        count++;
        if(count==k){
            break;
        }
        temp = temp->next;
    }
    Node<int>* prev = temp->back;
    Node<int>* next = temp->next;
    if(prev==NULL && next==NULL){
        delete temp;
        return nullptr;
    }else if(prev==NULL){
        return deletionOfHeadDll(head);
    }else if(next==NULL){
        return deletionOfTailDll(head);
    }else{
        prev->next = next;
        next->back = prev;
        temp->next = nullptr;
        temp->back = nullptr;
        delete temp;
    }
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


void deletionNodeDll(Node<int>* node) {
    if(node == NULL){
        return;
    }
    Node<int>* prev = node->back;
    Node<int>* next = node->next;
    if(next==NULL){
        prev->next = nullptr;
        node->back = nullptr;
        delete node;
    }else{
        prev->next = next;
        next->back = prev;
        node->next = nullptr;
        node->back = nullptr;
        delete node;
    }
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Insertion
Node<int>* insertionBeforeHeadDll(Node<int>* head, int val) {
    Node<int>* newAdd = new Node<int>(val, head, nullptr);
    head->back = newAdd;
    return newAdd;
}
//T.C = BigO(1)
//A.S = BigO(1)


Node<int>* insertionBeforeTailDll(Node<int>* head, int val) {
    if(head==NULL){
        return nullptr;
    }
    if(head->next==NULL){
        return insertionBeforeHeadDll(head, val);
    }
    Node<int>* tail = head;
    while (tail->next!=NULL) {
        tail=tail->next;
    }
    Node<int>* prev = tail->back;
    Node<int>* newAdd = new Node<int>(val, tail, prev);
    prev->next = newAdd;
    tail->back = newAdd;
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


Node<int>* insertionBeforeKthElementDll(Node<int>* head, int k, int val) {
    if(head==NULL){
        return nullptr;
    }
    if(k==1){
        return insertionBeforeHeadDll(head, val);
    }
    Node<int>* temp = head;
    int count = 0;
    while (temp!=NULL) {
        count++;
        if(k==count){
            break;
        }
        temp=temp->next;
    }
    Node<int>* prev = temp->back;
    Node<int>* newAdd = new Node<int>(val, temp, prev);
    prev->next = newAdd;
    temp->back = newAdd;
    return head;
}
//T.C = BigO(n)
//A.S = BigO(1)


void insertionBeforeNodeDll(Node<int>* node, int val) {
    if(node == NULL){
        return ;
    }
    Node<int>* prev = node->back;
    Node<int>* newAdd = new Node<int>(val, node, prev);
    prev->next = newAdd;
    node->back = newAdd;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: Reverse
Node<int>* reverseBrute(Node<int>* head) {
    Node<int>* temp = head;
    stack<int> st;
    while (temp!=NULL) {
        st.push(temp->data);
        temp=temp->next;
    }
    temp = head;
    while (temp!=NULL) {
        temp->data = st.top();
        st.pop();
        temp=temp->next;
    }
    return head;
}
//T.C = BigO(2n)
//A.S = BigO(n)


Node<int>* reverseOptimal(Node<int>* head) {
    if(head == NULL || head->next == NULL){
        return head;
    }
    Node<int>* last = NULL;
    Node<int>* current = head;
    while (current!=NULL) {
        last=current->back;
        current->back = current->next;
        current->next = last;
        current=current->back;
    }
    return last->back;
}
//T.C = BigO(n)
//A.S = BigO(1)


//MARK: main function--------------------------
int main() {
    vector<int> vectorArray1{1,2,3};
    Node<int>* head = arrayToDll(vectorArray1);
    Node<int>* rev = reverseOptimal(head);
    traversalOfDll(rev);
    cout<<endl;
    return 0;
}
