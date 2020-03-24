# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Keywords do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Schemas.Item

  def rounded(value, opts \\ []) do
    Float.round(value, opts[:decimals] || 4)
  end

  def unit_price(%Item{price: price, quantity: quantity}, opts \\ []) do
    case opts[:mode] do
      :money    -> :erlang.float_to_binary(price/quantity, decimals: 2)
      _         -> price/quantity
    end
  end
end
