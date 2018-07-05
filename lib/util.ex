defmodule Elixir101.Util do

  def hello do
    :world
  end

  # スペースで配列にわける
  def split(str) do
    String.split(str, " ")
  end

  # 与えられた配列すべての要素に任意の数をかける
  def multiply(input, multiplier) do
    if multiplier < 0 do
      raise RuntimeError
    end

    if is_binary(input) do
      raise StringCannotMultiplyError
    end

      Enum.map(input, &(&1 * multiplier))
  end

  def prev_num(input, current) do
    tmp = Enum.find_index(input, fn(x) -> x == current end)
    if tmp == nil do
      nil
    else
      Enum.at(input, tmp - 1)
    end
  end

end
