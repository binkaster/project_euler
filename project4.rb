require 'pp'

puts "Solving Project 4 from Project Euler";
digits = 2

def generate_number (digits)
	number = ""
	(1..digits).each do |i| 
		number << "9"
	end
	number.to_i
end

def check_if_palindrome(number)
	str = number.to_s
	last_index = str.length-1
	for i in 0..str.length/2
		l_ind = i 
		r_ind = last_index - i 
		if (l_ind < r_ind)
			if (str[l_ind] != str[r_ind])
				return false	
			end	
		end
	end
	return true
end

def find_palindromes(number) 
	palindromes = []
	factors = {}
	outer_range = (1..number)
	(outer_range.last).downto(outer_range.first).each do |i|
		inner_range = (i/2..i)
		(inner_range.last).downto(inner_range.first).each do |j|
			if check_if_palindrome(i*j)
				prod = i*j
				factors[prod.to_s] = {"product" => prod.to_s, "i" => i, "j" => j}
				palindromes << prod
			end
		end
	end
	factors[palindromes.sort.last.to_s]
end

number = generate_number(digits)

result_hash = find_palindromes(number)
puts "Largest palindrome for the product of two " + digits.to_s + "-digits numbers is:"
puts result_hash["product"]
puts "with the following factors: " + result_hash['j'].to_s + " x " + result_hash["i"].to_s


