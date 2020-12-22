defmodule Day22 do
  def solve([p1, p2]) do
    IO.puts 'Solved!'
    # IO.inspect input
    # [p1, p2] = input
    player1 = p1 |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
    player2 = p2 |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
    fight(player1, player2)
  end
  defp fight([], p) do
    IO.puts "p2 win"
    # IO.inspect p
    calculate_score(p)
  end
  defp fight(p, []) do
    IO.puts "p1 win"
    calculate_score(p)
  end
  # defp fight([c1|p1], [c2,p2]) do
  defp fight([c1|p1], [c2|p2]) do
    # IO.inspect c1
    # IO.inspect c2
    cond do
      c1 > c2 -> fight(p1 ++ [c1 , c2], p2)
      c1 < c2 -> fight(p1, p2 ++ [c2,c1])
    end
  end
  defp calculate_score(s) do
    {sum,_} = s |> Enum.map_reduce(Enum.count(s), fn x, acc -> {[x*acc], acc - 1 } end)
    sum |> List.flatten |> Enum.sum

  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.replace(~r/Player (1|2):/,"") |>String.split("\n\n", trim: true)
IO.inspect "Part 1: #{Day22.solve(input)}"
