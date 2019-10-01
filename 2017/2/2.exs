defmodule Day02 do
    def solve([], sum) do
        sum
    end

    def solve([line|lines], sum) do
        new_sum = Enum.max(line) - Enum.min(line)
        solve(lines, sum + new_sum)
    end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) 
            |> Enum.map(fn x -> String.split(x, ~r/\s/, trim: true) end)
            |> Enum.map(fn x -> Enum.map(x, fn z -> String.to_integer(z) end) end)
IO.inspect Day02.solve(input,0)