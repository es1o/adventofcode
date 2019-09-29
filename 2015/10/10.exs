defmodule Day10 do
  def solve(input,40) do
    length(input)
  end
  def solve(input,n) do
    [h|t] = input
    new_input = solve_r(t, h, [], 1)
    solve(new_input, n+1)
  end
  def solve_r([],prev,res,c) do
    IO.inspect res
    res ++ [c] ++ [prev]
  end
  def solve_r([h|t], prev, res, c) do
    cond do
      h == prev -> solve_r(t,prev,res, c+1)
      true -> IO.puts "tutej"
      solve_r(t,h,res ++ [c] ++ [prev], 1)
    end
  end
end
IO.inspect Day10.solve([1,1,1,3,2,2,2,1,1,3],0)