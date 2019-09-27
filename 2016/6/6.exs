defmodule Day06 do
  
  def solve(input, chars) do
    check(input, chars)
  end
  defp check([], chars) do
    IO.puts "part1"
    Enum.each(chars, fn {_, x } -> 
      IO.inspect x |> Enum.reduce(%{}, fn(tag, acc) -> Map.update(acc, tag, 1, &(&1 + 1)) end)
                   |> Enum.map(&Tuple.to_list/1)
                   |> Enum.sort_by( fn [_, b] -> b end, &>=/2)
                   |> List.first
    end)
    IO.puts "part2"
    Enum.each(chars, fn {_, x } -> 
      IO.inspect x |> Enum.reduce(%{}, fn(tag, acc) -> Map.update(acc, tag, 1, &(&1 + 1)) end)
                   |> Enum.map(&Tuple.to_list/1)
                   |> Enum.sort_by( fn [_, b] -> b end, &<=/2)
                   |> List.first
    end)
  end
  defp check([line|lines], chars) do
    split_line = line |> String.graphemes() |> Enum.with_index
    check(lines, chars_to_map(split_line, chars))
  end
  defp chars_to_map([], map) do
    map
  end
  defp chars_to_map([char|chars],map) do
    {c, i} = char
    case Map.has_key?(map,i) do
      true -> chars_to_map(chars, Map.update(map, i, [], fn x -> x ++ [c] end))
      false -> chars_to_map(chars, Map.put(map, i, [c]))
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect Day06.solve(input, %{})