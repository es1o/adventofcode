data = File.read('input.txt')

two = 0 
three = 0

data.each_line do |l|
    sorted = l.chars.sort
    if_two = sorted.select { |e| sorted.count(e) == 2 }
    if_three = sorted.select { |e| sorted.count(e) == 3 }
    if if_two.length > 0 
        two = two + 1
    end
    if if_three.length > 0
        three = three + 1
    end
end

p two*three