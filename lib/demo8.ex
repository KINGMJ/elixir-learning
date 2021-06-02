defmodule Player do
  defstruct [:username, :email, :score]
end

defmodule Car do
  @enforce_keys [:make]
  defstruct [:model, :make]
end
