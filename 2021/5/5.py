import copy
# f = open("test.txt")
f = open("input.txt")

rows, cols = (1500,1500)

arr1 = []
for x in range(rows):
   column_elements=[]
   for y in range(cols):
       column_elements.append(0)
   arr1.append(column_elements)
arr2 = copy.deepcopy(arr1)

def update_arr(arr, x1, y1, x2, y2):
  if (x1 != x2 ) and (y1 != y2):
    pass
  elif x1 < x2:
    i = x1
    while i <= x2:
      arr[y1][i] = arr[y1][i] + 1
      i += 1
  elif x1 > x2:
    i = x1
    while i >= x2:
      # arr[i][y1] = arr[i][y1] + 1 
      arr[y1][i] = arr[y1][i] + 1
      i -= 1
  elif y1 > y2:
    i = y1
    while i >= y2:
      arr[i][x1] = arr[i][x1] + 1
      i -= 1
  elif y1 < y2:
    i = y1
    while i <= y2:
      arr[i][x1] = arr[i][x1] + 1
      i += 1

def update_arr2(arr, x1, y1, x2, y2):
  if (x1 != x2 ) and (y1 != y2):
    cx = 1
    cy = 1
    if x2 < x1:
      cx = -1
    if y2 < y1:
      cy = -1
    for x, y in zip(range(x1, x2, cx), range(y1, y2, cy)):
      arr[y][x] = arr[y][x] + 1
  elif x1 < x2:
    i = x1
    while i <= x2:
      arr[y1][i] = arr[y1][i] + 1
      i += 1
  elif x1 > x2:
    i = x1
    while i >= x2:
      arr[y1][i] = arr[y1][i] + 1
      i -= 1
  elif y1 > y2:
    i = y1
    while i >= y2:
      arr[i][x1] = arr[i][x1] + 1
      i -= 1
  elif y1 < y2:
    i = y1
    while i <= y2:
      arr[i][x1] = arr[i][x1] + 1
      i += 1

def get_overlap(arr):
  p = 0
  for x in arr:
    for y in x:
      if y > 1:
        p += 1
  return p
  

for l in f:
  # print(l)
  [start, stop] = l.split(" -> ")
  x1,y1 = start.split(",")
  x2,y2 = stop.split(",")
  update_arr(arr1, int(x1), int(y1), int(x2), int(y2))
  update_arr2(arr2, int(x1), int(y1), int(x2), int(y2))


print("Part1:", get_overlap(arr1))
print("Part2:", get_overlap(arr2))