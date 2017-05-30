def selection_sort(array)
  i = 0
  while i < array.length
    min_idx = find_min_idx(array[i..-1])
    array[i], array[min_idx] = array[min_idx], array[i]
    i += 1
  end
  array
end

def find_min_idx(array)
  min_idx = 0
  array.each_index do |i|
    min_idx = i if array[i] < array[min_idx]
  end
  min_idx
end
