defmodule Day8 do
  def solve([], _, sum) do
    sum
  end
  def solve(input, zeros, sum) do
    [h|t] = input
    new_zeros = Enum.count(h, fn x -> x == 0 end)
    if new_zeros < zeros do
      new_sum = Enum.count(h, fn x -> x == 1 end) * Enum.count(h, fn x -> x == 2 end)
      solve(t, new_zeros, new_sum)
    else
      solve(t, zeros, sum)
    end
  end
  def solve2([], image, x, y) do
    print(image, x,y)
  end
  def solve2(input, image, x, y) do
    [h|t] = input
    new_image = draw(h, image, x*y, 0) 
    solve2(t, new_image, x, y)
  end
  defp print(image, x, _) do
    image |> Enum.chunk_every(x) |> Enum.each(fn z -> IO.inspect(z) end)
  end
  defp draw(_, image, dim, pos) when pos == dim do
    image
  end
  defp draw(layer, image, dim, pos) do
    image_pixel = Enum.at(image, pos)
    layer_pixel = Enum.at(layer, pos)
    case {image_pixel, layer_pixel} do
      {:nil, _} -> draw(layer, List.update_at(image, pos, fn _ -> layer_pixel end), dim, pos + 1 )
      {2, 1} -> draw(layer, List.update_at(image, pos, fn _ -> 1 end), dim, pos + 1 )
      {2, 0} -> draw(layer, List.update_at(image, pos, fn _ -> 0 end), dim, pos + 1 )
      _ -> draw(layer, image, dim, pos + 1)
        
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

x = 25
y = 6
input = raw |> String.split("", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.chunk_every(x*y)
IO.inspect "Day 9 - part 1: #{Day8.solve(input, x*y + 1, 0)}"
# part 2
Day8.solve2(input, List.duplicate(:nil, x*y), x, y)
