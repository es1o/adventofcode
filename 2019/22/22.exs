defmodule Day22 do
  def solve(stack, []) do
    find(stack, 2019)
  end
  def solve(stack, input) do
    [h|t] = input
    cond do
      h == "deal into new stack" -> 
        new_stack = new_stack(stack)
        solve(new_stack, t)
      String.match?(h, ~r/^deal with increment \d+/) ->
        [n] = Regex.run(~r/\d+$/, h) |> Enum.map(&String.to_integer/1)
        len = length(stack)
        new_stack = increment(stack, List.duplicate(nil, len), n, 0, len)
        solve(new_stack, t)
      String.match?(h, ~r/^cut -?\d+/) ->
        [n] = Regex.run(~r/-?\d+$/, h) |> Enum.map(&String.to_integer/1)
        new_stack = cut(stack, n)
        solve(new_stack, t)
      true -> IO.puts "some error"
        
    end
  end
  defp find(stack, num) do
    Enum.find_index(stack, fn x -> x == num end)
  end
  defp new_stack(stack) do
    Enum.reverse(stack)
  end
  defp cut(stack, n) do
    cond do
      n > 0 -> top = Enum.slice(stack, 0, n)
                bottom = stack -- top
                bottom ++ top
      n < 0 -> top = Enum.slice(stack, length(stack) - abs(n), length(stack))
                bottom = stack -- top
                top ++ bottom
    end
  end
  defp increment([], new_stack, _, _, _) do
    new_stack
  end
  defp increment(stack, new_stack, n, pos, len) do
    [t|b] = stack
    index = if pos > len do
      pos - len
    else
      pos
    end
    updated_stack = List.update_at(new_stack, index, fn _ -> t end)
    increment(b, updated_stack, n, index + n, len)
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
stop = 10006
stack = Enum.to_list(0..stop)
IO.inspect "Part 1: #{Day22.solve(stack, input)}"
