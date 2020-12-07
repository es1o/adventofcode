defmodule Day7 do
  def solve(input) do
    IO.puts 'Solved!'
    IO.inspect input
  end
end

# {:ok, raw } = File.read('input.txt')
{:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day7.solve(input)
