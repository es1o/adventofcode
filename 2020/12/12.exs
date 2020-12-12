defmodule Day12 do
  def solve(input) do
    # E = 0, S = 1, W = 2, N = 3 
    move(input, 0, 0, 0)
  end
  def solve2(input) do
    # E = 0, S = 1, W = 2, N = 3 
    move2(input, 0, 0, 0, 10, 1)
  end

  defp move([], x, y, _) do
    abs(-x) + abs(-y)
  end

  defp move([m|moves], x, y, dir) do
    m_dir = [0,1,2,3]
    ins = Regex.run(~r/\w/, m) |> Enum.at(0)
    val = Regex.run(~r/\d+/, m) |> Enum.at(0) |> String.to_integer
    case ins do
      "N" -> move(moves, x + val, y, dir)
      "W" -> move(moves, x - val, y, dir)
      "E" -> move(moves, x, y + val, dir)
      "S" -> move(moves, x, y - val, dir)
      "F" -> 
        case dir do
          3 -> move(moves, x + val, y, dir)
          1 -> move(moves, x - val, y, dir)
          0 -> move(moves, x, y + val, dir)
          2 -> move(moves, x, y - val, dir)
        end
      "L" -> move(moves, x, y, Enum.at(m_dir, rem(dir - Integer.floor_div(val, 90),4)))
      "R" -> move(moves, x, y, Enum.at(m_dir, rem(dir + Integer.floor_div(val, 90),4)))
    end
  end
  defp move2([], x, y, _, _, _) do
    abs(-x) + abs(-y)
  end

  defp move2([m|moves], x, y, dir, wx, wy) do
    ins = Regex.run(~r/\w/, m) |> Enum.at(0)
    val = Regex.run(~r/\d+/, m) |> Enum.at(0) |> String.to_integer
    case ins do
      "N" -> move2(moves, x, y, dir, wx, wy + val)
      "W" -> move2(moves, x, y, dir, wx - val, wy)
      "E" -> move2(moves, x, y, dir, wx + val, wy)
      "S" -> move2(moves, x, y, dir, wx, wy - val)
      "F" -> move2(moves, x + wx*val, y + wy*val, dir, wx, wy) 
      "L" -> 
        rotate = Integer.floor_div(val, 90)
        case rotate do
          1 -> move2(moves, x, y, dir, -wy, wx)
          2 -> move2(moves, x, y, dir, -wx, -wy)
          3 -> move2(moves, x, y, dir, wy, -wx)
          4 -> move2(moves, x, y, dir, wx, wy)
        end
      "R" -> 
        rotate = Integer.floor_div(val, 90)
        case rotate do
          1 -> move2(moves, x, y, dir, wy, -wx)
          2 -> move2(moves, x, y, dir, -wx, -wy)
          3 -> move2(moves, x, y, dir, -wy, wx)
          4 -> move2(moves, x, y, dir, wx, wy)
        end
    end
  end
    
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect "Part 1: #{Day12.solve(input)}"
IO.inspect "Part 2: #{Day12.solve2(input)}"
