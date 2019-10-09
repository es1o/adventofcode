defmodule Day08 do
    def solve([], reg) do
        {:ok, part1} = Map.values(reg) |> Enum.sort(&(&1 >= &2))|> Enum.fetch(0)
        part1

    end
    def solve([cmd|cmds], reg) do
        new_reg = run_cmd(cmd, reg)
        solve(cmds,new_reg)
        
    end

    defp run_cmd(cmd, reg) do
        [regA, command, x, "if", regB, cnd, y] = cmd |> String.split("\s", trim: true)
        new_reg = Map.put_new(reg, regB, 0) |> Map.put_new(regA, 0)
        if check_cond(regB, cnd, y, new_reg) do
            final_reg = compute(regA, command, x, new_reg)
            final_reg
        else
            new_reg
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

IO.inspect "part1 #{Day08.solve(input,%{})}"