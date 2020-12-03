defmodule Day3 do
  def solve(input, r, d) do
    map = input |> Enum.map(fn x -> String.split(x, "", trim: true) end)
    width = map |> Enum.at(0) |> Enum.count
    height = map |> Enum.count
    check(map, 0, 0, 0, width, height, r, d)
  end
  defp check(input, x, y, trees, width, height, r, d) do
    if (y >= height) do
      trees
    else
      if (get_pos(input, x, y, width)) do
        check(input, x + r, y + d, trees + 1, width, height, r, d)
      else
        check(input, x + r, y + d, trees, width, height, r, d)
      end
    end
  end
  defp get_pos(input, x, y, width) do
    pos = input |> Enum.at(y) |> Enum.at(rem(x, width)) 
    if (pos == "#") do
      true
    else
      false
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect "Part1: #{Day3.solve(input, 3, 1)}"
part2 = Day3.solve(input, 1, 1) * Day3.solve(input, 3, 1) * Day3.solve(input, 5, 1) * Day3.solve(input, 7, 1) *Day3.solve(input, 1, 2)
IO.inspect "Part2: #{part2}"
