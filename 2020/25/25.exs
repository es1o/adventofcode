defmodule Day25 do
  def solve(card, door) do
    IO.inspect card
    key = decode(card, 7, 1, 0)
    # decode(door, 7, 1, 0)
    IO.inspect door
    IO.puts "esip"
    # transform(door, 1, key)
    IO.inspect priv_key(door, key)
    # transform(card, 7, 11)
  end
  def priv_key(pub, loop_size) do
    steps(pub)
    |> Stream.drop(loop_size)
    |> Enum.take(1)
    |> hd()
  end
  defp transform(val, sub, loop) when sub == loop do
  IO.puts "finish 1"
    IO.inspect val
    IO.inspect sub
  end
  defp transform(sub, i, loop) do
  # IO.puts "esio"
  # IO.inspect sub
  # # IO.inspect sub
    new_sub = rem(sub*i, 20201227)
    transform(new_sub, i + 1, loop)
  end

  defp decode(num, _, val, loop) when num == val do
    IO.puts "finish!!!"
    IO.inspect loop
    loop
  end
  defp decode(num, sub, val, loop) do
    new_val = rem(val*sub, 20201227)
    decode(num, sub, new_val, loop + 1)

  end
end

# {:ok, raw } = File.read('input.txt')
{:ok, raw } = File.read('test.txt')

[card, door] = raw |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
Day25.solve(card, door)
