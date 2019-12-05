defmodule Day5 do
  def solve(input, pos, id) when id == 0 or id == 1 do
    opcode_digits = Enum.at(input,pos) |> Integer.digits()
    opcode_digits_full = case Enum.count(opcode_digits) do
      5 -> opcode_digits
      4 -> [0] ++ opcode_digits
      3 -> [0,0] ++ opcode_digits
      2 -> [0,0,0] ++ opcode_digits
      1 -> [0,0,0,0] ++ opcode_digits
    end
    opcode = Enum.take(opcode_digits_full, -2)
    [_, m2, m3] = Enum.take(opcode_digits_full, 3)
    
    case opcode do
      [9,9] -> Enum.at(input,0)
      [0,1] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              new_input = List.update_at(input, target, fn _ -> _ = val_a + val_b end)
              solve(new_input, pos + 4, id)
      [0,2] ->
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              target = Enum.at(input, pos + 3)
              new_input = List.update_at(input, target, fn _ -> _ = val_a * val_b end)
              solve(new_input, pos + 4, id)
      [0,3] -> 
              target = Enum.at(input, pos + 1)
              new_input = List.update_at(input, target, fn _ -> _ = id end)
              solve(new_input, pos + 2, id)
      [0,4] -> 
              a = Enum.at(input, pos + 1)
              new_id = if m3 == 1, do: a, else: Enum.at(input, a)
              solve(input, pos + 2, new_id)
    end
  end
  def solve(_, _, id) do
    id
  end
  def solve2(input, pos, id) do
    opcode_digits = Enum.at(input,pos) |> Integer.digits()
    opcode_digits_full = case Enum.count(opcode_digits) do
      5 -> opcode_digits
      4 -> [0] ++ opcode_digits
      3 -> [0,0] ++ opcode_digits
      2 -> [0,0,0] ++ opcode_digits
      1 -> [0,0,0,0] ++ opcode_digits
    end
    opcode = Enum.take(opcode_digits_full, -2)
    [_, m2, m3] = Enum.take(opcode_digits_full, 3)
    case opcode do
      [9,9] -> id
      [0,1] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              new_input = List.update_at(input, target, fn _ -> _ = val_a + val_b end)
              solve2(new_input, pos + 4, id)
      [0,2] ->
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              target = Enum.at(input, pos + 3)
              new_input = List.update_at(input, target, fn _ -> _ = val_a * val_b end)
              solve2(new_input, pos + 4, id)
      [0,3] -> 
              target = Enum.at(input, pos + 1)
              new_input = List.update_at(input, target, fn _ -> _ = id end)
              solve2(new_input, pos + 2, id)
      [0,4] -> 
              a = Enum.at(input, pos + 1)
              new_id = if m3 == 1, do: a, else: Enum.at(input, a)
              solve2(input, pos + 2, new_id)
      [0,5] -> 
              a = Enum.at(input, pos + 1)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              new_pos = if val_a != 0 do
                b = Enum.at(input, pos + 2)
                if m2 == 1, do: b, else: Enum.at(input, b)
              else
                pos + 3
              end
              solve2(input, new_pos, id)
      [0,6] -> 
              a = Enum.at(input, pos + 1)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              new_pos = if val_a == 0 do
                b = Enum.at(input, pos + 2)
                if m2 == 1, do: b, else: Enum.at(input, b)
              else
                pos + 3
              end
              solve2(input, new_pos, id)
      [0,7] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              if val_a < val_b do
                  new_input = List.update_at(input, target, fn _ -> _ = 1 end)
                  solve2(new_input, pos + 4, id)
                else
                  new_input = List.update_at(input, target, fn _ -> _ = 0 end)
                  solve2(new_input, pos + 4, id)
              end
      [0,8] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              if val_a == val_b do
                  new_input = List.update_at(input, target, fn _ -> _ = 1 end)
                  solve2(new_input, pos + 4, id)
                else
                  new_input = List.update_at(input, target, fn _ -> _ = 0 end)
                  solve2(new_input, pos + 4, id)
              end
    end
  end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)

IO.puts "Day5 - part 1: #{Day5.solve(input, 0, 1)}"
IO.puts "Day5 - part 2: #{Day5.solve2(input, 0, 5)}"