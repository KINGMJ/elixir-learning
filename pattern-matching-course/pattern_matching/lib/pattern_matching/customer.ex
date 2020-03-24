# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.Customer do
  @moduledoc """
  Customer struct used in matching examples.
  """
  alias __MODULE__

  @enforce_keys [:name]
  defstruct [:name, :location, :contact_name, :contact_number, {:orders, []}, {:active, true}]

  @type t :: %Customer{
          name: String.t(),
          location: nil | String.t(),
          contact_name: nil | String.t(),
          contact_number: nil | String.t(),
          orders: list(),
          active: boolean()
        }
end
