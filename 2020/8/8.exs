defmodule Day8 do
  def solve(input) do
    IO.puts 'Solved!'
    # IO.inspect input
    # Enum.at(input, 5) |> get_op
    vm(input, 0, 0, [])
  end
  defp vm(list, p, acc, visited) do
    if Enum.member?(visited, p) do
      IO.inspect acc
    else
      op = get_op(Enum.at(list, p))
      case op[:op] do
        "nop" -> IO.puts "nop"
          vm(list, p + 1, acc, visited ++ [p])
        "acc" -> IO.puts "acc"
          vm(list, p + 1, acc + op[:addr], visited ++ [p])
        "jmp" -> IO.puts "jmp"
          vm(list, p + op[:addr], acc, visited ++ [p])
      end
    end

  end
  defp get_op(i) do
    [op, addr] = i |> String.split(" ", trim: true)
    %{:op => op, :addr => String.to_integer(addr) }
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day8.solve(input)
