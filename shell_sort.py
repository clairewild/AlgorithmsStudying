def insertion_sort(array):
    i = 0
    while i < len(array):
        j = i - 1
        while j >= 0 and array[j + 1] < array[j]:
            [array[j + 1], array[j]] = [array[j], array[j + 1]]
            j -= 1
        i += 1
    return array

def h_sort(array, increment):
    i = 0
    while i < len(array):
        j = i - 1
        while j >= 0 and array[j + 1] < array[j]:
            [array[j + 1], array[j]] = [array[j], array[j + 1]]
            j -= increment
        i += increment
    return array

def shell_sort(array):
    array = h_sort(array, 7)
    array = h_sort(array, 3)
    array = h_sort(array, 1)
    return array
