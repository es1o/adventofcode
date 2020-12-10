defmodule Day10 do
  def solve(input) do
    solution(input, 1, 0, 1, 0)
  end
  def solve2(input) do
    solution2(input, %{0 => 1})
  end
  defp solution2([], perm) do
    Map.values(perm) |> Enum.max
  end
  defp solution2([i|input], perm) do
    new_perm = Map.put(perm, i, 0)
    a = if Map.has_key?(perm, i - 1) do
      new_perm[i] + perm[i - 1]
    else
      0
    end
    b = if Map.has_key?(perm, i - 2) do
      new_perm[i] + perm[i - 2]
    else
      0
    end
    c = if Map.has_key?(perm, i - 3) do
      new_perm[i] + perm[i - 3]
    else
      0
    end
    abc = Map.put(new_perm, i, a + b + c)

    solution2(input, abc)
  end
  defp solution([_|[]], one, _, three, _) do
    one * three
  end
  defp solution([i|input], one, two, three, sum) do
    next = Enum.at(input,0)
    cond do
      (next - i == 1)  -> solution(input, one + 1, two, three, sum)
      (next - i == 2)  -> solution(input, one, two + 1, three, sum)
      (next - i == 3)  -> solution(input, one, two, three + 1, sum)
    end
  end
end

# {:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')
{:ok, raw } = File.read('test1.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.sort
IO.inspect "Part 1: #{Day10.solve(input)}"
IO.inspect "Part 2: #{Day10.solve2(input)}"
