defmodule Day4 do
  def solve(num, stop, pass, _) when num == stop do
    pass
  end
  def solve(num, stop, pass, list) do
    case check(num) do
      true -> solve(num+1, stop, pass+1, list ++ [num])
      false -> solve(num+1, stop, pass, list)
    end
  end
  def solve2(num, stop, pass, _) when num == stop do
    pass
  end
  def solve2(num, stop, pass, list) do
    case check2(num) do
      true -> solve2(num+1, stop, pass+1, list ++ [num])
      false -> solve2(num+1, stop, pass, list)
    end
  end
  defp check(number) do
    digits = number |> Integer.digits()
    sorted = digits |>  Enum.sort()
    if sorted != digits do
      false
    else
      num_string = number |> Integer.to_string()
      Regex.match?(~r/(\d)\1/, num_string)
    end
  end
  defp check2(number) do
    digits = number |> Integer.digits()
    sorted = digits |>  Enum.sort()
    if sorted != digits do
      false
    else
      num_string = number |> Integer.to_string()
      if Regex.match?(~r/(\d)\1{2,}/, num_string) do 
        no_triples = Regex.replace(~r/(\d)\1{2,}/, num_string, "")
        if Regex.match?(~r/(\d)\1/, no_triples) do 
          true
        else
          false
        end
      else
        if Regex.match?(~r/(\d)\1/, num_string) do 
          true
        else
          false
        end
      end
    end
  end
end

start = 231832
stop = 767346

IO.inspect "Part 1: #{Day4.solve(start, stop, 0, [])}"
IO.inspect "Part 2: #{Day4.solve2(start, stop, 0, [])}"
