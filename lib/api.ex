defmodule Elixir101.API do
  def request(url) do
    try do
      response = HTTPoison.get!(url)
      body = response.body
      b = Poison.decode!( body )

      Map.fetch!(b, "data")
    rescue
      e -> IO.puts("Rate Limit exceeded!")
    end
  end
end
