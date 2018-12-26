start = 0
f_list = []
stop = true
data = File.read('input.txt')


while stop
    data.each_line do |l|
        start += l.to_i
        if f_list.include? start
            p start
            stop = false
            break
        else
            f_list << start
        end
    end
end