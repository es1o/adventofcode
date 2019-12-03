defmodule Day3 do
  def solve(w1,w2,map,cross) do
    w1_map = wire_path(w1, map, 0, 0)
    w2_map = wire_path(w2, map, 0, 0)
    intersect = (w1_map -- (w1_map -- w2_map)) -- [{0,0}]
    IO.inspect distance(intersect, [])
  end
  defp distance([], distances) do
    Enum.sort(distances) |> List.first()
  end
  defp distance(list, distances) do
    [h|t] = list
    {x, y} = h
    # IO.puts x
    # IO.puts y
    dist = abs(x) + abs(y)
    distance(t, distances ++ [dist])
  end
  defp wire_path([], map, _, _) do
    map
  end
  defp wire_path(wire, map, x, y) do
    [h|t] = wire
    [dist] = Regex.run(~r/\d+/, h) |> Enum.map(&String.to_integer/1)
    [dir] = Regex.run(~r/[U|R|D|L]/,h)
    {new_map, new_x, new_y} = fill_map(map, x, y, dist, dir)
    wire_path(t, new_map, new_x, new_y)
  end
  defp fill_map(map, x, y, 0, _) do
    {map, x, y}
  end
  defp fill_map(map, x, y, dist, dir ) do
    case dir do
      "U" -> fill_map(map ++ [{x,y}], x + 1, y, dist - 1, dir )
      "D" -> fill_map(map ++ [{x,y}], x - 1, y, dist - 1, dir )
      "R" -> fill_map(map ++ [{x,y}], x, y + 1, dist - 1, dir )
      "L" -> fill_map(map ++ [{x,y}], x, y - 1, dist - 1, dir )
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

[one, two] = raw |> String.split("\n", trim: true)
wire1 = one |> String.split(",", trim: true)
wire2 = two |> String.split(",", trim: true)
Day3.solve(wire1, wire2, [], [])
