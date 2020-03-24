# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Schemas.Item do
  @moduledoc """
  Simplified non-database struct that represents an Item. Used for examples.
  """
  alias __MODULE__

  defstruct [
    :id,
    :name,
    {:price, 0.0},
    {:weight, 0.0},
    {:quantity, 1},
    {:active, true}
  ]

  @type t :: %Item{
          id: nil | integer(),
          name: nil | String.t(),
          price: float(),
          quantity: integer(),
          weight: float(),
          active: boolean()
        }
end
