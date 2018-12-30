# defmodule Day5 do
#     def check([], num) do
#         num
#     end
#     def check(input, num) do
#         [word | tail] = input
#         cond do
#             not String.match?(word, ~r/(.)\1+/)                     -> check(tail, num)
#             String.match?(word, ~r/(ab|cd|pq|xy)/)                  -> check(tail, num)
#             String.match?(word, ~r/[aeiou]+.*[aeiou]+.*[aeiou]+.*/) -> check(tail, num + 1)
#             true                                                    -> check(tail, num)
#         end
#     end
#     def check2([], num) do
#         num
#     end
#     def check2(input, num) do
#         [word | tail] = input
#         cond do
#             not String.match?(word, ~r/(.)(.)\1/) -> check2(tail, num)
#             String.match?(word, ~r/(.{2})(.*)\1/) -> check2(tail, num + 1)
#             true                                  -> check2(tail, num)
#         end
#     end

# end

defmodule Day6 do
    def light(start_x, start_y, end_x, end_y, map, type) do
        IO.puts "on"
        for x <- start_x..end_x do
            for y <- start_y..end_y do
                if not Map.has_key?(map, {x, y}) do
                    # bad... I need to practice functional programming
                    # why map variable isn't updated?
                    map = Map.put(map, {x,y}, 0)
                end
                # IO.puts "X: #{x} Y: #{y}"
            end
        end
        IO.puts "end"
        IO.inspect map
        map
    end

    def solve([], map) do
        IO.puts "end"
    end
    def solve(input, map) do
        [instr | tail] = input
        datax = Regex.scan(~r/\d{1,3},\d{1,3}/, instr) |> Enum.at(0)
        datay = Regex.scan(~r/\d{1,3},\d{1,3}/, instr) |> Enum.at(1)
        IO.puts "esio"
        # IO.inspect data
        # [start_x, start_y] = Enum.get(data, 0)
        [start_x, start_y] = Enum.at(datax, 0)
            |> String.split(",", trim: true) 
            |> Enum.map(&String.to_integer/1) 
        [end_x, end_y] = Enum.at(datay, 0)
            |> String.split(",", trim: true)
            |> Enum.map(&String.to_integer/1)
        # x = Enum.at(data, 0) |> String.split(",", trim: true)
        # IO.inspect x
        IO.inspect start_x
        IO.inspect start_y
        IO.inspect end_x
        IO.inspect end_y
        new_map = light(start_x, start_y, end_x, end_y, map, :on)
        IO.inspect new_map
        cond do
            Regex.match?(~r/^turn off/, instr) -> 
                IO.puts "turn off"
                solve(tail, map)
            Regex.match?(~r/^turn on/, instr) -> 
                IO.puts "turn on"
                solve(tail, map)
            Regex.match?(~r/^toggle/, instr) -> 
                IO.puts "toggle"
                solve(tail, map)
            true -> IO.puts "Esio"
        end
    end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
Day6.solve(input, %{})
# IO.puts input