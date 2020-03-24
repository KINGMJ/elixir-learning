# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.Tuples do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """

  def day_from_date(_erl_date) do
    {_, _, day} = _erl_date
    day
  end

  def has_three_elements?({_, _, _}) do
    true
  end

  def has_three_elements?(_tuple) do
    false
  end

  def major_us_holiday({_, month, _}) do
    case month do
      12      -> "Christmas"
      7       -> "4th of July"
      1       -> "New Years"
      _       -> "Uh..."
    end
  end

  def greet_user({:ok, name}), do: "Hello #{name}!"

  def greet_user({:error, _}), do: "Cannot greet"

  def add_to_result({:ok, number}), do: {:ok, number + 10}

  def add_to_result(error), do: error

end
