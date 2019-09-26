defmodule Day05 do
  def solve(input, i, result) do
    case String.length(result) do
      8 -> result
      _ ->
        # IO.inspect i
        code = Enum.join([input, i])
        hash = :crypto.hash(:md5, code) |> Base.encode16() |> String.graphemes()
        zeros = Enum.take(hash, 5) |> Enum.join
        {:ok, pass} = Enum.fetch(hash, 5)
        # IO.inspect zeros
        # IO.inspect code
        # IO.inspect hash
        # IO.inspect check(zeros, pass)
        # IO.inspect check("00000", code)
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
end

IO.puts Day05.solve("ojvtpuvg",0,"")