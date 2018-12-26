defmodule Day02 do
    def area(l, w, h) do
        2*l*w + 2*w*h + 2*h*l + l*w
    end
end

{:ok, raw } = File.read('input.txt')

input = raw |> String.split("\n", trim: true)

sum_array = Enum.map input, fn z ->
    [l, w, h] = z |> String.split("x", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.sort
    Day02.area(l, w, h)
end
IO.puts "Part1 : #{Enum.sum sum_array}"