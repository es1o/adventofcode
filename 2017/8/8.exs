defmodule Day08 do
    def solve([], reg, max) do
        {:ok, part1} = Map.values(reg) |> Enum.sort(&(&1 >= &2))|> Enum.fetch(0)
        {:ok, part2} = Map.values(max) |> Enum.sort(&(&1 >= &2))|> Enum.fetch(0)
        {part1, part2}

    end
    def solve([cmd|cmds], reg, max) do
        {new_reg, new_max} = run_cmd(cmd, reg, max)
        solve(cmds,new_reg, new_max)
        
    end

    defp run_cmd(cmd, reg, max) do
        [regA, command, x, "if", regB, cnd, y] = cmd |> String.split("\s", trim: true)
        new_reg = Map.put_new(reg, regB, 0) |> Map.put_new(regA, 0)
        if check_cond(regB, cnd, y, new_reg) do
            final_reg = compute(regA, command, x, new_reg)
            final_max = check_max(regA, final_reg, max)
            {final_reg, final_max}
        else
            {new_reg, max}
        end
        
    end

    defp check_max(regA, reg, max) do
        new_max = Map.put_new(max, regA, 0)

        reg_val = Map.get(reg, regA)
        if reg_val > Map.get(new_max, regA) do
            Map.update(new_max, regA, 0, fn _ -> reg_val end)
        else
            new_max
        end
        
    end

    defp compute(regA, command, x, reg) do
        xp = String.to_integer(x)
        case command do
            "inc" -> Map.update(reg, regA, 0, fn f -> f + xp end )
            "dec" -> Map.update(reg, regA, 0, fn f -> f - xp end )
                
        end
        
    end

    defp check_cond(regB, cnd, y, reg) do
        yp = String.to_integer(y)
        case cnd do
            ">" -> if Map.get(reg, regB) > yp, do: true, else: false
            ">=" -> if Map.get(reg, regB) >= yp, do: true, else: false
            "==" -> if Map.get(reg, regB) == yp, do: true, else: false
            "<" -> if Map.get(reg, regB) < yp, do: true, else: false
            "<=" -> if Map.get(reg, regB) <= yp, do: true, else: false
            "!=" -> if Map.get(reg, regB) != yp, do: true, else: false
        end
    end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true) 

{part1, part2} = Day08.solve(input,%{},%{})
IO.inspect "part1 #{part1}"
IO.inspect "part2 #{part2}"