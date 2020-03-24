# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Railway do
  @moduledoc """
  Defining a workflow or "Code Flow" using the Railway Pattern.
  """
  alias CodeFlow.Schemas.User

  @doc """
  Works well when the functions are designed to pass the output of one
  step as the input of the next function.
  """
 def award_points(%User{} = user, inc_point_value) do
    user
    |> validate_is_active()
    |> validate_at_least_age(16)
    |> check_name_blacklist()
    |> increment_points(inc_point_value)
  end

  # Steps implemented using the above names

  def validate_is_active(%User{active: true} = user) do
    {:ok, user}
  end

  def validate_is_active(_user) do
    {:error, "Not an active User"}
  end

  def validate_at_least_age({:ok, %User{age: age} = user}, cutoff_age) when age >= cutoff_age do
    {:ok, user}
  end

  def validate_at_least_age({:ok, _user}, _cutoff_age) do
    {:error, "User age is below the cutoff"}
  end

  def validate_at_least_age(error, _cutoff_age), do: error

  def check_name_blacklist({:ok, %User{name: name} = _user})
      when name in ["Tom", "Tim", "Tammy"] do
    {:error, "User #{inspect(name)} is blacklisted"}
  end

  def check_name_blacklist({:ok, %User{} = user}) do
    {:ok, user}
  end

  def check_name_blacklist({:error, _reason} = error), do: error

  def increment_points({:ok, %User{points: points} = user}, inc_by) do
    {:ok, %User{user | points: points + inc_by}}
  end

  def increment_points(error, _inc_by), do: error
end
