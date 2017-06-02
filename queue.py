class Queue:
    def __init__(self):
        self.array = []

    def enqueue(self, val):
        self.array.append(val)

    def dequeue(self):
        return self.array.pop(0)

    def is_empty(self):
        return self.array.length > 0

class DoublyLinkedList:
    def __init__(self):
        self.head = DoubleNode(null)
        self.tail = DoubleNode(null)
        self.head.set_next(self.tail)
        self.tail.set_prev(self.head)

    def push(self, val):
        node = DoubleNode(val)
        self.last.set_next(node)
        self.tail.set_prev(node)

    def pop(self):
        node = self.last
        new_last = node.prev
        new_last.set_next(self.tail)
        self.tail.set_prev(new_last)
        return node

    def last(self):
        return self.tail.prev

    def is_empty(self):
        return self.head.next == self.tail.prev

class DoubleNode:
    def __init__(self, val):
        self.val = val
        self.prev = null
        self.next = null

    def remove(self):
        self.prev.next = self.next
        self.next.prev = self.prev

    def set_prev(self, node):
        self.prev = node

    def set_next(self, node):
        self.next = node
