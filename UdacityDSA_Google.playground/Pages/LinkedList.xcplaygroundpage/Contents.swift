//: [Previous](@previous)

/*
 The Doubly LinkedList code.
 Add following functions to the LinkedList.
 "getElementAtPosition" returns the element at a certain position.
 The "insert" function will add an element to a particular
 spot in the list.
 "delete" will delete the first element with that
 particular value.
 "printLinkedList" function will print the linked list.
 "printLinkedListReversed" function will print the linked list in reverse.
 */

import Foundation

enum Order {
    case straight
    case reversed
}

final class Element {
    var value: Int
    var next: Element?
    var previous: Element?
    
    init(value: Int) {
        self.value = value
    }
}

final class LinkedList {
    var head: Element
    var tail: Element
    init (element: Element) {
        self.head = element
        self.tail = element
    }
    
    func append(element: Element) {
        element.previous = tail
        tail.next = element
        tail = element
    }
    
    func printLinkedList(order: Order) {
        switch order {
        case .straight:
            printLinkedList()
        case .reversed:
            printReversedLinkedList()
        }
    }
    
    private func printLinkedList() {
        var element: Element?
        element = head
        while element != nil {
            print(element?.value ?? 0)
            element = element?.next
        }
    }
    
    private func printReversedLinkedList() {
        var element: Element?
        element = tail
        while element != nil {
            print(element?.value ?? 0)
            element = element?.previous
        }
    }
    
    func getElementAt(position: Int) -> Element? {
        var element: Element?
        element = head
        for _ in 0..<position {
            if element == nil || element?.next == nil {
                return nil
            }
            element = element?.next
        }
        return element
    }
    
    func insert(element: Element, position: Int) -> Bool {
        var result = false
        let currentElement = getElementAt(position: position)
        
        guard let currentElement = currentElement else {
            print("Failed")
            return result
        }
        
        element.previous = currentElement.previous
        currentElement.previous?.next = element
        currentElement.previous = element
        
        element.next = currentElement
        result = true
        return result
    }
    
    func deleteElement(position: Int) -> Bool {
        var result = false
        let currentElement = getElementAt(position: position)
        
        currentElement?.previous?.next = currentElement?.next
        currentElement?.next?.previous = currentElement?.previous
        
        return false
    }
}

var ll = LinkedList(element: Element(value: 10))
ll.append(element: Element(value: 20))
ll.append(element: Element(value: 30))
ll.append(element: Element(value: 40))
ll.append(element: Element(value: 50))
ll.append(element: Element(value: 60))

print(ll.getElementAt(position: 7)?.value)

ll.printLinkedList(order: .straight)

ll.insert(element: Element(value: 5), position: 1)

ll.printLinkedList(order: .straight)

ll.deleteElement(position: 1)

ll.printLinkedList(order: .straight)
