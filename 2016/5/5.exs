defmodule Day05 do
  def solve(input, i, result) do
    case String.length(result) do
      8 -> result
      _ ->
        code = Enum.join([input, i])
        hash = :crypto.hash(:md5, code) |> Base.encode16() |> String.graphemes()
        zeros = Enum.take(hash, 5) |> Enum.join
        {:ok, pass} = Enum.fetch(hash, 5)
        solve(input, i + 1, Enum.join([result, check(zeros,pass)]))
    end
  end
  defp check("00000", pass) do
    IO.inspect pass
    pass
  end
  defp check(_, _) do
    nil
  end
  def solve2(input, i, result, n) do
    case n do
      8 -> result
      _ ->
        code = Enum.join([input, i])
        hash = :crypto.hash(:md5, code) |> Base.encode16() |> String.graphemes()
        zeros = Enum.take(hash, 5) |> Enum.join
        {:ok, pos} = Enum.fetch(hash, 5)
        {:ok, pass} = Enum.fetch(hash, 6)
        { code_l, n_pos } = check2(zeros, pass, pos)
        case n_pos do
          :nil -> solve2(input, i + 1, result, n)
          _    -> case elem(result,n_pos) do
                    0 -> solve2(input, i + 1, :erlang.setelement(n_pos + 1, result, code_l), n + 1)
                    _ -> solve2(input, i + 1, result, n)
                  end
        end
    end
  end
  defp check2("00000", pass, pos) do
    case Regex.match?(~r/\d/,pos) do
      true -> 
        case String.to_integer(pos) do
          n when n < 8  -> { pass, String.to_integer(pos) }
          _             -> { :nil, :nil }
            
        end
      _    -> { :nil, :nil }
    end
  end
  defp check2(_, _, _) do
    { :nil, :nil }
  end
end

IO.inspect Day05.solve("ojvtpuvg",0,"")
result = {0,0,0,0,0,0,0,0}
IO.inspect Day05.solve2("ojvtpuvg",0,result,0)