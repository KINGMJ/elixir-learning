# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Schemas.OrderItem do
  @moduledoc """
  Simplified non-database struct that represents an OrderItem. Used for examples.
  """
  alias __MODULE__
  alias CodeFlow.Schemas.Item

  defstruct [
    :item,
    {:quantity, 0}
  ]

  @type t :: %OrderItem{
          item: nil | Item.t(),
          quantity: integer()
        }
end
