defprotocol Utility do
  @spec type(t) :: String.t()
  @fallback_to_any true
  def type(value)
end

defimpl Utility, for: Any do
  def type(_value), do: "any"
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end

defmodule User do
  @derive [Utility]
  defstruct [:name, :age]
end

# iex> Utility.type("jack")
# "string"
# iex> Utility.type(123)
# "integer"
# iex> Utility.type([])
# "any"
