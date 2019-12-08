defmodule Day8 do
  def solve([], _, sum) do
    sum
  end
  def solve(input, zeros, sum) do
    [h|t] = input
    new_zeros = Enum.count(h, fn x -> x == 0 end)
    if new_zeros < zeros do
      new_sum = Enum.count(h, fn x -> x == 1 end) * Enum.count(h, fn x -> x == 2 end)
      solve(t, new_zeros, new_sum)
    else
      solve(t, zeros, sum)
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

x = 25
y = 6
input = raw |> String.split("", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.chunk_every(x*y)
IO.inspect "Day 9 - part 1: #{Day8.solve(input, x*y + 1, 0)}"
