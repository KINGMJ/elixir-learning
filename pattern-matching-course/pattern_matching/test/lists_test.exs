# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.ListsTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.

  In functional programming, the use of recursion is often used for processing
  a list of items. For this reason, being comfortable with list matching is
  important.
  """
  use ExUnit.Case
  alias PatternMatching.Lists

  describe "is_empty?/1" do
    test "match an empty list" do
      assert true == Lists.is_empty?([])
      assert false == Lists.is_empty?(["hello"])
      assert false == Lists.is_empty?([1, 2, 3])

      assert false == Lists.is_empty?("not even a list!")
    end
  end

  describe "has_1_item?/1" do
    test "match a list with exactly 1 item" do
      assert true == Lists.has_1_item?([1])
      assert false == Lists.has_1_item?([])
      assert false == Lists.has_1_item?([1, 2, 3])
      assert true == Lists.has_1_item?(["one thing"])
    end
  end

  describe "at_least_one?/1" do
    test "match a list with at least 1 item" do
      assert true == Lists.at_least_one?([1])
      assert false == Lists.at_least_one?([])
      assert true == Lists.at_least_one?([1, 2, 3])
      assert true == Lists.at_least_one?(["one thing"])
      assert true == Lists.at_least_one?([3, 4, 5, 6, 7, 8])
    end
  end

  describe "return_first_item/1" do
    test "return the 1st item in list" do
      assert 1 == Lists.return_first_item([1])
      assert :error == Lists.return_first_item([])
      assert 10 == Lists.return_first_item([10, 20, 30])
    end
  end

  describe "starts_with_1?/1" do
    test "match lists that start with 1" do
      assert true == Lists.starts_with_1?([1, 2, 3])
      assert false == Lists.starts_with_1?([0, 1, 2])
      assert true == Lists.starts_with_1?([1])
      assert false == Lists.starts_with_1?([])
      assert true == Lists.starts_with_1?([1, 100, 1000])
    end
  end

  describe "sum_pair/1" do
    test "sums items in list when exactly 2 items" do
      assert 3 == Lists.sum_pair([1, 2])
      assert 10 == Lists.sum_pair([5, 5])
      assert :error == Lists.sum_pair([])
      assert :error == Lists.sum_pair([1])
      assert :error == Lists.sum_pair([1, 2, 3])
    end
  end

  describe "sum_first_2/1" do
    test "replace the first 2 items of a list with their sum" do
      assert [9, 3, 2, 1] == Lists.sum_first_2([5, 4, 3, 2, 1])
      assert [3, 3] == Lists.sum_first_2([1, 2, 3])
      assert [1] == Lists.sum_first_2([0, 1])

      # returns list if fewer than 2
      assert [1] == Lists.sum_first_2([1])
      assert [] == Lists.sum_first_2([])
    end
  end
end
