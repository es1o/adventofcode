def winner(players, max_score)
    table = [0]
    # m = 1
    c = 0
    results = Array.new(players){ 0 }
    (1..max_score).each do |x|
        if x % 23 > 0
            new_c = c % table.size + 1
            table.insert(new_c, x)
            c = new_c + 1
        else
            results[x % players] += x
            new_c = c - 8
            new_c += table.size if new_c < 0
            results[x % players] += table.delete_at new_c
            c = new_c + 1
        end
	p x
	p max_score
        x += 1
    end
    results.max
end
p winner(431, 70950)
p winner(431, 7095000)
