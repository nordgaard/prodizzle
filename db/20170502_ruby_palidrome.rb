# Write a method called `palindrome?` which should accept a string as a parameter and return 
# a boolean that indicates whether the string is a palindrome. 
# A palindrome is a word that reads the same both forwards and backwards. Examples: eye, madam, racecar
# ```p palindrome?("racecar")   #=> true
# p palindrome?("wazzzzup")  #=> false```
# p palindrome?("wazzzzup")  #=> false```

def palindrome(string)
	if string == string.reverse
		return true
	else
		return false
	end
end

p palindrome("bloooooooolb")