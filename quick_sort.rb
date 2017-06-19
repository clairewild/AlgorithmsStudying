def quick_sort(arr, left = 0, right = arr.length - 1)
  return arr unless left < right
  pivot_idx = partition(arr, left, right)
  quick_sort(arr, left, pivot_idx - 1)
  quick_sort(arr, pivot_idx + 1, right)
  return arr
end

def partition(arr, left, right)
  pivot_idx = right
  pivot = arr[right]
  i = left
  j = pivot_idx - 1
  while i < j
    i += 1 while arr[i] <= pivot && i <= j
    j -= 1 while arr[j] > pivot && i < j
    arr[i], arr[j] = arr[j], arr[i] if i < j && arr[i] > arr[j]
  end
  arr[i], arr[pivot_idx] = arr[pivot_idx], arr[i] unless arr[i] < pivot
  return i
end


p quick_sort([3,4,5,2,5,7,1,8])

def quick_select(array, k)

end
