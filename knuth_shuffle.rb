def knuth_shuffle(array)
  i = 0
  while i < array.length
    n = rand(0..i)
    array[i], array[n] = array[n], array[i]
    i += 1
  end
  array
end
