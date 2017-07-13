defmodule Elixir101.API do
  alias HTTPoison.Response
  @success_code 200..299
  @client_error_code 400..499

  def request(url) do
    """
    {:ok, body} = HTTPoison.get!(url).body |> Poison.decode
    cond do
      body["data"] -> body["data"]
      body["error"] -> "Rate Limit exceeded!"
      true -> "Something went wrong!!!"
    end
    """

    with {:ok, %Response{status_code: status_code, body: body}}
          when status_code in @success_code <- HTTPoison.get(url),
          {:ok, %{"data" => parsed_data}} <- Poison.decode(body)
    do
      parsed_data
    else
      {:ok, %Response{status_code: status_code}}
      when status_code in @client_error_code -> "Rate Limit exceeded!"
      _ -> "Something went wrong!!!"
    end
  end
end
