defmodule Day9 do
  def solve(input) do
    check(input, 25)
  end
  def solve2(input, p) do
    num = check(input, p)
    solve_rec(input, num)

  end
  defp solve_rec(list, target) do
    if not (check_sum(Enum.drop(list,1), Enum.at(list,0), target, [Enum.at(list,0)])) do
      solve_rec(Enum.drop(list, 1), target)
    end

  end
  defp check_sum([], _, _, _) do
    false
  end

  defp check_sum([l|list], sum, target, sum_list) do
    if (sum == target) do
        IO.inspect Enum.min(sum_list) + Enum.max(sum_list)
        true
    else
      if sum < target do
        check_sum(list, sum + l, target, sum_list ++ [l])
      else
        false
      end
    end
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
Day9.solve2(input, 25)
