# f = open("test.txt")
f = open("input.txt")

arr = []

def get_adjacent(arr, x, y):
  result = []
  # print("XXXX", arr[x][y])
  if y > 0 and y < len(arr[x]) - 1:
    result.append(arr[x][y-1])
    result.append(arr[x][y+1])
  elif y == 0 and y <len(arr[x]) - 1:
    result.append(arr[x][y+1])
  elif y > 0 and y == len(arr[x]) - 1:
    result.append(arr[x][y-1])
  if x > 0 and x < len(arr) - 1:
    result.append(arr[x-1][y])
    result.append(arr[x+1][y])
  elif x == 0 and x < len(arr) - 1:
    result.append(arr[x+1][y])
  elif x > 0 and x == len(arr) - 1:
    result.append(arr[x-1][y])
  # print(result)
  if min(result) > arr[x][y]:
    # print("ESIO")
    return arr[x][y] + 1
  else:
    return 0


for i in f.readlines():
  i = i.strip()
  arr.append(list(map(int, list(i))))

print(arr[0][5])
print(arr[0][6])

res = 0
for x in range(len(arr)):
  # print("y", x)
  # print("x", len(arr[x]))
  for y in range(len(arr[x])):
    # print(x,y)
    res = res + get_adjacent(arr, x, y)
    # print("res", res)
# get_adjacent(arr, 2, 3)
# get_adjacent(arr, 4, 2)

print("Part1:", res)
