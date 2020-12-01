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

defmodule Day1_2 do
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
    check3(list, num, sum, j)
    check(list, num, sum)
  end
  defp check3([], _, _, _) do
  end
  defp check3([k|list], num, sum, num2) do
    if (k + num + num2 == sum) do
      IO.puts "stop"
      IO.puts k*num*num2
      System.halt(0)
    else
      check3(list, num, sum, num2)
    end

  end

end
{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
# IO.puts Day1.solve(input, 2020)
IO.puts Day1_2.solve(input, 2020)
