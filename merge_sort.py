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
