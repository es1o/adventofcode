defmodule Day8 do
    def calculate([], chars, vals) do
        IO.puts "Part1: #{chars - vals}"
    end
    def calculate(list, chars, vals) do
        [head|tail] = list
        len = String.length(head)
        formated = String.slice(head, 1, len-2)
        # replaced = String.replace(formated, ~r/\\n|\\"|\\|\\x\d{2}/, "X")
        replaced = String.replace(formated, ~r/\\\"|\n|\\x[0-9a-fA-F]{2}|\\/, "X")
        # ~r/\n|\\"|\\|\\x\d{2}/
        # formated = String.slice(replaced, 1, len-2)
        IO.inspect head
        IO.inspect formated
        IO.inspect replaced
        new_vals = String.length(replaced)
        IO.inspect new_vals
        IO.puts "esio"
        calculate(tail, chars + len, vals + new_vals)
    end
end

lines = 
#   File.stream!("test.txt") 
  File.stream!("input.txt") 
  |> Stream.map(&String.trim_trailing/1) 
  |> Enum.to_list
  |> Enum.shuffle

IO.inspect lines
Day8.calculate(lines, 0, 0)