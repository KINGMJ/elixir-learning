defmodule Greeting do
  import User

  def greet(%{age: age}) when is_kid(age), do: "Hiya"
  def greet(%{age: age}) when is_teen(age), do: "Whatever"
  def greet(%{age: age}) when is_elder(age), do: "You kids get off my lawn"
  def greet(_), do: "Hello"
end

defmodule User do
  defstruct age: 0

  defmacro is_kid(age) do
    quote do: 6 < unquote(age) and unquote(age) < 12
  end

  defmacro is_teen(age) do
    quote do: 12 < unquote(age) and unquote(age) < 18
  end

  defmacro is_elder(age) do
    quote do: 60 < unquote(age)
  end
end
