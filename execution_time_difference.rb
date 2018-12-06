require 'byebug'

# def my_min(array)
#   smallest = array.first
#   array.each_with_index do |el1, i|
#     array[i+1..-1].each do |el2|
#       if el1 < el2 && el1 < smallest
#         smallest = el1
#       end
#     end
#   end
#   smallest
# end

# # test case for my_min Phase I
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# def my_min(array)
#   smallest = array.first
#   array.each { |n| smallest = n if n < smallest }
#   smallest
# end

# # test case for my_min Phase II
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
  subsums = []
  length = array.length
  array.each_index do |i|
    (length - i).times do |j|
      subsums << array[i..i+j]
    end
  end

  subsums.map { |subsum| subsum.reduce(:+) }.max
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def largest_contiguous_subsum(array)
  largest = array.first
  local = 0
  array.each do |num|
    local < 0 && num > 0 ? local = num : local += num
    largest = local if local > largest
  end
  largest
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])