defmodule Day14 do
  def solve(input, sec) do
    count(input, sec)
    
  end
  defp count([],_) do
    nil
  end
  defp count([line|lines], sec) do
    name = Regex.run(~r/^\w+/,line) |> Enum.at(0)
    [speed, fly, rest] = Regex.scan(~r/\d+/,line) |> Enum.map(fn [x] -> String.to_integer(x) end)
    IO.inspect "#{name}: #{distance(speed, fly, rest, sec, :fly, 0)}"
    count(lines, sec)
  end
  defp distance(_, _, _, 0, _, dist) do
    dist
  end
  defp distance(speed, fly, rest, sec, :fly, dist) do
    cond do
      fly > sec -> distance(speed, fly, rest, 0, :rest, dist + speed*sec)
      true -> distance(speed, fly, rest, sec - fly, :rest, dist + speed*fly)
    end
  end
  defp distance(speed, fly, rest, sec, :rest, dist) do
    cond do
      rest > sec -> distance(speed, fly, rest, 0, :fly, dist)
      true -> distance(speed, fly, rest, sec - rest, :fly, dist)
    end
  end
end
{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day14.solve(input,2503)