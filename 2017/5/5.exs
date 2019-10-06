defmodule Day05 do
    def solve(_, pos, len, step) when pos >= len do
        step
    end

    def solve(list, pos, len, step) do
        jump = Enum.at(list, pos)
        new_list = List.update_at(list, pos, fn x -> x + 1 end)
        solve(new_list, pos + jump, len, step + 1)
    end
    def solve2(_, pos, len, step) when pos >= len do
        step
    end

    def solve2(list, pos, len, step) do
        jump = Enum.at(list, pos)
        new_list = if jump >= 3 do
            List.update_at(list, pos, fn x -> x - 1 end)
        else
            List.update_at(list, pos, fn x -> x + 1 end)
        end
        solve2(new_list, pos + jump, len, step + 1)
    end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(fn x -> String.to_integer(x) end)
size = length(input)

IO.inspect "part1: #{Day05.solve(input, 0, size, 0)}"
IO.inspect "part2: #{Day05.solve2(input, 0, size, 0)}"