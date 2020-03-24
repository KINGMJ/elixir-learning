# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Schemas.User do
  @moduledoc """
  Simplified non-database struct that represents a User. Used for examples.
  """
  alias __MODULE__

  @enforce_keys [:name]
  defstruct [:id, :name, :age, :hair, {:points, 0}, {:admin, false}, {:active, true}]

  @type t :: %User{
          id: nil | integer(),
          name: String.t(),
          age: nil | integer(),
          hair: nil | String.t(),
          points: integer(),
          admin: boolean(),
          active: boolean()
        }
end
