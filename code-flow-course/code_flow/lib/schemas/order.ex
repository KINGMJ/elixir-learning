# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Schemas.Order do
  @moduledoc """
  Simplified non-database struct that represents an Order. Used for examples.
  """
  alias __MODULE__

  defstruct [
    :id,
    :customer,
    {:order_items, []},
    {:active, true}
  ]

  @type t :: %Order{
          id: nil | integer(),
          customer: nil | Customer.t(),
          order_items: [OrderItem.t()],
          active: boolean()
        }
end
