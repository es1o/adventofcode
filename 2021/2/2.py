import re
# f = open("input.txt")
f = open("test.txt")

# part1
h = 0
d = 0
for l in f:
  line = l.split()
  if re.search("^forward.*", line[0]):
    d = d + int(line[1])
  elif re.search("^down.*", line[0]):
    h = h + int(line[1])
  elif re.search("^up.*", line[0]):
    h = h - int(line[1])

print("part1:")
print(h*d)

# part2
f = open("input.txt")
# f = open("test.txt")
h = 0
d = 0
a = 0
for l in f:
  line = l.split()
  if re.search("^forward.*", line[0]):
    h = h + int(line[1])
    d = d + a*int(line[1])
  elif re.search("^down.*", line[0]):
    a = a + int(line[1])
  elif re.search("^up.*", line[0]):
    a = a - int(line[1])

print("part2:")
print(h*d)
