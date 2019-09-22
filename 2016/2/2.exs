defmodule Day02 do
  def solve(input, key) do
    get_seq(input, key)
  end
  defp get_seq([line|lines], key) do
    key = get_key(String.graphemes(line),key)
    get_seq(lines, key)
  end
  defp get_seq([], key) do
    :nil
  end
  defp get_key([i|instructions],key) do
    key = case i do
      "U" -> up_key(key)
      "L" -> left_key(key)
      "R" -> right_key(key)
      "D" -> down_key(key)
    end
    get_key(instructions, key)
  end
  defp get_key([],key) do
    IO.inspect key
    key
  end
  defp up_key(key) do
    case key do
      4 -> 3
      5 -> 2
      6 -> 3
      7 -> 4
      8 -> 5
      9 -> 6
      _ -> key
    end
  end
  defp down_key(key) do
    case key do
      4 -> 7
      5 -> 8
      6 -> 9
      1 -> 4
      2 -> 5
      3 -> 6
      _ -> key
    end
  end
  defp left_key(key) do
    case key do
      2 -> 1
      5 -> 4
      8 -> 7
      3 -> 2
      6 -> 5
      9 -> 8
      _ -> key
    end
  end
  defp right_key(key) do
    case key do
      1 -> 2
      4 -> 5
      7 -> 8
      2 -> 3
      5 -> 6
      8 -> 9
      _ -> key
    end
  end
end

defmodule Day02p2 do
  def solve(input, key) do
    get_seq(input, key)
  end
  defp get_seq([line|lines], key) do
    key = get_key(String.graphemes(line),key)
    get_seq(lines, key)
  end
  defp get_seq([], key) do
    :nil
  end
  defp get_key([i|instructions],key) do
    key = case i do
      "U" -> up_key(key)
      "L" -> left_key(key)
      "R" -> right_key(key)
      "D" -> down_key(key)
    end
    get_key(instructions, key)
  end
  defp get_key([],key) do
    IO.inspect key
    key
  end
  defp up_key(key) do
    case key do
      6   -> 2
      "A" -> 6
      3   -> 1
      7   -> 3
      "B" -> 7
      "D" -> "B"
      8   -> 4
      "C" -> 8
      _ -> key
    end
  end
  defp down_key(key) do
    case key do
      2   -> 6
      6   -> "A"
      1   -> 3
      3   -> 7
      7   -> "B"
      "B" -> "D"
      4   -> 8
      8   -> "C"
      _ -> key
    end
  end
  defp left_key(key) do
    case key do
      3   -> 2
      7   -> 6
      "B" -> "A"
      4   -> 3
      8   -> 7
      "C" -> "B"
      6   -> 5
      9   -> 8
      _ -> key
    end
  end
  defp right_key(key) do
    case key do
      5   -> 6
      2   -> 3
      6   -> 7
      "A" -> "B"
      3   -> 4
      7   -> 8
      "B" -> "C"
      8   -> 9
      _ -> key
    end
  end
end
{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.puts "part 1:"
Day02.solve(input,5)
IO.puts "part 2:"
Day02p2.solve(input,5)