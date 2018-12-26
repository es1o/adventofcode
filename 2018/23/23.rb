# INPUT = File.readlines('test.txt')
INPUT = File.readlines('input.txt')

data = Array.new
part1 = 0
def distance(a,b)
    distance = (b[0] - a[0]).abs + (b[1] - a[1]).abs + (b[2] - a[2]).abs
    return distance
end

INPUT.each do |i|
    i.strip!
    pos = i.scan(/\-?\d+,\-?\d+,\-?\d+/).first.split(',').map(&:to_i)
    r = i.scan(/\d+$/).first.to_i
    data << {:pos => pos, :r => r}
end
max =  data.max_by{ |h| h[:r]}

data.each do |s|
    if distance(max[:pos], s[:pos]) <= max[:r]
        part1 += 1
    end 
end

p "part1: #{part1}"