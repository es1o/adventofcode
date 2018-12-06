# input = File.read('input.txt')
input = File.readlines('test.txt').map{|x| x.gsub("\n",'')}.map{|y| y.split(',')}

p input

def manhattan(p1, p2)
    (p1[0] - p2[0]).abs + (p1[1] - p2[1]).abs
end

def find_infinite(array, max_x, max_y)
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
def find_near(points, x, y)
    distances = []
    points.each_with_index do |p, i
end

def max_region(data)
    max_x = data.max_by{ |x| x[0] }[0].to_i
    max_y = data.max_by{ |y| y[1] }[1].to_i
    grid = {}
    pt_idx_counts = {}
    (0..max_x).each do |x|
        (0..max_y).each do |y|
            p "#{x}:#{y}"
        end
    end
    # find_infinite(data, max_x, max_y)

end

p max_region(input)