def merge_sort(array):
    if len(array) <= 1:
        return array
    midpoint = int(len(array) / 2)
    left = array[0:midpoint]
    right = array[midpoint:]
    return merge(merge_sort(left), merge_sort(right))

def merge(left, right):
    new_array = []
    i = 0
    j = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            new_array.append(left[i])
            i += 1
        else:
            new_array.append(right[j])
            j += 1
    return new_array + left[i:] + right[j:]

def bottom_up_merge_sort(array):
    N = len(array)
    size = 1
    while size < N:
        lo = 0
        while lo < N - size:
            pointer_merge(array, lo, lo + size - 1, min(lo + size * 2 - 1, N - 1))
            lo += size * 2
        size *= 2

def pointer_merge(array, lo, mid, hi):
    
