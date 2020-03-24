# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Fake.Items do
  @moduledoc """
  Fake interface for working with Items. This gives a more realistic API
  interface without worrying about databases. Keeps us focused on the code we
  are working on.
  """
  alias CodeFlow.Schemas.Item

  @doc """
  Find an item by it's unique ID.

  NOTE: This only provides canned data for use in the examples and practice
  exercises.
  """
  @spec find(id :: integer()) :: {:ok, Item.t()} | {:error, String.t()}
  def find(id) when is_integer(id) do
    database = %{
      10 => %Item{id: 10, name: "Premium Clown Noses, 20 pc", weight: 1.5},
      20 => %Item{id: 20, name: "Party Streamers", weight: 1.0},
      30 => %Item{id: 30, name: "[INACTIVE] Cleaning Gloves", weight: 0.5, active: false}
    }

    case Map.get(database, id) do
      nil -> {:error, "Item not found"}
      %Item{} = item -> {:ok, item}
    end
  end

end
