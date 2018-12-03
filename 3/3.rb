# data = File.read('test.txt')
data = File.read('input.txt')

area = Hash.new
cover = Hash.new

data.each_line do |l|
	d = l.split(" ")
	x = d[2].split(',')[0].to_i
	y = d[2].split(',')[1].delete(':').to_i
	dx = d[3].split('x')[0].to_i
	dy = d[3].split('x')[1].to_i
	for i in x..(x + dx - 1)
		for j in y..(y + dy - 1)
			if area.key?("#{i}:#{j}")
				area["#{i}:#{j}"] += 1
			else
				area["#{i}:#{j}"] = 1
			end
			if cover.key?("#{i}:#{j}")
				cover["#{i}:#{j}"] << d[0]
			else
				cover["#{i}:#{j}"] = [d[0]]
			end
		end
	end
end

dup = area.values.count {|v| v > 1}
p "Answer 1: #{dup}"
covered = cover.select {|k, v| v.length > 1}
not_covered = cover.select {|k, v| v.length == 1}
c_squares =  covered.values.flatten.uniq
p "Answer 2: #{not_covered.values.flatten.uniq - c_squares}"
