defmodule Day21 do
  def solve(input) do
    # IO.puts 'Solved!'
    # IO.inspect input
    food_and_alergen(input, %{}, [])
  end
  defp food_and_alergen([], fa, ing) do
    # IO.puts "final"
    uniq_fa = Map.values(fa) |> List.flatten() |> Enum.uniq()
    # uniq_ing = ing |> Enum.uniq()
    uniq_ing = ing |> Enum.filter(fn x -> not Enum.member?(uniq_fa, x) end)
    IO.inspect "Part 1: #{Enum.count(uniq_ing)}"
    # IO.inspect fa
  end
  defp food_and_alergen([i|input], fa, ing) do
    # IO.inspect i
    [f,a] = String.split(i, "(contains ")
    food = f |> String.split(" ", trim: true)
    alergen = a |> String.replace(")","") |> String.split(",", trim: true) |> Enum.map(&String.trim/1)
    # IO.inspect alergen
    {_, curr_fa} = Enum.map_reduce(alergen, %{}, fn x, acc -> {x, Map.put(acc, x, food)} end)
    # IO.inspect z
    # new_fa = Map.merge(fa, curr_fa, fn _k, v1, v2 -> [v1, v2] end)
    new_fa = Map.merge(fa, curr_fa, fn _k, v1, v2 -> v1 -- (v1 -- v2) end)
    # IO.inspect new_fa
    food_and_alergen(input, new_fa, ing ++ food)
  end
end

# {:ok, raw } = File.read('input.txt')
{:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day21.solve(input)
