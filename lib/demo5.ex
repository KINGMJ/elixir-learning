# 使用alias
defmodule Example do
  alias Sayings.Greetings

  def print_message(name), do: Greetings.basic(name)
end

# 不使用alias
defmodule Example1 do
  def print_message(name), do: Sayings.Greetings.basic(name)
end

# 指定别名
defmodule Example2 do
  alias Sayings.Greetings, as: Hi

  def print_message(name), do: Hi.basic(name)
end

# 使用多个alias
defmodule Example3 do
  alias Sayings.{Greetings, Farewells}

  def print_message(name), do: Farewells.basic(name)
end

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Sayings.Farewells do
  def basic(name), do: "Bye, #{name}"
end
