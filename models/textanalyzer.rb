#your text analyzer model code will go here.
class TextAnalyzer

	attr_accessor :text

	def initialize(text)
		@text = text
	end 

	def count_of_words
		@text.split(" ").count
	end 

	def count_of_vowels
		@text.downcase.scan(/[aeiou]/).count
	end 

	def count_of_consonants
		@text.downcase.scan(/[bcdfghjklmnpqrstvwxyz]/).count
	end 

	def most_used_letter
	# this is replacing every character that is NOT a through z with a space to make sure it doesn't count special characters; then it is separating by character and getting unique characters
	# text = "hello how are you!...."
	# text.gsub(/[^a-z]/, ' ') --> "hello how are you     "
	# text.gsub(/[^a-z]/, ' ').split --> => ["h", "e", "l", "l", "o", " ", "h", "o", "w", " ", "a", "r", "e", " ", "y", "o", "u", " ", " ", " ", " ", " "]
	# text.gsub(/[^a-z]/, ' ').split('').uniq --> ["h", "e", "l", "o", " ", "w", "a", "r", "y", "u"]
		all_letters_in_string = @text.downcase.gsub(/[^a-z]/,'').split('')
		letters_to_compare = all_letters_in_string.uniq
		most_used_letter = ""
		letter_count = 0

		#this is iterating through all the unique characters [including spaces] in letters_to_compare... if the count of that character is higher than 0, that letter's count is stored in letter_count..if that letter_count is the max... that letter must be the most used letter
		letters_to_compare.map do |letter|
			letter_repetitions = all_letters_in_string.count(letter)
			if letter_repetitions > letter_count
				letter_count = letter_repetitions
				most_used_letter = letter.upcase
			end 
		end 

		biggest = [most_used_letter, letter_count]
	end 



end 