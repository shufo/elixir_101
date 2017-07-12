defmodule Elixir101.API do
  def request(url) do
    {:ok, body} = HTTPoison.get!(url).body |> Poison.decode
    cond do
      body["data"] -> body["data"]
      body["error"] -> "Rate Limit exceeded!"
    end
  end
end
