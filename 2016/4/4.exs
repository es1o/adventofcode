defmodule Day04 do
  def solve(input) do
    check(input, 0)
  end
  def solve_p2(input) do
    check_p2(input)
  end
  defp check([], n) do
    IO.puts n
  end
  defp check([line|lines], n) do
    data = line |> String.split("-", trim: true)
    room = Enum.slice(data, 0, length(data) - 1 )
    last = data |> List.last()
    [id] = Regex.run(~r/\d+/, last)
    [csum] = Regex.run(~r/[a-z]+/,last)
    letters = room  |> Enum.join() 
                    |> String.graphemes() 
                    |> Enum.reduce(%{}, fn char, acc -> Map.put(acc, char, (acc[char] || 0) + 1) end)
                    |> Enum.map(&Tuple.to_list/1)
                    |> Enum.sort_by( fn [_, b] -> b end, &>=/2)
    new_n = v_chck(letters, String.length(csum), id, csum)
    check(lines,n + new_n)
  end
  defp check_p2([]) do :nil end
  defp check_p2([line|lines]) do
    data = line |> String.split("-", trim: true)
    last = data |> List.last()
    [id] = Regex.run(~r/\d+/, last)
    room = Enum.slice(data, 0, length(data) - 1 ) |> Enum.join() |> String.graphemes() |> Enum.map(fn x -> <<rot(x,id)>> end) |> Enum.join()
    case room do
       "northpoleobjectstorage" -> IO.puts id
       _ -> check_p2(lines)
    end
  end
  defp rot(<<char>>, n) do
    ?a + rem(char - ?a + String.to_integer(n), 26)
  end
  defp v_chck(_, _, 0, _) do
    0
  end
  defp v_chck([], _, id, _) do
    {id, _} = Integer.parse(id)
    id
  end
  defp v_chck(_, 0, id, _) do
    {id, _} = Integer.parse(id)
    id
  end
  defp v_chck([letter|letters], i, id, csum) do
    case csum =~ hd(letter) do
      true -> v_chck(letters, i - 1, id, csum)
      false -> v_chck(letters, 0, 0, csum)
    end
  end

end


{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)

Day04.solve(input)
Day04.solve_p2(input)