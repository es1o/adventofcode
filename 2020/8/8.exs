defmodule Day8 do
  def solve(input) do
    vm(input, 0, 0, [])
  end
  def solve2(input) do
    vm2(input, 0, 0, -1, false, [])
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
  defp vm2(list, p, acc, prev_p, switch, visited) do
    if switch do
      IO.puts "switch"
      # if (p + 1 >= Enum.count(list) and not Enum.member?(visited, p)) do
      if (p + 1 >= Enum.count(list)) do
        IO.puts p
        IO.puts prev_p
        IO.puts "END"
        op = get_op(Enum.at(list, p))
        case op[:op] do
          "acc" -> IO.inspect acc + op[:addr]
          "jmp" ->
            if ( (p + op[:addr]) >= Enum.count(list)) do
              IO.inspect acc
            else
              vm2(list, prev_p, acc, prev_p, false, visited -- [p])
            end
          default -> IO.inspect acc
        end
      else
        IO.puts "failover"
        vm2(list, prev_p, acc, prev_p, false, visited -- [p])
      end
    else
      IO.puts "not switch"
      op = get_op(Enum.at(list, p))
      IO.inspect op
      IO.inspect p
      case op[:op] do
        "nop" -> IO.puts "nop"
          vm2(list, p + op[:addr], acc, p + 1, true, visited ++ [p])
        "acc" -> IO.puts "acc"
          vm2(list, p + 1, acc + op[:addr], p + 1, false, visited ++ [p])
        "jmp" -> IO.puts "jmp"
          vm2(list, p + 1, acc, p + op[:addr], true, visited ++ [p])
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
