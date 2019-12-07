defmodule Day7 do
  def solve2(input, pos, id, phase, counter) do
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
              solve2(new_input, pos + 4, id, phase, counter)
      [0,2] ->
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              target = Enum.at(input, pos + 3)
              new_input = List.update_at(input, target, fn _ -> _ = val_a * val_b end)
              solve2(new_input, pos + 4, id, phase, counter)
      [0,3] -> 
              target = Enum.at(input, pos + 1)
              if counter == 1 do
                new_input = List.update_at(input, target, fn _ -> _ = phase end)
                solve2(new_input, pos + 2, id, phase, 0)
              else
                new_input = List.update_at(input, target, fn _ -> _ = id end)
                solve2(new_input, pos + 2, id, phase, 0)
              end
      [0,4] -> 
              a = Enum.at(input, pos + 1)
              new_id = if m3 == 1, do: a, else: Enum.at(input, a)
              solve2(input, pos + 2, new_id, phase, counter)
      [0,5] -> 
              a = Enum.at(input, pos + 1)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              new_pos = if val_a != 0 do
                b = Enum.at(input, pos + 2)
                if m2 == 1, do: b, else: Enum.at(input, b)
              else
                pos + 3
              end
              solve2(input, new_pos, id, phase, counter)
      [0,6] -> 
              a = Enum.at(input, pos + 1)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              new_pos = if val_a == 0 do
                b = Enum.at(input, pos + 2)
                if m2 == 1, do: b, else: Enum.at(input, b)
              else
                pos + 3
              end
              solve2(input, new_pos, id, phase, counter)
      [0,7] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              if val_a < val_b do
                  new_input = List.update_at(input, target, fn _ -> _ = 1 end)
                  solve2(new_input, pos + 4, id, phase, counter)
                else
                  new_input = List.update_at(input, target, fn _ -> _ = 0 end)
                  solve2(new_input, pos + 4, id, phase, counter)
              end
      [0,8] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              if val_a == val_b do
                  new_input = List.update_at(input, target, fn _ -> _ = 1 end)
                  solve2(new_input, pos + 4, id, phase, counter)
                else
                  new_input = List.update_at(input, target, fn _ -> _ = 0 end)
                  solve2(new_input, pos + 4, id, phase, counter)
              end
    end
  end

  def amp(_, [], out) do
    out
  end
  def amp(input, phases, out) do
    [h|t] = phases
    new_out = solve2(input, 0, out, h, 1)
    amp(input, t, new_out)
  end

  def amp_solve([], max, _, _) do
    max
  end
  def amp_solve(phases_list, max, max_phase, input) do
    [h|t] = phases_list
    result = amp(input, h, 0)
    if result > max do
      amp_solve(t, result, h, input)
    else
      amp_solve(t, max, max_phase, input)
    end
  end

end

defmodule Perm do
  def permutations([]), do: [[]]
  def permutations(list), do: for elem <- list, rest <- permutations(list--[elem]), do: [elem|rest]
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)

all_phases = Perm.permutations([0,1,2,3,4])
IO.puts "Day7 - part 1: #{Day7.amp_solve(all_phases, 0, 0, input)}"