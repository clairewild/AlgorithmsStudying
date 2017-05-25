import math

class StackWithMax:
    def __init__(self):
        self.array = []
        self.max = -math.inf

    def push(self, val):
        self.array.append(val)
        self.max = max(self.max, val)

    def pop(self):
        popped = self.array.pop()
        self.max = -math.inf
        for x in self.array:
            if x > self.max:
                self.max = x
        return popped

    def is_empty(self):
        return len(self.array) == 0
