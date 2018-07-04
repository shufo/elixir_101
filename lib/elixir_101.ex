defmodule Elixir101 do
 defmodule Util do
   def multiply(input,arg)  do
     if arg < 0 do
        raise RuntimeError
      end
    end

  def multiply(input,arg) do
      for x <- input, do: x*arg
  end

  def prev_num(input,arg) do
    x = Enum.find_index(input,fn(a) -> a == arg end )
    Enum.at(input,x-1)
  end

  def split(input) do
  String.split(input, " ")
  end
 end

 defmodule Math do
  def sum(input) do
    Enum.sum(input)
  end
 end
end
