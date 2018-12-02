require 'differ'

data = File.read('input2.txt')
data2 = data


data.each_line do |l|
    data.each_line do |m|
        lc = l.chars
        mc = m.chars
        diff = lc.zip(mc).count { |a, b| a != b }
        if diff == 1
            d = Differ.diff_by_char(lc.join, mc.join)
            p d
        end

    end
end