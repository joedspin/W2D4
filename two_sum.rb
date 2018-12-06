require 'byebug'

def bad_two_sum?(array, target)
  # O(n^2)
  array.each_with_index do |num1, i|
    array[i+1..-1].each do |num2|
      return true if num1 + num2 == target
    end
  end
  false
end

def okay_two_sum?(array, target)
  # O(n log n)
  array.sort!
  array.each_with_index do |num, i|
    diff = target - num
    return true if array.bsearch { |bnum| bnum == diff && bnum != num } == diff
  end
  false
end

def two_sum?(array, target)
  # O(n)
  hash = {}
  array.each { |num| hash[num] = num }
  array.each do |num|
    return true if hash[target - num] && num != target - num
  end
  false
end

def christian_sum?(array, target)
  #O(n log n)
  array.sort!
  i = 0
  j = array.length-1
  until i == j
    sum = array[i] + array[j]
    return true if sum == target
    sum > target ? j -= 1 : i += 1
  end
  false
end


arr = [0, 1, 5, 7]
p christian_sum?(arr, 6) # => should be true
p christian_sum?(arr, 10) # => should be false