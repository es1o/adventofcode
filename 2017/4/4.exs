defmodule Day04 do
    def solve([], valid, valid2,part) do
        case part do
            :part1 -> valid
            :part2 -> valid2
        end
    end

    def solve([line|lines], valid, valid2, part) do
        list = line |> String.split(" ", trim: true)
        case part do
            :part1 ->
                uniq_size = list |> Enum.uniq |> Enum.count
                line_size = list |> Enum.count
                if uniq_size != line_size do 
                    solve(lines, valid, valid2,part)
                else
                    solve(lines, valid + 1,valid2,part)
                end

            :part2 ->
                chars_list = list |> Enum.map(fn x -> String.graphemes(x) end) |> Enum.map(fn z -> Enum.sort(z) end)
                uniq_chars_size = chars_list |> Enum.uniq |> Enum.count
                chars_size = chars_list |> Enum.count
                if uniq_chars_size != chars_size do 
                    solve(lines, valid, valid2,part)
                else
                    solve(lines, valid,valid2 + 1,part)
                end
        end
    end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) 

IO.inspect "Part1: #{Day04.solve(input,0,0,:part1)}"
IO.inspect "Part2: #{Day04.solve(input,0,0,:part2)}"