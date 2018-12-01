start = 0
f_list = []
stop = true
data = File.read('input.txt')


while stop
    data.each_line do |l|
        start += l.to_i
        # p start
        if l.to_i == 135638
            p "ESIO ESIO ESIO"
        end
        if f_list.include? start
            p start
            stop = false
        else
            f_list << start
            # p f_list.size
            # p f_list.uniq.size
        end
    end
end
# p start