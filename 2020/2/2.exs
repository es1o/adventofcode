defmodule Day2 do
  def solve(input) do
    check(input, 0)
  end
  defp check([], valid) do
    valid
  end
  defp check([i|list], valid) do
    [num, l, pass ] = i |> String.split(" ", trim: true)
    let = String.at(l, 0)
    min_max = num |> String.split("-") |> Enum.map(&String.to_integer/1)
    count = pass |> String.graphemes |> Enum.count(& &1 == let)
    if ((count >= Enum.at(min_max, 0)) and (count <= Enum.at(min_max,1))) do
      check(list, valid + 1)
    else
      check(list, valid)
    end
  end
end

defmodule Day2_2 do
  def solve(input) do
    check(input, 0)
  end
  defp check([], valid) do
    valid
  end
  defp check([i|list], valid) do
    [num, l, pass ] = i |> String.split(" ", trim: true)
    let = String.at(l, 0)
    min_max = num |> String.split("-") |> Enum.map(&String.to_integer/1)
    min = Enum.at(min_max, 0)
    max = Enum.at(min_max, 1)
    pass_list = pass |> String.graphemes
    cond do
      ((Enum.at(pass_list, min-1) == let) and (Enum.at(pass_list, max-1) != let )) ->
        check(list, valid + 1)
      ((Enum.at(pass_list, min-1) != let) and (Enum.at(pass_list, max-1) == let )) ->
        check(list, valid + 1)
      true ->
        check(list, valid)
    end
  end
end
{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
# IO.inspect Day2.solve(input)
IO.inspect Day2_2.solve(input)
