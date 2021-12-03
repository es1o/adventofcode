f = open("input.txt")
# f = open("test.txt")

# PART 1
def split_str(s):
  return [int(c) for c in s]

file_len = 0
line_len = 0
comm = [] # common bits
for i in range(15):
  comm.append(0)

file_arr = [] # array with all lines

for l in f:
  x = split_str(l.replace('\n',''))
  file_arr.append(x)
  line_len = len(x)
  file_len+=1
  for i in range(line_len):
    if x[i] == 1:
      comm[i] += 1

epsilon = []
gamma = []

for i in range(line_len):
  if (comm[i] > (file_len/2)):
    epsilon.append(0)
    gamma.append(1)
  else:
    epsilon.append(1)
    gamma.append(0)


g = "".join(str(x) for x in gamma)
e = "".join(str(x) for x in epsilon)

part1 = int(g, 2)*int(e, 2)
print("Part1: ", part1)

# return most common number from arr on position
def mostCommon(pos, arr):
  one = 0
  zero = 0
  for x in arr:
    if x[pos] == 1:
      one += 1
    else: 
      zero += 1
  if one >= zero:
    return 1
  else:
    return 0

# calculate oxygen
res = file_arr
i = 0
while (len(res) > 1):
  common = mostCommon(i, res)
  new_table = []
  for l in res:
    if l[i] == common:
      new_table.append(l)
  i += 1
  res = new_table
  
o = int("".join(str(x) for x in res[0]),2)

# calculate co2
res = file_arr
i = 0
while (len(res) > 1):
  common = mostCommon(i, res)
  new_table = []
  for l in res:
    if l[i] != common:
      new_table.append(l)
  i += 1
  res = new_table
c = int("".join(str(x) for x in res[0]),2)

print("Part2: ", o*c)