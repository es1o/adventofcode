# input = File.read('input.txt')
input = File.readlines('test.txt').map{|x| x.gsub("\n",'')}.map{|y| y.split(',')}

p input

def manhattan(p1, p2)
    (p1[0] - p2[0]).abs + (p1[1] - p2[1]).abs
end

def find_infinite(array)
    max_x = array.max_by{ |x| x[0] }[0]
    max_y = array.max_by{ |y| y[1] }[1]
    p max_x
    p max_y
    infinites = Array.new
    array.each do |x|
        if x[0] == 0 or
                x[1] == 0 or
                x[0] == max_x or
                x[1] == max_y
            infinites << x
        end
    end
    infinites
end

p input - find_infinite(input)