# f = open("test.txt")
f = open("input.txt")


part1 = 0
part2 = 0

missing = []

for l in f.readlines():
  incomplete = True
  c = list(l.strip())
  chunks = [c[0]]
  del(c[0])
  for i in c:
    if i == '(':
      chunks.append(i)
    elif i == '[':
      chunks.append(i)
    elif i == '{':
      chunks.append(i)
    elif i == '<':
      chunks.append(i)
    # CLOSE
    elif i == ')':
      if chunks.pop() != '(':
        part1 += 3
        incomplete = False
        break
    elif i == ']':
      if chunks.pop() != '[':
        part1 += 57
        incomplete = False
        break
    elif i == '}':
      if chunks.pop() != '{':
        part1 += 1197
        incomplete = False
        break
    elif i == '>':
      if chunks.pop() != '<':
        part1 += 25137
        incomplete = False
        break
  # complete incompletes :)
  if len(chunks) > 0 and incomplete == True:
    completion = []
    for x in reversed(chunks):
      if x == '(':
        completion.append(')')
      elif x == '[':
        completion.append(']')
      elif x == '{':
        completion.append('}')
      elif x == '<':
        completion.append('>')
    missing.append(completion)

print("Part1", part1)

def part2(arr):
  scores = []
  for a in arr:
    line_score = 0
    for i in a:
      if i == ')':
        line_score = line_score*5 + 1
      elif i == ']':
        line_score = line_score*5 + 2
      elif i == '}':
        line_score = line_score*5 + 3
      elif i == '>':
        line_score = line_score*5 + 4
    scores.append(line_score)
  scores.sort()

  print("Part2", scores[int(len(scores)/2)])

part2(missing)
