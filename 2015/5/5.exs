defmodule Day5 do
    def check([], num) do
        num
    end
    def check(input, num) do
        [word | tail] = input
        cond do
            not String.match?(word, ~r/(.)\1+/)                     -> check(tail, num)
            String.match?(word, ~r/(ab|cd|pq|xy)/)                  -> check(tail, num)
            String.match?(word, ~r/[aeiou]+.*[aeiou]+.*[aeiou]+.*/) -> check(tail, num + 1)
            true                                                    -> check(tail, num)
        end
    end
    def check2([], num) do
        num
    end
    def check2(input, num) do
        [word | tail] = input
        cond do
            not String.match?(word, ~r/(.)(.)\1/) -> check2(tail, num)
            String.match?(word, ~r/(.{2})(.*)\1/) -> check2(tail, num + 1)
            true                                  -> check2(tail, num)
        end
    end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
part1 = Day5.check(input, 0)
IO.puts "Part1: #{part1}"
part2 = Day5.check2(input, 0)
IO.puts "Part2: #{part2}"