defmodule Day6 do
  def solve(input) do
    check(input, 0)
  end
  defp check([], num) do
    num
  end
  defp check([l|list], num) do
    count = l |> String.split |> Enum.map(fn x -> String.graphemes(x) end) |> List.flatten |> Enum.uniq |> Enum.count
    check(list, num + count)
  end
end
defmodule Day6_2 do
  def solve(input) do
    check(input, 0)
  end
  defp check([], num) do
    num
  end
  defp check([l|list], num) do
    data = l |> String.split("\n", trim: true) 
    if (Enum.count(data) == 1) do
      count = l |> String.split |> Enum.map(fn x -> String.graphemes(x) end) |> List.flatten |> Enum.uniq |> Enum.count
      check(list, num + count)
    else
      maped = data |> Enum.map(fn x -> String.graphemes(x) end) |> Enum.sort(&(Enum.count(&1) < Enum.count(&2)))
      [f|rest] = maped
      {_,x} = Enum.map_reduce(rest, f, fn(a, acc) -> {a, common(a,acc)} end)
      count = Enum.count(x)
      check(list, num + count)
    end
  end
  defp common(l1, l2) do
    Enum.filter(l1, fn e -> Enum.member?(l2,e) end)
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split(~r/\n\n/, trim: true)
IO.inspect "Part 1: #{Day6.solve(input)}"
IO.inspect "Part 2: #{Day6_2.solve(input)}"
