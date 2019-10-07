defmodule Day06 do
    def solve(table, history, step, len) do
        max = Enum.max(table)
        max_i = Enum.find_index(table, fn x -> x == max end)
        new_table = List.update_at(table, max_i, fn _ -> 0 end)
        result = distribute(new_table, max, len, max_i + 1)
        if Enum.member?(history, result) do
            step
        else
            solve(result,history ++ [result],step + 1, len)
        end
        
    end
    defp distribute(list, 0, _, _) do
        list
    end
    defp distribute(list, banks, len, pos) do
        position = if pos == len do
            0
        else
            pos
        end
        new_list = List.update_at(list, position, fn x -> x + 1 end)
        distribute(new_list, banks - 1, len, position + 1)
        
    end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\t", trim: true) |> Enum.map(fn x -> String.to_integer(x) end)

IO.inspect input
IO.inspect "part1: #{Day06.solve(input, [], 1, length(input))}"