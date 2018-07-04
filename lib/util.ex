defmodule Elixir101.Util do
  def multiply(input, args) do
    if is_bitstring(input) == true do
      raise StringCannotMultiplyError
    end
    if Enum.any?(input |> Enum.map(& &1 * args), fn(x) -> x < 0 end) == true do
      raise RuntimeError, message: "error"
    else
      input |> Enum.map(& &1 * args)
    end

  end

  def split(input) do
    String.split input, " "
  end

  def prev_num(input,args) do
    x = EnumX.get_index(input, args)
    if length(x) == 0 do
      nil
    else
      Enum.at(input,Enum.sum(EnumX.get_index(input, args)) - 1)#1つ前
    end
  end

end

defmodule StringCannotMultiplyError do
  defexception message: "error"
end

# argsのindexを取ってくる用
defmodule EnumX do
  def get_index(collection, param) when is_list(collection) do
    Enum.with_index(collection)
    |> Enum.filter_map(fn {x, _} -> x == param end, fn {_, i} -> i end)
  end
end
