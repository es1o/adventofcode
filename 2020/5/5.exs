defmodule Day5 do
  def solve(input) do
    solve_id(input, [])
  end
  defp solve2(ids) do
    Enum.sort(ids)
    # read the output and search. :D
    Enum.each(Enum.sort(ids), fn x -> IO.puts x end)
  end
  defp solve_id([], ids) do
    Enum.max(ids)
    # solve2(ids) # uncomment for part2 xD
  end
  defp solve_id([l|list], ids) do
    chars = l |> String.graphemes()
    row = Enum.slice(chars, 0..6)
    seat = Enum.slice(chars, 7..9)
    new_id = get_row_id(row, 0, 127) * 8 + get_row_id(seat, 0, 7)
    solve_id(list, ids ++ [new_id])
  end
  defp get_row_id([], min, max) do
    max
  end
  defp get_row_id([r|row], min, max) do
    cond do
      (r == "B" or r == "R") ->
        get_row_id(row, min + div(max - min,2) + 1, max)
      (r == "F" or r == "L")-> 
        get_row_id(row, min, min + div(max - min,2))
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect Day5.solve(input)
