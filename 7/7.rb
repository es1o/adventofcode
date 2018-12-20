# INPUT = File.readlines('test.txt').map(&:strip)
INPUT = File.readlines('input.txt').map(&:strip)
p INPUT

graph = Hash.new
INPUT.each do |l|
    x = l.scan(/ [A-Z] /).map(&:strip)
    # graph.has_key? x[0] ? graph[x[0]].push x[1] : graph[x[0]] == [x[1]]
    if graph.has_key? x[0] 
        graph[x[0]].push x[1]
    else 
        graph[x[0]] = [x[1]]
    end
    # graph[x[0].strip] = x[1].strip
    # graph[x[0]] = x[1]
end

p graph

ans = []

while graph.size > 0
    graph.each do |k,v|
        if not graph.values.flatten.include? k
            if ans.include? k
                ans = ans - v
                ans.insert(ans.index(k) + 1, v)
            else
                ans << k
                ans << v
            end
            p ans
            ans.flatten!
            graph.delete(k)
        end
        # if graph.select
    end
end
p ans.join