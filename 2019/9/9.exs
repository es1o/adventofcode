defmodule Day9 do

  def solve2(input, pos, id, rb) do
    opcode_digits = Enum.at(input,pos) |> Integer.digits()
    opcode_digits_full = case Enum.count(opcode_digits) do
      5 -> opcode_digits
      4 -> [0] ++ opcode_digits
      3 -> [0,0] ++ opcode_digits
      2 -> [0,0,0] ++ opcode_digits
      1 -> [0,0,0,0] ++ opcode_digits
    end
    opcode = Enum.take(opcode_digits_full, -2)
    [m1, m2, m3] = Enum.take(opcode_digits_full, 3)
    IO.puts "opcode"
    IO.inspect opcode_digits_full
    IO.inspect "rb: #{rb}"
    IO.inspect "position #{pos}"
    IO.inspect "id: #{id}"
    # IO.inspect Enum.at(input, pos + 1)
    # IO.inspect Enum.at(input, pos + 2)
    # IO.inspect Enum.at(input, pos + 3)
    # IO.puts "val_a: #{val_a}"
    # IO.puts "val_b: #{val_b}"
    # IO.puts "target: #{target}"
    # IO.puts ""
    # IO.puts ""
    case opcode do
      [9,9] -> id
      [0,1] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              IO.puts "m1: #{m1}"
              IO.puts "m2: #{m2}"
              IO.puts "m3: #{m3}"
              IO.inspect input
              val_target = case m1 do
                1 -> target
                2 -> rb + target
                0 -> Enum.at(input, target)
              end

              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                0 -> Enum.at(input, a)
              end
              val_b = case m2 do
                1 -> b
                2 -> Enum.at(input, rb + b)
                0 -> Enum.at(input, b)
              end
    IO.puts "val_a: #{a}"
    IO.puts "val_b: #{b}"
    IO.puts "target: #{target}"
    IO.puts "val_target: #{val_target}"
              new_input = List.update_at(input, val_target, fn _ -> _ = val_a + val_b end)
              solve2(new_input, pos + 4, id, rb)
      [0,2] ->
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                _ -> Enum.at(input, a)
              end
              val_b = case m2 do
                1 -> b
                2 -> Enum.at(input, rb + b)
                _ -> Enum.at(input, b)
              end
              target = Enum.at(input, pos + 3)
              val_target = case m1 do
                1 -> target
                2 -> rb + target
                0 -> Enum.at(input, target)
              end
    # IO.puts "val_a: #{val_a}"
    # IO.puts "val_b: #{val_b}"
    # IO.puts "target: #{target}"
              new_input = List.update_at(input, val_target, fn _ -> _ = val_a * val_b end)
              solve2(new_input, pos + 4, id, rb)
      [0,3] -> 
              target = Enum.at(input, pos + 1)
              new_target = case m3 do
                1 -> target
                2 -> rb + target
                _ -> Enum.at(input, target)
              end
              # IO.puts "new_target: #{new_target}"
              # IO.puts "id: #{id}"
              new_input = List.update_at(input, new_target, fn _ -> _ = id end)
              solve2(new_input, pos + 2, id, rb)
      [0,4] -> 
              a = Enum.at(input, pos + 1)
              new_id = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                _ -> Enum.at(input, a)
              end
              solve2(input, pos + 2, new_id, rb)
      [0,5] -> 
              a = Enum.at(input, pos + 1)
              # IO.inspect "dasddsasadsadsadsadsadsadsad"
              # IO.inspect a
              # IO.inspect m3
              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                # 2 -> Enum.at(input, rb + Enum.at(input,a))
                _ -> Enum.at(input, a)
              end
              # IO.inspect val_a
              # IO.inspect "cdsdassdadsa"
              new_pos = if val_a != 0 do
                b = Enum.at(input, pos + 2)
                # IO.inspect "b: #{b}"
                # IO.inspect "m2: #{m2}"
                # IO.inspect "rb: #{rb}"
                # IO.inspect Enum.at(input, 1024)
                case m2 do
                  1 -> b
                  2 -> Enum.at(input, rb + b)
                  # 2 -> Enum.at(input, rb + b)
                  _ -> Enum.at(input, b)
                end
              else
                pos + 3
              end
    # IO.puts "val_a: #{val_a}"
    # IO.puts "pos: #{new_pos}"
              # IO.inspect new_pos
              solve2(input, new_pos, id, rb)
      [0,6] -> 
              a = Enum.at(input, pos + 1)
              # val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                # 2 -> Enum.at(input, rb + Enum.at(input,a))
                _ -> Enum.at(input, a)
              end
              # IO.inspect "6: #{val_a}"
              new_pos = if val_a == 0 do
                b = Enum.at(input, pos + 2, rb)
                case m2 do
                  1 -> b
                  2 -> Enum.at(input, rb + b)
                  # 2 -> Enum.at(input, rb + Enum.at(input,b))
                  _ -> Enum.at(input, b)
                end
              else
                pos + 3
              end
    # IO.puts "val_a: #{val_a}"
    # IO.puts "pos: #{pos}"
              solve2(input, new_pos, id, rb)
      [0,7] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                # 2 -> Enum.at(input, rb + Enum.at(input,a))
                _ -> Enum.at(input, a)
              end
              val_b = case m2 do
                1 -> b
                2 -> Enum.at(input, rb + b)
                # 2 -> Enum.at(input, rb + Enum.at(input,b))
                _ -> Enum.at(input, b)
              end
              # IO.inspect "7: #{val_a}"
              # IO.inspect "7: #{val_b}"
              # IO.inspect "7: #{target}"
              if val_a < val_b do
                  new_input = List.update_at(input, target, fn _ -> _ = 1 end)
                  solve2(new_input, pos + 4, id, rb)
                else
                  new_input = List.update_at(input, target, fn _ -> _ = 0 end)
                  solve2(new_input, pos + 4, id, rb)
              end
      [0,8] -> 
              a = Enum.at(input, pos + 1)
              b = Enum.at(input, pos + 2)
              target = Enum.at(input, pos + 3)
              # val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              # val_b = if m2 == 1, do: b, else: Enum.at(input, b)
              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                # 2 -> Enum.at(input, rb + Enum.at(input,a))
                _ -> Enum.at(input, a)
              end
              val_b = case m2 do
                1 -> b
                2 -> Enum.at(input, rb + b)
                # 2 -> Enum.at(input, rb + Enum.at(input,b))
                _ -> Enum.at(input, b)
              end
              # IO.inspect "8: #{val_a}"
              # IO.inspect "8: #{val_b}"
              # IO.inspect "8: #{target}"
              if val_a == val_b do
                  new_input = List.update_at(input, target, fn _ -> _ = 1 end)
                  # Io.inspect "target_update: #{target}"
                  solve2(new_input, pos + 4, id, rb)
                else
                  new_input = List.update_at(input, target, fn _ -> _ = 0 end)
                  solve2(new_input, pos + 4, id, rb)
              end
      [0,9] -> 
              # IO.puts "opcode 09"
              # IO.inspect opcode_digits_full
              a = Enum.at(input, pos + 1)
              # IO.inspect a
              # IO.inspect rb
              # IO.inspect m3
              val_a = case m3 do
                1 -> a
                2 -> Enum.at(input, rb + a)
                # 2 -> Enum.at(input, rb + Enum.at(input,a))
                _ -> Enum.at(input, a)
              end
              # IO.inspect val_a
              # IO.puts "esn"
              # val_a = if m3 == 1, do: a, else: Enum.at(input, a)
              solve2(input, pos + 2, id, rb + val_a)
    end
  end

end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test_5.txt')
# {:ok, raw } = File.read('test.txt')

input_short = raw |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)
input = input_short ++ List.duplicate(0, 300)

IO.puts "Day9 - part 1: #{Day9.solve2(input, 0, 1, 0)}"
# IO.puts "Day9 - part 2: #{Day9.solve2(input, 0, 5)}"