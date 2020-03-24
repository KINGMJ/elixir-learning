# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.User do
  @moduledoc """
  User struct used in matching examples.
  """
  alias __MODULE__

  @enforce_keys [:name]
  defstruct [:name, :age, :hair, :gender, {:points, 0}, {:admin, false}, {:active, true}]

  @type t :: %User{
          name: String.t(),
          age: nil | integer(),
          hair: nil | String.t(),
          gender: nil | :male | :female,
          points: integer(),
          admin: boolean,
          active: boolean()
        }
end
