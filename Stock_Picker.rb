def stock_picker(arr)
  day_bought = 0
  day_sold = 0
  arr.each_with_index do |val, index|
    # Use map to find the diff of the current iteration to all members of the array
    # Take the highest resulting number and store it
    # If a new iteration has a higher number replace the number
    adj_arr = arr.map { |val_map| val - val_map}
    if max_index(adj_arr)[0] > day_sold
      day_bought = index
      day_sold = max_index(adj_arr)[0]
    end
  end
  result << day_bought
  result << day_sold
  return result
end

def max_index(array)
  if array.empty?
    return [] # Return an empty array if the input array is empty.
  end

  highest_value = array.max
  indices_of_highest = []
  array.each_with_index { |element, index|
    if element == highest_value
      indices_of_highest << index
    end
  }

  return indices_of_highest
end


# stock_picker([17,3,6,9,15,8,6,1,10])
# [1,4]  # for a profit of $15 - $3 == $12
