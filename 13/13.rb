INPUT = File.readlines('test.txt')

# y_len = INPUT.length
# x_len = INPUT.max.length

# table = Array.new(y_len) { Array.new(x_len, '')}
table = Array.new
arrays = Array.new
SYMBOLS = ['>', '^', '<', 'v']

INPUT.each_with_index do |line, y|
    table[y] = []
    line.split('').each_with_index do |e, x|
        if SYMBOLS.include? e
            arrays << { "x" => x, "y" => y, "s" => e, "l" => nil}
        end
        table[y][x] = e
    end
end

def right(s)
    SYMBOLS[SYMBOLS.find_index(s)-1]
end

def left(s)
    SYMBOLS[SYMBOLS.find_index(s)+1]
end

def run(table, arrays)
    bum = true

    while bum
        arrays.each do |a|
            p a
            t_x = a["x"]
            t_y = a["y"]
            if a["s"] == ">"
                t_x += 1
            elsif a["s"] == "<"
                t_x -= 1
            elsif a["s"] == "^"
                t_y -= 1
            else
                t_y += 1
            end
            if ["-", "|"].include? table[t_y][t_x]
                a["x"] = t_x 
                a["y"] = t_y
            elsif ["\\"].include? table[t_y][t_x]
                if [">", "<"].include? a["s"]
                    a["s"] = right(a["s"])
                else
                    a["s"] = left(a["s"])
                end
            elsif ["/"].include? table[t_y][t_x]
                if [">", "<"].include? a["s"]
                    a["s"] = left(a["s"])
                else
                    a["s"] = right(a["s"])
                end
            else
                if a["l"] == "left"
                    a["l"] = "straight"
                elsif a["l"] == "straight"
                    a["l"] = "right"
                    a["s"] = right(a["s"])
                else
                    a["l"] = "left"
                    a["s"] = left(a["s"])
                end
            end
        end
        bum = false
    end
end
p arrays
run table, arrays
p arrays