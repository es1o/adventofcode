defmodule Day03 do
    def calculate([], _, houses, _, _) do
        houses
    end

    def calculate(data, map, houses, x, y) do
        [ head | tail ] = data
        [new_x, new_y ] = case head do
            "^" -> [ x, y + 1 ]
            "v" -> [ x, y - 1 ]
            ">" -> [ x + 1, y ]
            "<" -> [ x - 1, y ]
            _ -> [x, y]
        end
        if Enum.member? map, {x, y} do
            calculate(tail, map, houses, new_x, new_y)
        else
            calculate(tail, map ++ [{x, y}], houses+1, new_x, new_y)
        end
    end


end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("", trim: true)

part1 = Day03.calculate(input, [], 0, 0, 0)

IO.puts "Part1: #{part1}"