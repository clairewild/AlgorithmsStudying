class QuickUnion:
    def __init__(self, n):
        self.array = []
        self.size = []
        for i in range(0, n):
            self.array.append(i)
            self.size.append(1)

    def root(self, i):
        while i != self.array[i]:
            self.array[i] = self.array[self.array[i]] # not sure this works w/ size array
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
            self.size[j] += self.size[i]
        else:
            self.array[j] = i
            self.size[i] += self.size[j]
