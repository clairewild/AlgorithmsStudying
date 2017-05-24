def three_sum(array, target):
    result = []
    array = sorted(array)
    i = 0
    while i < len(array) - 1:
        j = i + 1
        while j < len(array):
            sum = array[i] + array[j]
            new_target = target - sum
            k = binary_search(array, new_target)
            if k > -1 and k != i and k != j:
                result.append([i, j, k])
            j += 1
        i += 1
    return result

def binary_search(array, target):
    if len(array) < 1:
        return -1
    midpoint = int(len(array) / 2)
    left = array[:midpoint]
    right = array[midpoint + 1:]
    if target == array[midpoint]:
        return midpoint
    elif target < array[midpoint]:
        return binary_search(left, target)
    else:
        res = binary_search(right, target)
        if res > -1:
            return res + midpoint
        else:
            return -1
