defmodule Day9 do
  def solve(input) do
    check(input, 25)
  end
  defp check([], _) do

  end
  defp check(input, p) do
    preamble = Enum.slice(input, 1..p-1)
    num = Enum.at(input, p)
    if x = is_sum(preamble, num, [Enum.at(input,0)]) do
      x
    else
      check(Enum.drop(input, 1), p)
    end
  end
  defp is_sum([], number, _) do
    number
  end
  defp is_sum([el|preamble], number, sums) do
    if Enum.member?(sums, number - el) do
      false
    else
      is_sum(preamble, number, sums ++ [el])
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
IO.inspect "Part 1: #{Day9.solve(input)}"
