
def react(data, completed = false)
	until completed
		i = 0
		# for i in 1..data.length
		loop do
			i += 1
			if (( /[[:upper:]]/.match(data[i]) and
					/[[:lower:]]/.match(data[i-1])) or
			( /[[:lower:]]/.match(data[i]) and
					/[[:upper:]]/.match(data[i-1]))) and
			(data[i-1].upcase == data[i].upcase)
				# p "x"*20
				# p data[i]
				# p data[i-1]
				data.slice!(i-1)
				data.slice!(i-1)
				i = 0
				# p i
				# p data.length
				# p "x"*20
			end
			if i > data.length
				break
			end
		end
		completed = true
	end
	data
end
# p data.length

input = File.read('input.txt')
# input = File.read('test.txt')
input.gsub!("\n",'')
# p data
part2 = Hash.new
letters = (10...36).map{ |i| i.to_s 36}

letters.each do |l|
	tmp_data = input.dup
	tmp_data.gsub!(l,'')
	tmp_data.gsub!(l.upcase,'')
	# p l
	# p tmp_data
	# p react(tmp_data)
	part2[l] = react(tmp_data).length

	#part2[l] = data.length - data.count(l) - data.count(l.upcase)
end

p part2.sort_by {|k,v| v}

# p react(input)