defmodule Elixir101.Math do
  def sum(numbers) when is_map(numbers), do: Enum.to_list(numbers) |> sum
  def sum([]), do: 0
  def sum([number | numbers]) when is_number(number) do
    number + sum(numbers)
  end
end
