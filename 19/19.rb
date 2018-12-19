# INPUT = File.readlines('test.txt').map(&:strip)
INPUT = File.readlines('input.txt').map(&:strip)

pp = INPUT.first.split('').last.to_i
INPUT.shift

result = Array.new(1,0)
# part2
result[0] = 1
$pointer = 0
result[pp] = $pointer

def calc(instr, result, pp)
	a = instr[1].to_i
	b = instr[2].to_i
	c = instr[3].to_i
	result[a].nil? ? result[a] = 0 : true
	result[b].nil? ? result[b] = 0 : true
	result[c].nil? ? result[c] = 0 : true
	if instr[0] == 'seti'
		result[pp] = $pointer
		result[c] = a
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'addi'
		result[pp] = $pointer
		result[c] = result[a] + b
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'gtrr'
		result[pp] = $pointer
		result[a] > result[b] ? result[c] = 1 : result[c] = 0
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'eqrr'
		result[pp] = $pointer
		result[a] == result[b] ? result[c] = 1 : result[c] = 0
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'mulr'
		result[pp] = $pointer
		result[c] = result[a] * result[b]
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'muli'
		result[pp] = $pointer
		result[c] = result[a] * b
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'setr'
		result[pp] = $pointer
		result[c] = result[a]
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	elsif instr[0] == 'addr'
		result[pp] = $pointer
		result[c] = result[a] + result[b]
		$pointer = result[pp]
		$pointer += 1
		result[pp] = $pointer
	else
		p "X"*50
	end
end

while $pointer < INPUT.length
# INPUT.each do |instr|
	calc(INPUT[$pointer].split, result, pp)
end

p result
