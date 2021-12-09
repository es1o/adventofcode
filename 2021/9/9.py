f = open("test.txt")
# f = open("input.txt")

arr = []
basins = []

def get_low(arr, x, y):
  if y > 0:
    if arr[x][y-1] > arr[x][y] < 9:
      return 1 + get_low(arr, x, y -1) 
  elif y < len(arr[x]) - 1:
    if arr[x][y+1] > arr[x][y] < 9:
      return 1 + get_low(arr, x, y +1) 
  if x > 0:
    if arr[x-1][y] > arr[x][y] < 9:
      return 1 + get_low(arr, x - 1, y) 
  elif x < len(arr) - 1:
    if arr[x+1][y] > arr[x][y] < 9:
      return 1 + get_low(arr, x+1, y -1) 
  return 0

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
    i = x
    basin = 0
    basin = get_low(arr, x, y)
    # while i > 0:
    #   if arr[i-1][y] == 9:
    #     break
    #   elif arr[i-1][y] > arr[i][y]:
    #     basin = basin + 1  
    #     i = i - 1
    #   else:
    #     break
    # i = x
    # while i < len(arr) - 2:
    #   if arr[i+1][y] == 9:
    #     break
    #   elif arr[i+1][y] > arr[i][y]:
    #     basin = basin + 1  
    #     i = i + 1
    #   else:
    #     break
    # i = y
    # while i > 0:
    #   if arr[x][i-1] == 9:
    #     break
    #   elif arr[x][i-1] > arr[x][y]:
    #     basin = basin + 1  
    #     i = i - 1
    #   else:
    #     break
    # while i < len(arr[x]) - 2:
    #   if arr[x][i+1] == 9:
    #     break
    #   elif arr[x][i+1] > arr[x][i]:
    #     basin = basin + 1  
    #     i = i + 1
    #   else:
    #     break
    print("min", arr[x][y])
    print("basin", basin)
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
