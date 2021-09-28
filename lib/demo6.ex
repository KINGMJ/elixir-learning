defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Example do
  import Sayings.Greetings

  def print_message(name), do: basic(name)
end

defmodule Example1 do
  alias Sayings.Greetings, as: Hi

  def print_message(name), do: Hi.basic(name)
end
