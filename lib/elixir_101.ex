defmodule Elixir101 do

  defmodule Util do
 
    def split(input) do
      input |> String.split
    end

    defmodule MyError do
      defexception message: "StringCannotMultiplyError"
    end

    def multiply(input, multiple) do

      try do
        input |> Enum.map(fn(x) -> x * multiple end)
      rescue
        e in RuntimeError -> IO.puts("RuntimeError")
        e in Protocol.UndefinedError -> IO.puts("StringCannotMultiplyError")
      end

    end

    def prev_num(input, post_val) do
      if Enum.member?(input, post_val ) == true,
        do: input |> Enum.at( Enum.find_index(input, fn(x) -> x==post_val end) - 1),
        else: nil
    end

  end

#--------------------------------------

  defmodule Math do
  
    def sum(input) do
      input |> Enum.sum
    end

  end

#--------------------------------------

  defmodule Job do
  
    def async(input) do
      input.()
    end

  end

#--------------------------------------

  defmodule API do
  
    def request(input) do
      input |> URI.parse |> Map.get(:query)
    end

  end

#--------------------------------------

end
