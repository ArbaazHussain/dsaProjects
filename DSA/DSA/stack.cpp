//
//  stack.cpp
//  DSA
//
//  Created by Arbaaz Hussain on 27/08/25.
//

#include <stdio.h>
#include <iostream>

using namespace std;
//using std::cout;
//using std::endl;

/*
 Stack,Queue Operations- Push,Pop,Top,Size

 * Stack and Queue can be created using array, But fixed array is prefered over vector because it resizes (doubles capacity), enqueue could take O(n) occasionally.
 *  Here Problem with Stack and Queue using fixed array is that is constant size.

 
 */


//MARK: StackUsingArray
class StackUsingArray {
    int * arr;
    int maxSize,top;
public:
    StackUsingArray(int maxSize) {
        ( * this).maxSize = maxSize;
        arr = new int[maxSize];
        top = -1;
    }
    void push(int x) {
        if (top+1 == maxSize) {
            cout <<"Stack is full"<<endl;
            return;
        }
        top++;
        arr[top] = x;
        cout<<"The element pushed is "<<x<<endl;
    }
    int pop() {
        if(top==-1){
            cout<<"Stack is empty";
            return -1;
        }
        int x = arr[top];
        top--;
        return x;
    }
    int Top() {
        if(top==-1){
            cout<<"Stack is empty";
            return -1;
        }
        return arr[top];
    }
    int Size() {
        return top + 1;
    }
};


//MARK: QueueUsingArray
class QueueUsingArray {
    int * arr;
    int start, end, currSize, maxSize;
public:
    QueueUsingArray(int maxSize) {
        ( * this).maxSize = maxSize;
        arr = new int[maxSize];
        currSize = 0;
        start = -1;
        end = -1;
    }
    void push(int newElement) {
        if (currSize == maxSize) {
            cout<<"Queue is full "<<endl;
            return;;
        }
        if (currSize == 0) {
            start = 0;
            end = 0;
        } else {
            end = (end + 1) % maxSize;
        }
        arr[end] = newElement;
        currSize++;
        cout<<"The element pushed is "<<newElement<<endl;
    }
    int pop() {
        if (currSize == 0) {
            cout<<"Queue is Empty"<<endl;
            return -1;
        }
        int popped = arr[start];
        if (currSize == 1) {
            start = -1;
            end = -1;
        } else {
            start = (start + 1) % maxSize;
        }
        currSize--;
        return popped;
    }
    int top() {
        if (start == -1) {
            cout<<"Queue is Empty"<<endl;
            return -1;
        }
        return arr[start];
    }
    int size() {
        return currSize;
    }
};

//MARK: StackUsingLL
struct stackNode {
  int data;
  stackNode * next;
  int size;
  stackNode(int d) {
    data = d;
    next = NULL;
  }
};
struct StackUsingLL {
    stackNode * top;
    int size;
    StackUsingLL() {
        top = NULL;
        size = 0;
    }
    void stackPush(int x) {
        stackNode * element = new stackNode(x);
        element -> next = top;
        top = element;
        size++;
        cout<<"The element pushed is "<<element->data<<endl;
    }
    int stackPop() {
        if (top == NULL) {
            return -1;
        }
        int topData = top -> data;
        stackNode * temp = top;
        top = top -> next;
        delete temp;
        size--;
        return topData;
    }
    int stackSize() {
        return size;
    }
    bool stackIsEmpty() {
        return top == NULL;
    }
    int stackPeek() {
        if (top == NULL) return -1;
        return top -> data;
    }
    void printStack() {
        stackNode * current = top;
        while (current != NULL) {
            cout << current -> data << " ";
            current = current -> next;
        }
    }
};


//MARK: QueueUsingLL
class QueueNode
{
public:
    int val;
    QueueNode *next;
    QueueNode(int data)
    {
        val = data;
        next = nullptr;
    }
};
QueueNode *Front = nullptr, *Rare = nullptr;

class QueueUsingLL
{
public:
    int size = 0;
    bool Empty();
    void Enqueue(int value);
    void Dequeue();
    int Peek();
};
bool QueueUsingLL ::  Empty()
{
    return Front == nullptr;
}
int QueueUsingLL :: Peek()
{
    if(Empty())
    {  cout<<"Queue is Empty"<<endl;
        return -1;
    }
    else
        return Front->val;
}
void QueueUsingLL :: Enqueue(int value)
{
    QueueNode *Temp;
    Temp = new QueueNode(value);
    if (Temp == nullptr)  //When heap exhausted
        cout<<"Queue is Full"<<endl;
    else
    {
        if (Front == nullptr)
        {
            Front = Temp;
            Rare = Temp;
        }
        else
        {
            Rare->next = Temp;
            Rare = Temp;
        }
        cout<<"The element pushed is "<<value<<endl;
        size++;
    }
}
void QueueUsingLL :: Dequeue()
{
    if (Front == nullptr)
        cout<<"Queue is Empty"<<endl;
    else
    {
        cout<<"The element poped is"<<Front->val<<endl;
        QueueNode *Temp = Front;
        Front = Front->next;
        delete Temp;
        size--;
    }
}


//MARK: main function--------------------------
int main() {
    //    StackUsingArray st(2);
    //    st.push(6);
    //    st.push(3);
    //    st.push(7);
    //    st.push(9);
    //    st.push(100);
    //    cout << "Top of stack is before deleting any element " << st.Top() << endl;
    //    cout << "Size of stack before deleting any element " << st.Size() << endl;
    //    cout << "The element deleted is " << st.pop() << endl;
    //    cout << "Size of stack after deleting an element " << st.Size() << endl;
    //    cout << "Top of stack after deleting an element " << st.Top() << endl;
    
    
    //    QueueUsingArray q(4);
    //    q.push(4);
    //    q.push(14);
    //    q.push(24);
    //    q.push(34);
    //    cout << "The peek of the queue before deleting any element " << q.top() << endl;
    //    cout << "The size of the queue before deletion " << q.size() << endl;
    //    cout << "The first element to be deleted " << q.pop() << endl;
    //    cout << "The peek of the queue after deleting an element " << q.top() << endl;
    //    cout << "The size of the queue after deleting an element " << q.size() << endl;
    
    
    //    StackUsingLL st;
    //    st.stackPush(10);
    //    cout << "Element popped: " << st.stackPop() << "\n";
    //    cout << "Stack size: " << st.stackSize() << "\n";
    //    cout <<"Stack empty or not? "<<st.stackIsEmpty()<<"\n";
    //    cout << "stack's top element: " << st.stackPeek() << "\n";
    
    
    //    QueueUsingLL q;
    //    q.Enqueue(10);
    //    q.Enqueue(20);
    //    q.Enqueue(30);
    //    q.Enqueue(40);
    //    q.Enqueue(50);
    //    q.Dequeue();
    //    cout<<"The size of the Queue is "<<q.size<<endl;
    //    cout<<"The Peek element of the Queue is "<<q.Peek()<<endl;
    return 0;
}
