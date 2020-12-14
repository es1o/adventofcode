defmodule Day14 do
  def solve(mask, input) do
    m = mask |> String.split("=", trim: true) |> Enum.at(1) |> String.trim |> String.graphemes()
    check(m, input, %{})
  end
  defp check(_, [], result) do
    IO.puts "PART 1"
    IO.inspect Map.values(result) |> Enum.sum
  end
  defp check(mask, [i|input], result) do
    if Regex.match?(~r/mask = .+/, i) do
      new_mask = i |> String.split("=", trim: true) |> Enum.at(1) |> String.trim |> String.graphemes()
      check(new_mask, input, result)
    else
      [a, b] = parse_inst(i)
      bin = to_bin(b)
      res = transform(bin, mask, [])
      if Map.has_key?(result, a) do
        new_map = Map.put(result, a, res)
        check(mask, input, new_map)
      else
        new_map = Map.put(result, a, res)
        check(mask, input, new_map)
      end
    end

  end
  defp transform([], [], res) do
    {r, _} = res |> Enum.join |> Integer.parse(2)
    r
  end
  defp transform([b|bin], [m|mask], res) do
    case m do
      "X" -> transform(bin, mask, res ++ [b])
      "1" -> transform(bin, mask, res ++ [1])
      "0" -> transform(bin, mask, res ++ [0])
    end
  end
  defp parse_inst(i) do
    Regex.scan(~r/\d+/, i) |> Enum.concat |> Enum.map(&String.to_integer/1)
  end
  defp to_bin(dec) do
    dec |> Integer.to_string(2) |> String.pad_leading(36, "0") |> String.graphemes()
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

[mask | input] = raw |> String.split("\n", trim: true)
Day14.solve(mask, input)
