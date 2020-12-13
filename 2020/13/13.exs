defmodule Day13 do
  def solve(time, input) do
    buses = input |> Enum.at(0)
                  |> String.split(",", trim: true)
                  |> Enum.filter(fn x -> x != "x" end)
                  |> Enum.map(&String.to_integer/1)
    check(buses, time, 0, 100000)
  end

  defp check([], _, id, w) do
    id*w

  end

  defp check([b|buses], time, id, w) do
    new_w = abs(time - (b*ceil(time/b)))
    if (new_w < w) do
      check(buses, time, b, new_w)
    else
      check(buses, time, id, w)
    end

  end

  def solve2(input) do
    IO.puts 'Solved!'
    # IO.inspect time
    IO.inspect input
    buses = input |> Enum.at(0)
                  |> String.split(",", trim: true)
                  # |> Enum.filter(fn x -> x != "x" end)
                  |> Enum.map(fn x -> if (x != "x") do
                      String.to_integer(x)
                    else
                      x
                    end
                  end)
    IO.inspect buses 
    # check(buses, time, 0, 100000)
  end
  defp check2() do
    # tutaj trzeba uzyć chińskiego twierdzenia o resztach

    
  end

end

# {:ok, raw } = File.read('input.txt')
{:ok, raw } = File.read('test.txt')

[time | input] = raw |> String.split("\n", trim: true)
IO.inspect "Part 1: #{Day13.solve(String.to_integer(time), input)}"
Day13.solve2(input)
