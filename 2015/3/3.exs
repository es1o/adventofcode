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

    def calculate([], map, houses, _, _, _, _, _) do
        houses
    end

    def calculate(data, map, houses, sx, sy, rx, ry, robo) do
        [ head | tail ] = data
        {x, y} = case robo do
            true -> {rx, ry}
            false -> {sx, sy}
        end
        [new_x, new_y ] = case head do
            "^" -> [ x, y + 1 ]
            "v" -> [ x, y - 1 ]
            ">" -> [ x + 1, y ]
            "<" -> [ x - 1, y ]
            _ -> [x, y]
        end
        # IO.inspect {x,y}
        if Enum.member? map, {new_x, new_y} do
            # IO.puts "TRU"
            case robo do
                true -> calculate(tail, map, houses, sx, sy, new_x, new_y, !robo)
                false -> calculate(tail, map, houses, new_x, new_y, rx, ry, !robo)
            end
        else
            # IO.puts "FALSE"
            case robo do
                true -> calculate(tail, map ++ [{new_x,new_y}], houses + 1, sx, sy, new_x, new_y, !robo)
                false -> calculate(tail, map ++ [{new_x,new_y}], houses + 1, new_x, new_y, rx, ry, !robo)
            end
        end
    end



end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("", trim: true)

# part1 = Day03.calculate(input, [], 0, 0, 0)
part2 = Day03.calculate(input, [], 1, 0, 0, 0, 0, false)

# IO.puts "Part1: #{part1}"
IO.puts "Part2: #{part2}"