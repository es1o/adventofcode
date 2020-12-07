defmodule Day7 do
  def solve(input) do
    input |> Enum.map(&parse_bags/1)
          |> reverse_graph()
          |> graph_size("shiny gold")
  end
  def solve2(input) do
    input |> Enum.map(&parse_bags/1)
          |> Map.new()
          |> bag_count("shiny gold")
  end
  defp parse_bags(bags) do
    [_ | [bag, rest]] = Regex.run(~r/(.+) bags contain (.+)\./U, bags)
    subbags = String.split(rest, ", ")
        |> Enum.map( fn s -> String.replace(s, ~r/ bags?/, "")
        |> String.split(" ", parts: 2)
        |> List.to_tuple()
      end)
      |> Enum.filter(fn {n, _} -> n != "no" end)
      |> Enum.map(fn {n, text} -> {String.to_integer(n), text} end)
    {bag, subbags}
  end
  defp reverse_graph(graph) do
    graph
    |> Enum.reduce(%{}, fn {name, items}, graph ->
        Enum.reduce(items, graph, fn {count, edge}, graph ->
          Map.update(graph, edge, [{count, name}], &[{count, name} | &1])
        end)
      end)
  end
  defp graph_size(graph, start) do
    Stream.unfold([{0, start}], fn
      [] -> nil
      [{_, head} | tail] -> {head, tail ++ (graph[head] || [])}
    end)
    |> Enum.uniq()
    |> length()
    |> (&(&1 - 1)).()
  end
  defp bag_count(graph, start) do
    Enum.reduce(graph[start] || [], 0, fn {count, bag}, acc ->
      acc + count + count * bag_count(graph, bag)
    end)
  end
end

{:ok, raw } = File.read('input.txt')
# {:ok, raw } = File.read('test.txt')

input = raw |> String.split("\n", trim: true)
IO.inspect "Part 1: #{Day7.solve(input)}"
IO.inspect "Part 2: #{Day7.solve2(input)}"
