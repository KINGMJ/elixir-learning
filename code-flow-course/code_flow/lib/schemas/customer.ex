# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Schemas.Customer do
  @moduledoc """
  Simplified non-database struct that represents a Customer. Used for examples.
  """
  alias __MODULE__

  defstruct [
    :id,
    :name,
    :location,
    :contact_name,
    :contact_email,
    {:orders, []},
    {:active, true}
  ]

  @type t :: %Customer{
          id: nil | integer(),
          name: nil | String.t(),
          location: nil | String.t(),
          contact_name: nil | String.t(),
          contact_email: nil | String.t(),
          orders: list(),
          active: boolean()
        }
end
