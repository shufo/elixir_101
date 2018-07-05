defmodule Elixir101.API do

  def request(url) do
    # 帰ってきたjsonのdataを返す
    response = HTTPoison.get!(url)
    body = response.body
    decoded_body = Poison.decode!(body)

    if decoded_body["error"] != nil do
      "Rate Limit exceeded!"
    else
      decoded_body["data"]
    end

  end
end
