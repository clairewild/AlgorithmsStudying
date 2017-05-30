class Queue:
    def __init__(self):
        self.array = []

    def enqueue(val):

    def dequeue(val):

    def is_empty:

class DoublyLinkedList:
    def __init__(self):
        self.head = DoubleNode(null)
        self.tail = DoubleNode(null)
        self.head.set_next(self.tail)
        self.tail.set_prev(self.head)

    def push(self, val):

    def pop(self):

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
