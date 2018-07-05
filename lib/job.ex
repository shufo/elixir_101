defmodule Elixir101.Job do

  def async(task) do
    t = Task.async(task)
    Task.await(t)
  end
end
