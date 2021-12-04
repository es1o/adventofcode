# f = open("test.txt")
f = open("input.txt")

x = f.read().split("\n\n")

numbers = list(map(int,x[0].split(",")))

bingo = x[1:]

bingos = []
# preare list of bingos
for b in bingo:
  bingos.append(list(map(int, b.split())))

def mark(num, bingos):
  for b in bingos:
    # print(b)
    for i in range(len(b)):
      # print(el)
      if b[i] == num:
        b[i] = "X"

def check(b):
  win = ['X', 'X', 'X', 'X', 'X']
  for i in range(5):
    if b[i:25:5] == win:
      return True
  for i in range(0, 20, 5):
    if b[i:i+5] == win:
      return True
  return False

def arr_sum(arr):
  sum = 0
  for i in arr:
    # print(i)
    if i != 'X':
      sum = sum + i
  return sum

finish = False
part1 = 0
for num in numbers:
  if not finish:
    # print(num)
    mark(num, bingos)

    for b in bingos:
      if check(b):
        # part1 = sum(b)
        part1 = num*arr_sum(b)
        finish = True

print("Part1: ", part1)

part2 = 0
last_win = []
last_win_num = 0

# get all numbers and save last win bingo. :)
for num in numbers:
  if len(bingos) > 0:
    # print(num)
    mark(num, bingos)

    for b in bingos:
      if check(b):
        last_win = b
        last_win_num = num
        bingos.remove(b)
  else:
    part2 = last_win_num*(arr_sum(last_win))

print("Part2: ", part2)