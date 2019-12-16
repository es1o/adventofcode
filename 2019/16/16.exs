defmodule Day16 do
  def solve(_, i, _, result, stop) when i == stop + 1 do
    # IO.puts "SOLVE"
    # IO.inspect result
    Enum.map(result, fn x -> abs(x) end) |> Enum.map(fn x -> rem(x, 10) end) |> Enum.with_index()
  end
  def solve(input, i, pattern, result, stop) do
    # IO.inspect Enum.with_index(input)
    # IO.inspect input
    new_pattern = new_pattern(pattern, i)
    # IO.inspect new_pattern
    sum_list = Enum.map(input, fn {k,v} -> 
      # IO.puts "key: #{k}"
      # IO.puts "value: #{v}"
      calculate(v+1,k,new_pattern)
    end) 
    # IO.inspect sum_list
    sum = Enum.sum(sum_list)
    # IO.inspect pattern
    # IO.puts "ESIO"
    solve(input, i + 1, pattern, result ++ [sum], stop)
  end
  defp new_pattern(pattern, num) do
    # new_pattern = [0] ++ Enum.flat_map(pattern, &([&1, &1]))
    new_pattern = Enum.flat_map(pattern, fn x -> List.duplicate(x, num) end) 
  end
  defp calculate(pos, val, pattern) do
    len = length(pattern)
    # IO.puts "debug"
    # IO.inspect len
    # IO.inspect pos
    x = cond do
      pos == 1 -> Enum.at(pattern,1)
      pos < len - 1 -> Enum.at(pattern,pos)
      pos == len -> Enum.at(pattern,0)
      true -> Enum.at(pattern, rem(pos, len) )
      # _ -> val*Enum.at(pattern, rem(pos, length(pattern)))
    end
    # IO.puts "x: #{x}"
    # IO.puts "val: #{val}"
    x*val
    
  end
  # def solve2(input,4) do
  #   IO.inspect phase
  # end

  # def solve2(input, phase) do
    
  # end
  def solve_phases(input, 0, _) do
    IO.puts "done"
    # IO.inspect input
    Enum.each(input, fn {x,y} -> IO.puts x end)
  end
  def solve_phases(input, phases, len) do
    new_input = solve(input, 1, [0,1,0,-1], [], len)
    # IO.inspect new_input
    solve_phases(new_input, phases - 1, len)
  end
end

# {:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

# raw = "12345678"
# raw = "80871224585914546619083218645595"
# raw = "19617804207202209144916044189917"
raw = "59773590431003134109950482159532121838468306525505797662142691007448458436452137403459145576019785048254045936039878799638020917071079423147956648674703093863380284510436919245876322537671069460175238260758289779677758607156502756182541996384745654215348868695112673842866530637231316836104267038919188053623233285108493296024499405360652846822183647135517387211423427763892624558122564570237850906637522848547869679849388371816829143878671984148501319022974535527907573180852415741458991594556636064737179148159474282696777168978591036582175134257547127308402793359981996717609700381320355038224906967574434985293948149977643171410237960413164669930"
# raw = "69317163492948606335995924319873"
input = raw |> String.graphemes() |> Enum.map(&String.to_integer/1) |> Enum.with_index()
Day16.solve_phases(input, 100, length(input))
# Day16.solve(input, 1, [0, 1, 0, -1], [], length(input))
