# INPUT = File.read('test.txt').split(/^\n/)
INPUT = File.read('input.txt').split(/^\n/)

res = Hash.new { |h, k| h[k] = [] }

def check_instr(before, op, after, res)
	ops = 0
	# addr 
	addr = before.dup
	addr[op[3]] = before[op[1]] + before[op[2]]
	if addr == after
		res[:addr].push(op[0])
		ops += 1
	end
	# addi 
	addi = before.dup
	addi[op[3]] = before[op[1]] + op[2]
	if addi == after
		res[:addi].push(op[0])
		ops += 1
	end
	# mulr 
	mulr = before.dup
	mulr[op[3]] = before[op[1]] * before[op[2]]
	if mulr == after
		res[:mulr].push(op[0])
		ops += 1
	end
	# muli 
	muli = before.dup
	muli[op[3]] = before[op[1]] * op[2]
	if muli == after
		res[:muli].push(op[0])
		ops += 1
	end
	# setr 
	setr = before.dup
	setr[op[3]] = before[op[1]]
	if setr == after
		res[:setr].push(op[0])
		ops += 1
	end
	# seti
	seti = before.dup
	seti[op[3]] = op[1]
	if seti == after
		res[:seti].push(op[0])
		ops += 1
	end
	# banr 
	banr = before.dup
	banr[op[3]] = before[op[1]] & before[op[2]]
	if banr == after
		res[:banr].push(op[0])
		ops += 1
	end
	# bani 
	bani = before.dup
	bani[op[3]] = before[op[1]] & op[2]
	if bani == after
		res[:bani].push(op[0])
		ops += 1
	end
	# bonr 
	bonr = before.dup
	bonr[op[3]] = before[op[1]] | before[op[2]]
	if bonr == after
		res[:bonr].push(op[0])
		ops += 1
	end
	# bori 
	bori = before.dup
	bori[op[3]] = before[op[1]] | op[2]
	if bori == after
		res[:bori].push(op[0])
		ops += 1
	end
	# gtir 
	gtir = before.dup
	op[1] > before[op[2]] ? gtir[op[3]] = 1 : gtir[op[3]] = 0
	if gtir == after
		res[:gtir].push(op[0])
		ops += 1
	end
	# gtri 
	gtri = before.dup
	before[op[1]] > op[2] ? gtri[op[3]] = 1 : gtri[op[3]] = 0
	if gtri == after
		res[:gtri].push(op[0])
		ops += 1
	end
	# gtrr 
	gtrr = before.dup
	before[op[1]] > before[op[2]] ? gtrr[op[3]] = 1 : gtrr[op[3]] = 0
	if gtrr == after
		res[:gtrr].push(op[0])
		ops += 1
	end
	# eqir 
	eqir = before.dup
	op[1] == before[op[2]] ? eqir[op[3]] = 1 : eqir[op[3]] = 0
	if eqir == after
		res[:eqir].push(op[0])
		ops += 1
	end
	# eqri 
	eqri = before.dup
	before[op[1]] == op[2] ? eqri[op[3]] = 1 : eqri[op[3]] = 0
	if eqri == after
		res[:eqri].push(op[0])
		ops += 1
	end
	# eqrr 
	eqrr = before.dup
	before[op[1]] == before[op[2]] ? eqrr[op[3]] = 1 : eqrr[op[3]] = 0
	if eqrr == after
		res[:eqrr].push(op[0])
		ops += 1
	end
	return ops
end

def parse_testcase(test)
	num = test.scan(/\d,? \d,? \d,? \d/)
	if num.size == 3
		before = num[0].split(',').map(&:to_i)
		instr = num[1].split.map(&:to_i)
		after = num[2].split(',').map(&:to_i)
		return before, instr, after
	else
		return false
	end
end
def decode_opcodes(opcodes)
	run = true
	result = Hash.new
	while run
		# get opcode with 1 number and add to result
		oo = opcodes.select { |k, v| v.size == 1 }
		if oo.size > 0
			oo.each do |k, v|
				result[k] = v.dup
				opcodes.each {|a,b| b.delete v.first}
			end
		else
			p opcodes
			run = false
		end
	end
	result
end

op_nums = Hash.new
INPUT.each_with_index do |input, i|
	parsed = parse_testcase(input)
	if parsed
		op_nums[i] = check_instr(parsed[0], parsed[1], parsed[2], res)
	end
end

# PART 1
p op_nums.count { |k, v| v >= 3 }
# PART 2
res.values.map(&:uniq!)
p decode_opcodes(res)
