# INPUT = File.readlines('test.txt').map(&:strip)
INPUT = File.readlines('input.txt').map(&:strip)
# INPUT = File.readlines('input.txt')

max_y =  INPUT.length
max_x = INPUT[0].length

def get_near(map, x, y, max_x, max_y)
	x - 1 < 0 ? xs = 0 : xs = x - 1
	x + 1 >= max_x ? xe = max_x - 1 : xe = x + 1
	y - 1 < 0 ? ys = 0 : ys = y - 1
	y + 1 >= max_y ? ye = max_y - 1 : ye = y + 1
	open = 0
       	tree = 0 
	lumb = 0

	for ix in xs..xe
		for iy in ys..ye
			unless ix == x and iy == y
				if map[ix][iy] == "|"
					tree += 1
				elsif map[ix][iy] == "."
					open += 1
				else
					lumb += 1
				end
			end
		end
	end
	{:t => tree, :o => open, :l => lumb }
end

def new_state(ngbh, x, y, map)
	# # gets
	# p "esio"
	# p ngbh
	# p map[x][y]
	if map[x][y] == "." and ngbh[:t] >= 3
		"|"
	elsif map[x][y] == "|" and ngbh[:l] >= 3
		"#"
	elsif map[x][y] == "#"
		if ngbh[:l] != 0 and ngbh[:t] != 0
			"#"
		else
			"."
		end
	else
		map[x][y] 
	end
end

map = Array.new(max_x) { Array.new(max_y) }
# p map

INPUT.each_with_index do |line, y|
	line.split('').each_with_index do |row, x|
		map[x][y] = row
	end
end

# p map

# p new_state(get_near(map, 5, 3, max_x, max_y), 5, 3, map)

	map.each do |x|
		p x.join
	end
1000000000.times do 
	n_map = Array.new(max_x) { Array.new(max_y) }
	for i in 0..max_x-1
		for j in 0..max_y-1
		n_map[i][j] =  new_state(get_near(map, i, j, max_x, max_y), i, j, map)
		end
	end
	map = n_map.dup
	map.each do |x|
		p x.join
	end
end
p map.flatten.count('|')
p map.flatten.count('#')
# p map
