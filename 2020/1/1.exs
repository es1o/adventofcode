defmodule Day1 do
  def solve(input, sum) do
    filtered = Enum.filter(input, fn x -> x <= sum end)
    solve2(filtered, sum)
  end

  defp solve2([], _) do
  end

  defp solve2([i|list], sum) do
    check(list, i, sum)
    solve2(list, sum)
  end

  defp check([], _, _) do
  end

  defp check([j|list], num, sum) do
    if (j + num == sum) do
      IO.puts "stop"
      IO.puts j*num
    else
      check(list, num, sum)
    end
  end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
IO.puts Day1.solve(input, 2020)
