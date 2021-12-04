# f = open("test.txt")
f = open("input.txt")

x = f.read().split("\n\n")

numbers = list(map(int,x[0].split(",")))

bingo = x[1:]

print(numbers)
# print("dsdsad")
# print(bingo)
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

# print(bingos)
# check(bingos[0])
print(part1)
# print(num)

finish = False
part2 = 0
for num in numbers:
  if not finish:
    if len(bingos) > 1:
      # print(num)
      mark(num, bingos)

      for b in bingos:
        if check(b):
          # part1 = sum(b)
          # part2 = num*arr_sum(b)
          # finish = True
          print("REMOVE")
          print(b)
          bingos.remove(b)
          print(bingos)
          print("REMOVE END")
    else:
      print("FINISH")
      print(num)
      part2 = num*(arr_sum(bingos[0]))
      # part2 = arr_sum(bingos[0]) - num
      finish = True
      # part2 = bingos[0]

print(part2)