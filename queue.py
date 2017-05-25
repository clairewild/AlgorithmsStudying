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
        self.prev.set_prev(self.head)

    def push(self, val):

    def pop(self):

    def is_empty:

class DoubleNode:
    def __init__(self, val):
        self.val = val
        self.prev = null
        self.next = null

    def remove(self):
        self.prev.next = self.next
        self.next.prev = self.prev
