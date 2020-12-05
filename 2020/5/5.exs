defmodule Day5 do
  def solve(input) do
    # IO.puts 'Solved!'
    # IO.inspect input
    solve_id(input, [])
  end
  defp solve_id([], ids) do
    Enum.max(ids)
  end
  defp solve_id([l|list], ids) do
    chars = l |> String.graphemes()
    row = Enum.slice(chars, 0..6)
    seat = Enum.slice(chars, 7..9)
    # IO.inspect seat
    new_id = get_row_id(row, 0, 127) * 8 + get_row_id(seat, 0, 7)
    # get_seat_id()
    solve_id(list, ids ++ [new_id])
  end
  defp get_row_id([], min, max) do
    # IO.inspect min
    # IO.inspect max
    max
  end
  defp get_row_id([r|row], min, max) do
    # IO.inspect min
    # IO.inspect max
    # IO.inspect r
    # IO.puts "esio"
    cond do
      (r == "B" or r == "R") ->
        get_row_id(row, min + div(max - min,2) + 1, max)
      (r == "F" or r == "L")-> 
        get_row_id(row, min, min + div(max - min,2))
    end
    # get_row_id(row, id)
    
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect Day5.solve(input)
