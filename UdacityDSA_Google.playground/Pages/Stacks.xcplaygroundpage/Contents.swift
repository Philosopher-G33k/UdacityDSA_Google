import UIKit
import Security


var greeting = "Hello, playground"

class Stack {
    private var linkdeList: LinkedList?
    
    init(_ element: Element) {
        linkdeList = LinkedList(element: element)
    }
    
    func push(_ element: Element) {
        linkdeList?.insert(element: element, position: 0)
    }
    
    func pop() -> Element? {
        let element = linkdeList?.getElementAt(position: 0)
        linkdeList?.deleteElement(position: 0)
        return element
    }
    
    func printStack() {
        linkdeList?.printLinkedList(order: .straight)
    }
}

var stack = Stack(Element(value: 10))
stack.push(Element(value: 20))
stack.push(Element(value: 30))
stack.push(Element(value: 40))
print(stack.pop()?.value)
print(stack.pop()?.value)
stack.printStack()
