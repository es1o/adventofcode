INPUT = File.read('input.txt').split('')

upstairs = INPUT.count {|x| x == "("}
downstairs = INPUT.count {|x| x == ")"}
p  "PART1: #{upstairs - downstairs}"

pos = 0
INPUT.each_with_index do |p, i|
    if p == ')'
        pos -= 1
        if pos < 0
            p "PART2: #{i + 1}"
            break
        end
    else
        pos += 1
    end
end