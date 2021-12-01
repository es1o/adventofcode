f = open("input.txt")
# f = open("test.txt")

# part1
counter = 0
prev = 100000000
nums = []
for l in f:
  nums.append(int(l))
  if int(l) > prev:
    counter+=1
  prev = int(l)

print("part1:")
print(counter)

# part2
prev = 10000000000
counter = 0
for i in range(len(nums)-2):
  sum = nums[i] + nums[i+1] + nums[i+2]
  if sum > prev:
    counter+=1
  prev = sum

print("part2")
print(counter)
