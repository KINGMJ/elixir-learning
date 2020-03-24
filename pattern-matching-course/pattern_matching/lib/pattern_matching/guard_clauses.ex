# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.GuardClauses do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias PatternMatching.User

  def return_numbers(value) when is_number(value), do: value

  def return_numbers(_value), do: :error

  def return_lists(value) when is_list(value), do: value

  def return_lists(_value), do: :error

  def return_any_size_tuples(value) when is_tuple(value), do: value

  def return_any_size_tuples(_value), do: :error

  def return_maps(value) when is_map(value), do: value

  def return_maps(_value), do: :error

  def run_function(value) when is_function(value), do: value.()

  def run_function(_value), do: :error

  def classify_user(%User{age: age}) when age < 0, do: {:error, "Age cannot be negative"}

  def classify_user(%User{age: age}) when age < 18, do: {:ok, :minor}

  def classify_user(%User{age: age}) when is_nil(age), do: {:error, "Age missing"}

  def classify_user(%User{}), do: {:ok, :adult}

  def classify_user(_user), do: {:error, "Not a user"}

  def award_child_points(%User{age: user_age} = user, max_age, points) when user_age <= max_age do
    %User{user | points: user.points + points}
  end

  def award_child_points(user, _, _), do: user

end
