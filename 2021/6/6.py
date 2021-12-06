# f = open("test.txt")
f = open("input.txt")

fish = list(map(int,f.read().split(",")))

def lt(fish):
  app = []
  for i in range(len(fish)):
    if fish[i] == 0:
      fish[i] = 6
      app.append(8)
    else:
      fish[i] = fish[i] - 1
  if app != []:
    fish.extend(app)

for i in range(256):
  lt(fish)
    
print(len(fish))