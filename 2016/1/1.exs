defmodule Day01 do
  def solve(input) do
    pos = %{:x => 0, :y => 0}
    dir = "n"
    [head | tail] = input
    solve_r(head, tail, pos, dir)
  end
  def solve_r(head, [], pos, dir) do
    {pos, _} = position(pos, head, dir)
    IO.inspect distance(pos)
  end
  def solve_r(head, tail, pos, dir) do
    {new_pos, new_dir} = position(pos, head, dir)
    [head | tail] = tail
    solve_r(head, tail, new_pos, new_dir)
  end
  def position(pos, mov, dir ) do
    [x] = Regex.run(~r/R|L/,mov)
    [t_str] = Regex.run(~r/\d+/,mov)
    { t, _} = Integer.parse(t_str)
    directions = ["n", "e", "s", "w"]
    dir_pos = Enum.find_index(directions, fn x -> x == dir end)
    {:ok, new_dir} = case x do
      "L"  -> if dir_pos == 0 do
                {:ok, "w"}
              else
                Enum.fetch(directions, dir_pos - 1 )
              end
      "R"  -> if dir_pos == 3 do
                {:ok, "n"}
              else
                Enum.fetch(directions, dir_pos + 1 )
              end
    end
    pos = case new_dir do
       "n" -> Map.update!(pos, :y, &(&1 = &1 + t))
       "e" -> Map.update!(pos, :x, &(&1 = &1 + t))
       "s" -> Map.update!(pos, :y, &(&1 = &1 - t))
       _   -> Map.update!(pos, :x, &(&1 = &1 - t))
    end
    { pos, new_dir }
  end
  defp distance(pos) do
    abs(pos[:x]) + abs(pos[:y])
  end
end
{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split(",", trim: true) |> Enum.map(&String.trim/1)
Day01.solve(input)