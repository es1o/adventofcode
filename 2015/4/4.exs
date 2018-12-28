defmodule Day4 do
    def check(int, raw) do
        md5 = "#{raw}#{int}"
        crypted = :crypto.hash(:md5, md5) |> Base.encode16(case: :lower)

        case crypted do
            "000000" <> _ -> IO.puts "Part2: #{int}"
            "00000"  <> _ -> IO.puts "Part1: #{int}"
            _            -> check(int + 1, raw)
        end
    end

end

input = "iwrupvqb"
Day4.check(0, input)