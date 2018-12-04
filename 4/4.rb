require 'time'
# data = File.read('test.txt')
data = File.readlines('input.txt')
guard = nil

duties = Hash.new
guards = data.sort_by{|l| Time.parse(l) }
guard = nil

guards.each do |g|
	date = g.split(']')[0].delete('[')
	t = Time.parse(date).strftime("%m-%d-%Y")
	m = Time.parse(date).min
	if g =~ /^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}\] Guard #\d+ begins shift.*$/
		guard = g.split(' ')[3]
		p m
		if not duties.key? guard
			duties[guard] = Hash.new
		end
		duties[guard][t] = Array.new(60)
	elsif g =~ /^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}\] falls asleep.*$/
		if not duties[guard].key? t
			duties[guard][t] = Array.new(60)
		end
		duties[guard][t][m] = "s"
	elsif g =~ /^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}\] wakes up.*$/
		if not duties[guard].key? t
			duties[guard][t] = Array.new(60)
		end
		duties[guard][t][m] = "w"

	end
end
duties.each do |k,v|
	p k
	v.each do |x,y|
		status = "w"
		y.each_with_index do |t,i|
			if t == "w" or t == "s"
				status = t
			else
				y[i] = status
			end
		end
	end
	# p v.values.flatten.count {|z| z == "s"}
end
# p duties
p duties["#1973"]
