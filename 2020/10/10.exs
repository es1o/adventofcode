defmodule Day10 do
  def solve(input) do
    solution(input, 1, 0, 1, 0)
  end
  defp solution([_|[]], one, _, three, _) do
    one * three
  end
  defp solution([i|input], one, two, three, sum) do
    next = Enum.at(input,0)
    cond do
      (next - i == 1)  -> solution(input, one + 1, two, three, sum)
      (next - i == 2)  -> solution(input, one, two + 1, three, sum)
      (next - i == 3)  -> solution(input, one, two, three + 1, sum)
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.sort
IO.inspect "Part 1: #{Day10.solve(input)}"
