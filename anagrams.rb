require 'byebug'

def anagram?(str1, str2)
  # O(n!)
  return false if str1.length != str2.length
  perms = str1.chars.permutation.to_a
  perms.each do |perm|
    return true if perm.join == str2
  end
  false
end

def second_anagram?(str1, str2)
  # O(n^2)
  str2_chars = str2.chars
  str1.each_char do |letter|
    i = str2_chars.find_index(letter)
    str2_chars.delete_at(i) unless i.nil?
  end
  str2_chars.empty?
end

def third_anagram?(str1, str2)
  # O(n log n)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  # O(n)
  hsh1 = Hash.new(0)
  hsh2 = Hash.new(0)
  str1.each_char { |letter| hsh1[letter] += 1 }
  str2.each_char { |letter| hsh2[letter] += 1 }
  hsh1 == hsh2
end

def fifth_anagram?(str1, str2)
  # O(n)
  hsh1 = Hash.new(0)
  str1.each_char { |letter| hsh1[letter] += 1 }
  str2.each_char { |letter| hsh1[letter] -= 1 }
  hsh1.values.all? { |value| value.zero? }
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true