defmodule Elixir101.Util do
  def multiply(numbers, factor) when is_number(factor) do
    if is_binary(numbers) do
      raise StringCannotMultiplyError
    end

    # raise RuntimeError if factor is negative
    if factor < 0 do
      raise "factor #{factor} is negative"
    end
    numbers |> Enum.map(&(&1 * factor))
  end

  def split(words_string) when is_binary(words_string) do
    ~w(#{words_string})
  end

  def prev_num([], _value), do: nil
  def prev_num([_current], _value), do: nil
  def prev_num([prev, current], value) do
    if current === value do
      prev
    else
      prev_num([], value)
    end
  end
  def prev_num([prev|list], value) when is_list(list) do
    current = hd list
    if current === value do
      prev
    else
      prev_num(list, value)
    end
  end
end
