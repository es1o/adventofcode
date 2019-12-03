defmodule Day3 do
  def solve(w1,w2,map) do
    w1_raw_map = wire_path(w1, map, 0, 0, 0)
    w2_raw_map = wire_path(w2, map, 0, 0, 0)
    w1_map = Enum.map(w1_raw_map, fn {a,b,_} -> {a,b,0} end )
    w2_map = Enum.map(w2_raw_map, fn {a,b,_} -> {a,b,0} end )
    intersect = (w1_map -- (w1_map -- w2_map)) -- [{0,0,0}]
    IO.inspect "part1: #{distance(intersect, [])}"
    IO.inspect "part2: #{wire_len(intersect, [], w1_raw_map, w2_raw_map)}"
  end
  defp wire_len([], len, _, _) do
    Enum.sort(len) |> List.first()
  end
  defp wire_len(list, len, w1, w2) do
    [h|t] = list
    {a,b,_} = h
    {_, _, w1_dist} = Enum.find(w1, fn {x,y,_} -> x == a and y == b end )
    {_, _, w2_dist} = Enum.find(w2, fn {x,y,_} -> x == a and y == b end )
    wire_len(t, len ++ [w1_dist + w2_dist], w1, w2)
  end
  defp distance([], distances) do
    Enum.sort(distances) |> List.first()
  end
  defp distance(list, distances) do
    [h|t] = list
    {x, y, _} = h
    dist = abs(x) + abs(y)
    distance(t, distances ++ [dist])
  end
  defp wire_path([], map, _, _, _) do
    map
  end
  defp wire_path(wire, map, x, y, traveled) do
    [h|t] = wire
    [dist] = Regex.run(~r/\d+/, h) |> Enum.map(&String.to_integer/1)
    [dir] = Regex.run(~r/[U|R|D|L]/,h)
    {new_map, new_x, new_y, new_traveled} = fill_map(map, x, y, dist, dir, traveled)
    wire_path(t, new_map, new_x, new_y, new_traveled)
  end
  defp fill_map(map, x, y, 0, _, traveled) do
    {map, x, y, traveled}
  end
  defp fill_map(map, x, y, dist, dir, traveled ) do
    case dir do
      "U" -> fill_map(map ++ [{x,y, traveled}], x + 1, y, dist - 1, dir, traveled + 1 )
      "D" -> fill_map(map ++ [{x,y, traveled}], x - 1, y, dist - 1, dir, traveled + 1 )
      "R" -> fill_map(map ++ [{x,y, traveled}], x, y + 1, dist - 1, dir, traveled + 1 )
      "L" -> fill_map(map ++ [{x,y, traveled}], x, y - 1, dist - 1, dir, traveled + 1 )
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

[one, two] = raw |> String.split("\n", trim: true)
wire1 = one |> String.split(",", trim: true)
wire2 = two |> String.split(",", trim: true)
Day3.solve(wire1, wire2, [])
