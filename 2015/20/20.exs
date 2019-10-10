defmodule Day20 do
  def solve(num, target) do
    curr = compute(num, 1,0)
    if curr >= target do
      num
    else
      solve(num+1, target)
    end
    
  end

  defp compute(num, i, presents) when num < i do
    presents
  end

  defp compute(num, i, presents) do
    if rem(num, i) == 0 do
      compute(num, i + 1, presents + i*10)
    else
      compute(num, i + 1, presents)
    end
  end
  
end

IO.inspect "part1: #{Day20.solve(0,33100000)}"