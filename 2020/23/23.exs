defmodule Day23 do
  def solve(input) do
    # IO.inspect input
    # IO.puts 'Solved!'
    # l = [3, 4, 6, 7, 2, 5, 8, 9, 1]
    # g = [4,6,7]
    # wrap(g, l)
    game(input, 1, 0)
  end
  defp game(_, 100, _) do
  end
  defp game(cups, t, i) do
    if i >= Enum.count(cups) do
      game(cups, t, 0)
    end
    c = Enum.at(cups, i)
    get = cups |> Enum.slice(i+1..i+3)
    # IO.inspect get
    # dropped = cups |> Enum.drop(3)
    dropped = cups -- get
    IO.inspect "TURN"
    # IO.inspect get
    # IO.inspect cups
    # IO.inspect dropped
    # IO.inspect c
    IO.inspect dest = get_last(get, dropped, c - 1)
    IO.inspect "destination: #{dest}"
    index = Enum.find_index(dropped, fn x -> x == dest end)
    # f_index = if dest < c do
    #   index + 1
    # else
    #   index
    # end
    head = Enum.take(dropped, index + 1)
    tail = Enum.drop(dropped, index + 1)
    IO.puts "head"
    IO.inspect head
    IO.puts "tail"
    IO.inspect tail
    new_cups = if index <= i do
      wrap(get, head ++ get ++ tail)
    else
      head ++ get ++ tail
    end
    IO.inspect "turn: #{t}"
    # IO.inspect c
    # IO.inspect cups
    IO.inspect new_cups
    game(new_cups, t + 1, i + 1)


  end

  defp wrap(g, list) do
    max = Enum.max(g)
    # IO.inspect list
    i = Enum.find_index(list, fn x -> x == max end)
    # IO.inspect i
    res = Enum.slice(list, i..Enum.count(list)) ++ Enum.slice(list, 0..i-1)
    # IO.inspect res

  end
  # get destination
  defp get_last(g, list, d) do
    cond do
      d == 0 -> List.last(list)
      Enum.any?(g, fn x -> x == d end) -> get_last(g, list, d - 1)
      true -> d
    end
  end
end


# {:ok, raw } = File.read('input.txt')
{:ok, raw } = File.read('test.txt')

# input = raw |> String.split("\n", trim: true)
input = raw |> String.graphemes |> Enum.map(&String.to_integer/1)
Day23.solve(input)
