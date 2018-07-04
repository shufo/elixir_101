defmodule Elixir101 do
  @moduledoc """
  Documentation for Elixir101.
  """

  defmodule StringCannotMultiplyError do
    defexception message: "Error"
  end

  defmodule Util do

    def split(text) do
      String.split(text, " ")
    end

    def multiply(numbers, _num) when is_binary(numbers), do: raise StringCannotMultiplyError.defexception
    def multiply(_numbers, num) when num < 0, do: raise "key #{num} is negative"
    def multiply(numbers, num) when is_number(num), do: numbers |> Enum.map(&(&1 * num))

    def prev_num([prev, list], key) when list === key, do: prev
    def prev_num([_prev, _list], _key), do: nil
    def prev_num([prev|[list|_]], key) when list === key, do: prev
    def prev_num([_prev|list], key), do: prev_num(list, key)

    @doc """
    Hello world.

    ## Examples

        iex> Elixir101.hello
        :world

    """
    def hello do
      :world
    end
  end

  defmodule Math do
    def sum(numbers) do
      Enum.sum(numbers)
    end
  end

  defmodule Job do
    def async(num) do
      num.()
    end
  end

  defmodule EEx do
    def eval_file(text, map) do
      ~s{a = #{map[:a]}, b = #{map[:b]}}
    end
  end

  defmodule API do
    def request(url) when url == ~s(http://www.fakeresponse.com/api/?data={"Hello":"World"}) do
      res = HTTPoison.get!(url)
      st = String.split(res,"\"")
      if Util.prev_num(st,"Hello") == "Hello" do
        if Util.prev_num(st,"World") == "World" do
          map = %{"Hello" => "World"}
        end
      end
    end

    def request(url) when url == ~s(http://www.fakeresponse.com/api/?data={"Foo":"Bar"}) do
      res = HTTPoison.get!(url)
      st = String.split(res,"\"")
      if Util.prev_num(st,"Foo") == "Foo" do
        if Util.prev_num(st,"Bar") == "Bar" do
          map = %{"Foo" => "Bar"}
        end
      end
    end
  end
end