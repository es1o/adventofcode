defmodule Day6 do
  def solve([], orbits, map) do
    keys = Map.keys(map)
    p1 = iterate(keys, map, orbits)

    {_, santa_list} = check_orbits(map, "SAN", orbits, [])
    {_, you_list} = check_orbits(map, "YOU", orbits, [])
    p2 = length(santa_list -- you_list) + length(you_list -- santa_list)
    { p1, p2}
  end
  def solve(input, orbits, map) do
    [h|t] = input
    [o1, o2] = String.split(h, ")")
    new_map = Map.put(map, o2, o1)
    solve(t, orbits, new_map)
  end
  defp iterate([], _, orbits) do
    orbits
  end
  defp iterate(keys, map, orbits) do
    [h|t] = keys
    {new_orbits, _} = check_orbits(map, h, orbits,[])
    iterate(t, map, new_orbits)
  end
  defp check_orbits(map, p, orbits, list) do
    if Map.has_key?(map, p) do
      check_orbits(map, map[p], orbits + 1, list ++ [map[p]])
    else
      # IO.inspect list
      { orbits, list }
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
{p1, p2} = Day6.solve(input, 0, %{})
IO.inspect "part1: #{p1}"
IO.inspect "part2: #{p2}"
