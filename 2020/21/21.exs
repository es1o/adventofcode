defmodule Day21 do
  def solve(input) do
    # IO.puts 'Solved!'
    # IO.inspect input
    food_and_alergen(input, %{}, [])
  end
  defp food_and_alergen([], fa, ing) do
    uniq_fa = Map.values(fa) |> List.flatten() |> Enum.uniq()
    uniq_ing = ing |> Enum.filter(fn x -> not Enum.member?(uniq_fa, x) end)
    IO.inspect "Part 1: #{Enum.count(uniq_ing)}"
    solve_fa(Map.to_list(fa), [])
  end
  defp food_and_alergen([i|input], fa, ing) do
    [f,a] = String.split(i, "(contains ")
    food = f |> String.split(" ", trim: true)
    alergen = a |> String.replace(")","") |> String.split(",", trim: true) |> Enum.map(&String.trim/1)
    {_, curr_fa} = Enum.map_reduce(alergen, %{}, fn x, acc -> {x, Map.put(acc, x, food)} end)
    new_fa = Map.merge(fa, curr_fa, fn _k, v1, v2 -> v1 -- (v1 -- v2) end)
    food_and_alergen(input, new_fa, ing ++ food)
  end
  defp solve_fa([], res) do
    IO.write "Part 2: "
    result = res |> Enum.sort |> Map.new
    Enum.each(result, fn {_, x} -> IO.write "#{x}," end)
  end
  defp solve_fa(fa, res) do
    new_res = Enum.filter(fa, fn {_,v} -> Enum.count(v) == 1 end) |> List.first
    {_, val} = new_res
    new_fa = Enum.map(fa, fn {k, v} -> {k, v -- val} end) |> Enum.filter(fn {_, v} -> Enum.count(v) > 0 end)
    solve_fa(new_fa, res ++ [new_res])
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day21.solve(input)
