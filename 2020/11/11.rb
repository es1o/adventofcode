require 'pp'
def create_array(data)
  arr = []
  puts data.size
  data.each_with_index do |i, k|
    arr[k] = i.grapheme_clusters
  end
  return arr
end

def check_nb(arr, x, y)
  nb = []
  for a in x-1..x+1 do
    for b in y-1..y+1 do
      if not ((a == x) and (b == y))
        if not ((a < 0) or (b < 0) or (a >= arr.size) or (b >= arr.size))
          # puts "#{a}:#{b}"
          nb << arr[a][b]
        end
      end
    end
  end
  return nb
end

def create_new_array(arr)
  new_arr = Array.new(arr.size) {Array.new(arr[0].size,nil)}
  arr.each_with_index do |i, k|
    i.each_with_index do |j, l|
      case arr[k][l]
      when "L"
        nb = check_nb(arr, k, l)
        if (nb.count("#") == 0)
          new_arr[k][l] = "#"
        else
          new_arr[k][l] = "L"
        end
      when "#"
        nb = check_nb(arr, k, l)
        if (nb.count("#") >= 4)
          new_arr[k][l] = "L"
        else
          new_arr[k][l] = "#"
        end
      else
        new_arr[k][l] = arr[k][l]
      end
    end
  end
  return new_arr
end


# data = File.readlines('test.txt')
data = File.readlines('input.txt')

# puts data[0]
x = create_array(data)
y = create_new_array(x)
pp x
pp y

while x != y
  tmp = x
  x = y
  y = create_new_array(x)
end
p "esio"
pp x
pp y
count = 0
y.each do |l|
  count = count + l.count("#")
end
p count