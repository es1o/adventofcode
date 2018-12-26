# INPUT = File.read('test.txt').split(/^\n/)
INPUT = File.read('input.txt').split(/^\n/)

res = Hash.new { |h, k| h[k] = [] }

def addi(input, params)
	input[params[3]] = input[params[1]] + params[2]
	return input
end

def addr(input, params)
	input[params[3]] = input[params[1]] + input[params[2]]
	return input
end

def mulr(input, params)
	input[params[3]] = input[params[1]] * input[params[2]]
	return input
end

def muli(input, params)
	input[params[3]] = input[params[1]] * params[2]
	return input
end

def setr(input, params)
	input[params[3]] = input[params[1]]
	return input
end

def seti(input, params)
	input[params[3]] = params[1]
	return input
end

def banr(input, params)
	input[params[3]] = input[params[1]] & input[params[2]]
	return input
end

def bani(input, params)
	input[params[3]] = input[params[1]] & params[2]
	return input
end

def borr(input, params)
	input[params[3]] = input[params[1]] | input[params[2]]
	return input
end

def bori(input, params)
	input[params[3]] = input[params[1]] | params[2]
	return input
end

def gtir(input, params)
	input[params[1]] > params[2] ? input[params[3]] = 1 : input[params[3]] = 0
	return input
end

def gtri(input, params)
	params[1] > input[params[2]] ? input[params[3]] = 1 : input[params[3]] = 0
	return input
end

def gtrr(input, params)
	input[params[1]] > input[params[2]] ? input[params[3]] = 1 : input[params[3]] = 0
	return input
end

def eqir(input, params)
	params[1] == input[params[2]] ? input[params[3]] = 1 : input[params[3]] = 0
	return input
end
def eqri(input, params)
	params[2] == input[params[1]] ? input[params[3]] = 1 : input[params[3]] = 0
	return input
end
def eqrr(input, params)
	input[params[2]] == input[params[1]] ? input[params[3]] = 1 : input[params[3]] = 0
	return input
end

def check_instr(before, op, after, res)
	ops = 0
	# gtrr 
	if gtrr(before.dup, op) == after
		res[:gtrr].push(op[0])
		ops += 1
	end
	# eqir 
	if eqir(before.dup, op) == after
		res[:eqir].push(op[0])
		ops += 1
	end
	# eqri 
	if eqri(before.dup, op) == after
		res[:eqri].push(op[0])
		ops += 1
	end
	# eqrr 
	if eqrr(before.dup, op) == after
		res[:eqrr].push(op[0])
		ops += 1
	end
	# addr 
	if addr(before.dup, op) == after
		res[:addr].push(op[0])
		ops += 1
	end
	# addi 
	if addi(before.dup, op) == after
		res[:addi].push(op[0])
		ops += 1
	end
	# mulr 
	if mulr(before.dup, op) == after
		res[:mulr].push(op[0])
		ops += 1
	end
	# muli 
	if muli(before.dup, op) == after
		res[:muli].push(op[0])
		ops += 1
	end
	# setr 
	if setr(before.dup, op) == after
		res[:setr].push(op[0])
		ops += 1
	end
	# seti
	if seti(before.dup, op) == after
		res[:seti].push(op[0])
		ops += 1
	end
	# banr 
	if banr(before.dup, op) == after
		res[:banr].push(op[0])
		ops += 1
	end
	# bani 
	if bani(before.dup, op) == after
		res[:bani].push(op[0])
		ops += 1
	end
	# borr
	if borr(before.dup, op) == after
		res[:borr].push(op[0])
		ops += 1
	end
	# bori 
	if bori(before.dup, op) == after
		res[:bori].push(op[0])
		ops += 1
	end
	# gtir 
	if gtir(before.dup, op) == after
		res[:gtir].push(op[0])
		ops += 1
	end
	# gtri 
	if gtri(before.dup, op) == after
		res[:gtri].push(op[0])
		ops += 1
	end
	return ops
end

def parse_testcase(test)
	num = test.scan(/\d+,? \d+,? \d+,? \d+/)
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
	oo = opcodes.select { |k, v| v.size > 0 }
	oo.each do |k, v|
		# send(k.to_s)
		# p v
		# p "esio"
		INPUT.each_with_index do |input, i|
			parsed = parse_testcase(input)
			if parsed and v.include? parsed[1][0]
				if send(k, parsed[0], parsed[1]) != parsed[2]
					oo[k].delete parsed[1][0]
					p oo
				end
			end
			# if parsed
			# 	op_nums[i] = check_instr(parsed[0], parsed[1], parsed[2], res)
			# end
		end
	end
	p oo.size
	p oo
	# p opcodes
	# easy opcodes to decode
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
