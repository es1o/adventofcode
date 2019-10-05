defmodule Day04 do
    def solve([], valid) do
        valid
    end

    def solve([line|lines], valid) do
        list = line |> String.split(" ", trim: true)
        uniq_size = list |> Enum.uniq |> Enum.count
        line_size = list |> Enum.count
        if uniq_size != line_size do 
            solve(lines, valid)
        else
            solve(lines, valid + 1)
        end
    end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) 

IO.inspect "Part1: #{Day04.solve(input,0)}"