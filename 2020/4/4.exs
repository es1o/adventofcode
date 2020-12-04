defmodule Day4 do
  def solve(input) do
    # IO.puts 'Solved!'
    # IO.inspect input
    check(input,0)
  end
  defp check([], valid) do
    valid
  end
  defp check([l|list], valid) do
    res = Regex.scan(~r/(ecl|pid|eyr|hcl|byr|iyr|hgt)/,l) |> Enum.count
    if (res >= 7) do
      check(list, valid + 1)
    else
      check(list, valid)
    end
  end
end

defmodule Day4_2 do
  def solve(input) do
    check(input,0)
  end
  defp check([], valid) do
    valid
  end
  defp check([l|list], valid) do
    res = Regex.scan(~r/(ecl|pid|eyr|hcl|byr|iyr|hgt)/,l) |> Enum.count
    if (res >= 7) do
      byr = Regex.run(~r/byr:\d{4}/, l) |> Enum.at(0)
      byr_year = String.split(byr,":") |> Enum.at(1) |> String.to_integer()

      iyr = Regex.run(~r/iyr:\d{4}/, l) |> Enum.at(0)
      iyr_year = String.split(iyr,":") |> Enum.at(1) |> String.to_integer()

      eyr = Regex.run(~r/eyr:\d{4}/, l) |> Enum.at(0)
      eyr_year = String.split(eyr,":") |> Enum.at(1) |> String.to_integer()
      cond do
        ((byr_year < 1920) or (byr_year > 2002))                        -> check(list, valid)
        ((iyr_year < 2010) or (iyr_year > 2020))                        -> check(list, valid)
        ((eyr_year < 2020) or (eyr_year > 2030))                        -> check(list, valid)
        (not Regex.match?(~r/ecl:(amb|blu|brn|gry|grn|hzl|oth)/, l))    -> check(list, valid)
        (not Regex.match?(~r/pid:\d{9}([^\d\w]|$)/, l))                 -> check(list, valid)
        not (Regex.match?(~r/hgt:(1[5-9]\dcm|59in|6\din|7[0-6]in)/, l)) -> check(list, valid)
        not (Regex.match?(~r/hcl:#[\da-f]{6}/, l))                      -> check(list, valid)
        true                                                            -> check(list, valid + 1)
      end
    else
      check(list, valid)
    end
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split(~r/\n\n/, trim: true)
IO.inspect "Part 1: #{Day4.solve(input)}"
IO.inspect "Part 2: #{Day4_2.solve(input)}"
