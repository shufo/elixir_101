defmodule Elixir101.Job do
  def async(function) do
    task = Task.async(function)
    Task.await(task)
  end
end
