defmodule Elixir101.EEx do

  def eval_file(path, data) do
    EEx.eval_file(path, [a: data.a, b: data.b])
  end
end
