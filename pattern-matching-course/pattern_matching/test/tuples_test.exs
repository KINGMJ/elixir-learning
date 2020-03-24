# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.TuplesTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias PatternMatching.Tuples

  describe "day_from_date/1" do
    test "returns the day number from an erlang date" do
      assert 5 == Tuples.day_from_date({2018, 9, 5})
      assert 10 == Tuples.day_from_date({2018, 9, 10})
    end
  end

  describe "has_three_elements?/1" do
    test "return true for 3 element tuples" do
      assert true == Tuples.has_three_elements?({:ok, 100, 200})
      assert true == Tuples.has_three_elements?({:ok, :dokey, :do})
      assert true == Tuples.has_three_elements?({10, 100, 1000})
      assert false == Tuples.has_three_elements?({10, 100})
      assert false == Tuples.has_three_elements?({10})
      assert false == Tuples.has_three_elements?({1, 2, 3, 4})
    end
  end

  describe "major_us_holiday/1" do
    test "return major US holiday for the month" do
      assert "Christmas" = Tuples.major_us_holiday({2018, 12, 4})
      assert "Christmas" = Tuples.major_us_holiday({2017, 12, 14})
      assert "Christmas" = Tuples.major_us_holiday({1984, 12, 24})
      assert "4th of July" = Tuples.major_us_holiday({2018, 7, 30})
      assert "4th of July" = Tuples.major_us_holiday({2020, 7, 3})
      assert "New Years" = Tuples.major_us_holiday({2018, 1, 24})
      assert "New Years" = Tuples.major_us_holiday({2019, 1, 20})
      assert "Uh..." = Tuples.major_us_holiday({2018, 2, 4})
      assert "Uh..." = Tuples.major_us_holiday({2018, 3, 4})
      assert "Uh..." = Tuples.major_us_holiday({2015, 4, 4})
      assert "Uh..." = Tuples.major_us_holiday({2030, 5, 4})
    end
  end

  describe "greet_user/1" do
    test "greets when user was found" do
      assert "Hello Jim!" == Tuples.greet_user({:ok, "Jim"})
      assert "Hello Gwen!" == Tuples.greet_user({:ok, "Gwen"})
    end

    test "does not greet when there was an error" do
      assert "Cannot greet" == Tuples.greet_user({:error, "User not found"})
      assert "Cannot greet" == Tuples.greet_user({:error, "Failed to connect to DB"})
    end
  end

  describe "add_to_result/1" do
    test "adds 10 to the result return in :ok tuple" do
      assert {:ok, 15} == Tuples.add_to_result({:ok, 5})
      assert {:ok, 10} == Tuples.add_to_result({:ok, 0})
      assert {:ok, 100} == Tuples.add_to_result({:ok, 90})
    end

    test "returns unmodified when not :ok" do
      expected = {:error, "It had problems"}
      assert ^expected = Tuples.add_to_result(expected)

      expected = {:error, 9}
      assert ^expected = Tuples.add_to_result(expected)
    end
  end
end
