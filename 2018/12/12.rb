require 'set'

def solve(arr)
    arr.each_with_index.map do |x, i|
        pattern = ((i-2)..(i+2))
            .map{ |idx| idx >= 0 ? arr.fetch(idx, '.') : '.' }
            .join
        has = INPUT.include? pattern
        has ? '#' : '.'
    end
end

def calc_score arr
    arr.each_with_index
        .select{ |c, i| c == '#' }
        .map{ |c, i| i - BUF.size }
        .sum
end

# INPUT = File.readlines('test.txt')
INPUT = File.readlines('data.txt')
INPUT.delete("\n")

BUF = '.' * 300

DATA = INPUT
    .first
    .scan(/[\.#]/)
    .join
    .yield_self{ |s| "#{BUF}#{s}#{BUF}" }
    .each_char
    .to_a
    .freeze

INPUT.each do |x|
    x.gsub!(/\n|( => #\n)|((#|\.){5} => \.)|(^initial state: (#|\.)*)/, '')
end
p INPUT



def part1 arr
    50000000000.times do |i|
    #20.times do |i|
        p i
        arr = solve arr
    end
    p calc_score arr
end

part1 DATA