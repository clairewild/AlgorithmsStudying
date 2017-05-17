class QuickUnion:
    def __init__(self, n):
        self.array = []
        for i in range(0, n):
            self.array.append(i)
        # initialize size array

    def root(self, i):
        while i != self.array[i]:
            self.array[i] = self.array[self.array[i]]
            i = self.array[i]
        return i

    def connected(self, p, q):
        return self.root(p) == self.root(q)

    def union(self, p, q):
        i = self.root(p)
        j = self.root(q)
        if i == j:
            return
        if size[i] < size[j]:
            self.array[i] = j
            # increase size[i]
        else:
            self.array[j] = i
            # increase size
