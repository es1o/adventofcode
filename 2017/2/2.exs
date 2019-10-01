defmodule Day02 do
    def solve([], sum, sum2) do
        %{:part1 => sum, :part2 => sum2}
    end

    def solve([line|lines], sum, sum2) do
        new_sum = Enum.max(line) - Enum.min(line)
        new_sum2 = check_divide(line)
        solve(lines, sum + new_sum, sum2 + new_sum2)
    end
    defp check_divide([]) do
        nil
    end
    defp check_divide([line|lines]) do
        x = Enum.filter(lines, fn x -> rem(x,line) == 0 || rem(line,x) == 0 end)
        if length(x) > 0 do
            if line > hd(x) do
                line/hd(x)
            else
                hd(x)/line
            end
        else
            check_divide(lines ++ [line])
        end
    end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) 
            |> Enum.map(fn x -> String.split(x, ~r/\s/, trim: true) end)
            |> Enum.map(fn x -> Enum.map(x, fn z -> String.to_integer(z) end) end)
IO.inspect Day02.solve(input,0, 0)