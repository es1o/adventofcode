INPUT = File.readlines('test.txt').map(&:strip)
# INPUT = File.readlines('input.txt')

p INPUT

p INPUT[0].scan(/=\d?/).first.split('=').first
map = Array.new
output = 0
INPUT.each do |i|
	x = i.scan(/x=(\d+\.{2}\d+|\d+)/).first.first
	y = i.scan(/y=(\d+\.{2}\d+|\d+)/).first.first
	if x =~ /\d+\.{2}\d+/
		range_x = x.split('..')
		for j in range_x[0]..range_x[1]
			map << [j.to_i, y.to_i]
		end
	elsif y =~ /\d+\.{2}\d+/
		range_y = y.split('..')
		for j in range_y[0]..range_y[1]
			map << [x.to_i, j.to_i]
		end
	end
end

max_y = map.map(&:last).max
p max_y
p map
