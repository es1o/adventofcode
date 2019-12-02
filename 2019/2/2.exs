defmodule Day2 do
  def solve(input, pos) do
    opcode = Enum.at(input,pos)
    case opcode do
      99  -> Enum.at(input,0)
      1   -> a = Enum.at(input, pos + 1)
             b = Enum.at(input, pos + 2)
             target = Enum.at(input, pos + 3)
             new_input = List.update_at(input, target, fn _ -> _ = Enum.at(input,a) + Enum.at(input, b) end)
             solve(new_input, pos + 4)
      2   -> a = Enum.at(input, pos + 1)
             b = Enum.at(input, pos + 2)
             target = Enum.at(input, pos + 3)
             new_input = List.update_at(input, target, fn _ -> _ = Enum.at(input,a) * Enum.at(input, b) end)
             solve(new_input, pos + 4)
    end
  end

  def solve2(input, n, 100, target) do
    solve2(input, n + 1, 0, target)
  end
  
  def solve2(input, n, v, target) do
    new_input = input |> List.update_at(1, fn _ -> _ = n end ) |> List.update_at(2, fn _ -> _ = v end) 
    solution = solve(new_input, 0)
    if solution == target do
      100*n + v
    else
      solve2(input, n, v + 1, target)
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)

target = 19690720
# please modify input manually.
IO.puts "Day2 - part 1: #{Day2.solve(input, 0)}"

IO.puts "Day2 - part 2: #{Day2.solve2(input,1,0, target)}"
