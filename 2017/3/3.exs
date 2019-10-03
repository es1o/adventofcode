defmodule Day3 do
  def solve(step,x,y,final_step,_,map) when step == final_step do
    IO.inspect abs(x) + abs(y)
  end
  def solve(step,x,y,final_step,dir,map) do
    IO.puts "x: #{x}, y: #{y}. step: #{step}"
    val = case {x,y} do
      {0,0} ->  1
      _     ->  nbg(map, x-1,y) +
                nbg(map, x-1,y-1) +
                nbg(map, x-1,y+1) +
                nbg(map, x,y+1) +
                nbg(map, x,y-1) +
                nbg(map, x+1,y+1) +
                nbg(map, x+1,y) +
                nbg(map, x+1,y-1)
    end
    if val > final_step do
      IO.inspect "DAY2: #{val}"
    end

    new_map = Map.merge(map, %{"#{x}:#{y}" => val})
    case dir do
      :r -> solve(step + 1, x + 1, y, final_step, new_dir(x + 1,y,dir),new_map)
      :l -> solve(step + 1, x - 1, y, final_step, new_dir(x - 1,y,dir),new_map)
      :u -> solve(step + 1, x, y + 1, final_step, new_dir(x,y + 1,dir),new_map)
      :d -> solve(step + 1, x, y - 1, final_step, new_dir(x,y - 1,dir),new_map)
      _  -> nil
        
    end
    
  end
  defp nbg(map,x,y) do
    n = Map.get(map, "#{x}:#{y}")
    if n do
      n
    else
      0
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

IO.inspect Day3.solve(1,0,0,265149,:r, %{})
# IO.inspect Day3.solve(1,0,0,12,:r, %{})
