import Foundation

public enum Order {
    case straight
    case reversed
}

final public class Element {
    public var value: Int
    var next: Element?
    var previous: Element?
    
    public init(value: Int) {
        self.value = value
    }
}

final public class LinkedList {
    var head: Element?
    var tail: Element?
    public init (element: Element) {
        self.head = element
        self.tail = element
    }
    
    public func append(element: Element) {
        element.previous = tail
        tail?.next = element
        tail = element
    }
    
    public func printLinkedList(order: Order) {
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
    
    public func getElementAt(position: Int) -> Element? {
        var element: Element?
        element = head
        if position == 0 {
            return element
        }
        for _ in 0..<position {
            if element == nil || element?.next == nil {
                return nil
            }
            element = element?.next
        }
        return element
    }
    
    public func insert(element: Element, position: Int) -> Bool {
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
        
        if position == 0 {
            head = element
        }
        result = true
        return result
    }
    
    public func deleteElement(position: Int) -> Bool {
        var result = false
        let currentElement = getElementAt(position: position)
        
        currentElement?.previous?.next = currentElement?.next
        currentElement?.next?.previous = currentElement?.previous
        
        if position == 0 {
            head = currentElement?.next
        }
        
        if currentElement?.next == nil {
            tail = currentElement?.previous
        }
        return false
    }
}
