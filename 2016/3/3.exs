defmodule Day03 do
  def solve(input) do
    check(input, 0)
  end
  def solve_t(input) do
    list = input |> List.flatten |> Enum.chunk_every(3) |> Enum.map(fn x -> Enum.join(x, " ") end)
    solve(list)
  end
  defp check([], n) do
    IO.puts n
  end
  defp check([line|lines], n) do
    [a,b,c] = line |> String.split(" ", trim: true) |> Enum.map(&String.to_integer/1)
    case is_triangle?(a,b,c) do
       true   -> check(lines, n + 1)
       false  -> check(lines, n)
    end
  end
  defp is_triangle?(a,b,c) do
    if (a + b > c && b + c > a && c + a > b) do
      true
    else
      false
    end
  end
end

defmodule Transpose do
  def transpose([[] | _]), do: []
  def transpose(m) do
    [Enum.map(m, &hd/1) | transpose(Enum.map(m, &tl/1))]
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
t_input = Enum.map(input, fn x -> x |> String.split(" ", trim: true) end) |> Transpose.transpose
Day03.solve(input)
Day03.solve_t(t_input)