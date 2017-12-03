#Function to check if a string is a permutation of a palindrome.
#Spaces are ignored. Ignore case

def palindrome_permutation(string)
  lowercase = string.downcase
  counter = Hash.new(0)
  
  lowercase.each_char {|char| counter[char] += 1 unless char == " "}
  
  found_odd = false
  
  counter.keys.each do |char|
    if counter[char] % 2 != 0
      return false if found_odd
      found_odd = true
    end
  end
  true
end

#reraacc
puts(palindrome_permutation("reraacc"))
#reraaccc
puts(palindrome_permutation("reraaccc"))
#Tact Coa
puts(palindrome_permutation("Tact Coa"))