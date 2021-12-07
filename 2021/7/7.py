import statistics

# f = open("test.txt")
f = open("input.txt")
c = list(map(int,f.read().split(",")))

# print(c)
median = int(statistics.median(c))

fuel = 0

for i in c:
	fuel = fuel + abs(i - median)

print("Part1: ", fuel)

avg = int(round(statistics.mean(c)))

# check AVG
fuel = 0
for i in c:
  steps = abs(i - avg)
  for f in range(steps+1):
    fuel = fuel + f

# check AVG - 1
avg = avg - 1
fuel1 = 0
for i in c:
  steps = abs(i - avg)
  # print("steps:", steps)
  for f in range(steps+1):
    # print(fuel)
    fuel1 = fuel1 + f

if fuel1 < fuel:
  fuel = fuel1

print("Part2: ", fuel)
