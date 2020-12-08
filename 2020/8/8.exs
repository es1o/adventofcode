defmodule Day8 do
  def solve(input) do
    vm(input, 0, 0, [])
  end
  def solve2(input) do
    vm2(input, 0, 0, -1, false, [], 0)
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
  defp vm2(list, p, acc, prev_p, switch, visited, prev_acc) do
    cond do
      Enum.member?(visited, p) ->
        IO.inspect "LOOOOP kurwa! #{acc}"
        IO.inspect "loop kurwa acc: #{acc}, p: #{p}, prev_p: #{prev_p}, prev_acc: #{prev_acc}"
        vm2(list, prev_p, prev_acc, prev_p, false, visited -- [p], prev_acc)
      (p >= Enum.count(list)) -> IO.inspect "koniec #{acc}"
      true ->
      op = get_op(Enum.at(list, p))
      case op[:op] do
        "nop" -> IO.puts "nop"
          if switch do
            # already changed
            vm2(list, p + 1, acc, prev_p , true, visited ++ [p], prev_acc)
          else
            # change
            vm2(list, p + op[:addr], acc, p + 1, true, visited ++ [p], acc)
          end
        "acc" -> IO.puts "acc"
          vm2(list, p + 1, acc + op[:addr], prev_p, switch, visited ++ [p], prev_acc)
        "jmp" -> IO.puts "jmp"
          if switch do
            # already changed
            vm2(list, p + op[:addr], acc, prev_p, true, visited ++ [p], prev_acc)
          else
            vm2(list, p + 1, acc, p + op[:addr], true, visited ++ [p], acc)
          end
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
# Day8.solve(input)
Day8.solve2(input)
