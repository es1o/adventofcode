defmodule Day16 do
  def solve(input) do
    IO.puts 'Solved!'
    # IO.inspect input
    spec = get_spec(Enum.at(input, 0))
    tickets = input |> Enum.at(2)
                    |> String.replace("nearby tickets:\n","")
                    |> String.split("\n")
                    |> Enum.map(
                      fn x -> String.split(x, ",")
                            |> Enum.map(&String.to_integer/1) 
                      end)
    check(tickets, spec, [])
  end
  defp check([], _, res) do
    res |> List.flatten |> Enum.sum
  end
  defp check([i|input], spec, res) do
    v = i |> Enum.map(fn x -> Enum.find(spec, fn y -> y == x end) end)
    # IO.inspect i -- v
    check(input, spec, res ++ [ i -- v])

  end
  defp get_spec(spec) do
    # sp = String.split(spec, "\n", trim: true)
    sp = Regex.scan(~r/\d+-\d+/, spec) |> List.flatten |> Enum.map(fn x -> String.split(x, "-") |> Enum.map(&String.to_integer/1) end)
    gen_list(sp, [])
  end
  defp gen_list([], l) do
    l |> Enum.uniq
  end
  defp gen_list([s|sp], l) do
    [a,b] = s
    new_l = Range.new(a,b) |> Enum.to_list
    gen_list(sp, l ++ new_l)
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n\n", trim: true)
IO.inspect "Part 1: #{Day16.solve(input)}"
