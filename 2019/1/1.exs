defmodule Day1 do
  def solve([i|input], sum) do
    solve(input, sum + div(i,3) - 2)
  end
  def solve([], sum) do
    sum
  end

  def solvep2([i|input], sum) do
    fuel = calculate_fuel(i, 0)
    solvep2(input, sum + fuel)
  end
  def solvep2([], sum) do
    sum
  end

  defp calculate_fuel(mass, fuel) when mass > 6 do
    f = div(mass,3) - 2
    calculate_fuel(f, fuel + f)  
  end
  defp calculate_fuel(mass, fuel) when mass <= 6 do
    fuel
  end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
IO.puts "Day1 - part 1: #{Day1.solve(input, 0)}"
IO.puts "Day1 - part 2: #{Day1.solvep2(input, 0)}"
