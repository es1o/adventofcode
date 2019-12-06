defmodule Day6 do
  def solve([], orbits, map) do
    keys = Map.keys(map)
    iterate(keys, map, orbits)
  end
  def solve(input, orbits, map) do
    [h|t] = input
    [o1, o2] = String.split(h, ")")
    new_map = Map.put(map, o2, o1)
    solve(t, orbits, new_map)
  end
  defp iterate([], map, orbits) do
    orbits
  end
  defp iterate(keys, map, orbits) do
    [h|t] = keys
    new_orbits = check_orbits(map, h, orbits)
    iterate(t, map, new_orbits)
  end
  defp check_orbits(map, p, orbits) do
    if Map.has_key?(map, p) do
      check_orbits(map, map[p], orbits + 1)
    else
      orbits
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect "part1: #{Day6.solve(input, 0, %{})}"
