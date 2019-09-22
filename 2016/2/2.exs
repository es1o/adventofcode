defmodule Day02 do
  def solve(input, key) do
    IO.inspect input
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
    key = case key do
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
    key = case key do
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
    key = case key do
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
    key = case key do
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
{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day02.solve(input,5)