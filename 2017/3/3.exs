defmodule Day3 do
  def solve(step,x,y,final_step,_) when step == final_step do
    IO.inspect abs(x) + abs(y)
  end
  def solve(step,x,y,final_step,dir) do
    IO.puts "x: #{x}, y: #{y}. step: #{step}"
    case dir do
      :r -> solve(step + 1, x + 1, y, final_step, new_dir(x + 1,y,dir))
      :l -> solve(step + 1, x - 1, y, final_step, new_dir(x - 1,y,dir))
      :u -> solve(step + 1, x, y + 1, final_step, new_dir(x,y + 1,dir))
      :d -> solve(step + 1, x, y - 1, final_step, new_dir(x,y - 1,dir))
      _  -> nil
        
    end
    
  end
  defp new_dir(x,y,dir) do
    cond do
      x + y == 0 && dir == :l -> :d
      x + y == 1 && dir == :r -> :u
      y - x == 1 && dir == :u -> :l
      x - y == 0 && dir == :d -> :r
      x - y == 0 && dir == :u -> :l
      true                    -> dir
    end
    
  end
end

Day3.solve(1,0,0,265149,:r)
