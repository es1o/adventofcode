# THIS DOESN'T WORK


require 'time'
data = File.readlines('input.txt')
# data = File.readlines('test.txt')
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
		if not duties.key? guard
			duties[guard] = Hash.new
		end
		duties[guard][t] = Hash.new
		duties[guard][t][m] = "w"
	elsif g =~ /^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}\] falls asleep.*$/
		if not duties[guard].key? t
			duties[guard][t] = Hash.new
		end
		duties[guard][t][m] = "s"
	elsif g =~ /^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}\] wakes up.*$/
		if not duties[guard].key? t
			duties[guard][t] = Hash.new
		end
		duties[guard][t][m] = "w"

	end
end
result = Hash.new
duties.each do |k,v|
	status = "w"
	minutes = [0]*60
	v.each do |d,t|
		for x in 0..59
			if t.key? x
				status = t[x]
			end
			if status == "s"
				minutes[x] += 1
			end
		end
	end
	result[k] = minutes
end
# max = result.sort_by{|k,v| v.count{|x| x > 0}}.reverse.to_h
max = result.sort_by{|k,v| v.sum}.reverse.to_h
p max
max_keys = max[max.keys.first]
# p max_keys[46]
# p max.keys.first
# p max_keys[4]
# p max_keys
p max_keys.rindex(max_keys.max)
p max_keys.index(max_keys.max)
