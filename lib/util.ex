defmodule Elixir101.Util do
  def multiply(numbers, _factor) when is_binary(numbers), do: raise StringCannotMultiplyError
  def multiply(_numbers, factor) when factor < 0, do: raise "factor #{factor} is negative"
  def multiply(numbers, factor) when is_number(factor), do: numbers |> Enum.map(&(&1 * factor))

  def split(words_string) when is_binary(words_string), do: ~w(#{words_string})

  def prev_num([], _value), do: nil
  def prev_num([_current], _value), do: nil
  def prev_num([prev, current], value) when current === value, do: prev
  def prev_num([_prev, _current], value), do: prev_num([], value)
  def prev_num([prev|[current|_]], value) when current === value, do: prev
  def prev_num([_prev|list], value), do: prev_num(list, value)
end
