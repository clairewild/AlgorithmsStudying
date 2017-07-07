def quick_sort(arr, left, right):
    if left >= right: return arr
    pivot_idx = partition(arr, left, right)
    quick_sort(arr, left, pivot_idx - 1)
    quick_sort(arr, pivot_idx + 1, right)
    return arr

def partition(arr, left, right):
    pivot_idx = right
    pivot = arr[pivot_idx]
    i = left
    j = pivot_idx - 1
    while i < j:
        while arr[i] <= pivot and i <= j:
            i += 1
        while arr[j] > pivot and i < j:
            j -= 1
        if i < j and arr[i] > arr[j]:
            arr[i], arr[j] = arr[j], arr[i]
    if pivot < arr[i]:
        arr[i], arr[pivot_idx] = arr[pivot_idx], arr[i]
    return i
