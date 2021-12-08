f = open("test.txt")
# f = open("test2.txt")
# f = open("input.txt")

one = ['c', 'f']
four = ['b', 'c', 'd', 'f']
seven = ['a', 'c', 'f']
eight = ['a', 'b', 'c', 'd', 'e', 'f', 'g']


digits = [one, four, seven, eight]
part1 = 0

def check1(o):
  o.sort()
  for d in digits:
    if len(o) == len(d):
      return 1
  return 0

# use unique signal patterns to get the display configuration
def check2(s):
  disp = [0,0,0,0,0,0,0]
  s = sorted(s, key=len)
  print(s)
  for digit in s:
    if len(digit) == 2:
      d = list(digit)
      d.sort()
      disp[1] = d[0]
      disp[2] = d[1]
    elif len(digit) == 3:
      d = list(digit)
      d.sort()
      x = list(set(d) - set(disp))
      disp[0] = x[0]
    elif len(digit) == 4:
      d = list(digit)
      d.sort()
      print(d)
      print(disp)
      x = list(set(d) - set(disp))
      x.sort()
      # print("Esio")
      if x != []:
        # disp[6] = d[2]
        # disp[5] = d[3]
        disp[5] = x[0]
        disp[6] = x[1]
      print(disp)
    elif len(digit) == 7:
      d = list(digit)
      d.sort()
      # print(d)
      # print("disp:", disp)
      x = list(set(d) - set(disp))
      x.sort()
      # print("xd:", x)
      # print(x)
      # print("Esio")
      if x != []:
        # disp[6] = d[2]
        # disp[5] = d[3]
        disp[3] = x[0]
        disp[4] = x[1]
      # disp[3] = d[2]
      # disp[4] = d[6]
  return disp

def get_digit(display):
  if display == [0,2,3,5,6]:
    return 5
  elif display == [0,1,2,3,5]:
    return 3
  elif display == [0,1,3,4,5]:
    return 2
  elif display == [0,2,3,4,5,6]:
    return 6
  elif display == [0,1,2,3,5,6]:
    return 9
  elif len(display) == 7:
    return 8
  elif len(display) == 2:
    return 1
  elif len(display) == 3:
    return 7
  elif len(display) == 4:
    return 4
  else:
    return 0

def decode(signal, disp):
  s = list(signal)
  # s.sort()
  # print(signal)
  pos = []
  for el in s:
    pos.append(disp.index(el))
  pos.sort()
  # print(pos)
  # print(get_digit(pos))
  return get_digit(pos)



part2 = 0
for l in f.readlines():
  one_line = []
  signal, output = l.split('|')
  # for o in output.split():
  #   part1 += check1(list(o))
  # print(output)
  # print(signal)
  splitted = signal.split()
  # for s in splitted:
  #   check2(list(s))
  disp = check2(splitted)
  print(disp)

  for o in output.split():
    one_line.append(decode(o, disp))
  print(one_line)
  s = map(str, one_line)
  s = ''.join(s)
  s = int(s)
  part2 += s



print("Part 1:", part1)
print("Part 2:", part2)
