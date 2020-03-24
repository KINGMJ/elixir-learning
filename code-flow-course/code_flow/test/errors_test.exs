# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.ErrorsTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias CodeFlow.Errors
  alias CodeFlow.Schemas.User
  alias CodeFlow.Schemas.Order

  describe "find_user!/1" do
    test "returns the user directly when found" do
      %User{} = user = Errors.find_user!(1)
      assert user.id == 1
    end

    test "raises an exception when not found" do
      assert_raise RuntimeError, "User not found", fn ->
        Errors.find_user!(99)
      end

      assert_raise RuntimeError, "Database connection failure!", fn ->
        Errors.find_user!(-1)
      end
    end
  end

  describe "find_order/1" do
    test "returns the order as an :ok tuple when found" do
      {:ok, %Order{} = order} = Errors.find_order(30)
      assert order.id == 30
    end

    test "returns an :error tuple when not found with expected message" do
      {:error, reason} = Errors.find_order(99)
      assert reason == "Order not found"

      {:error, reason} = Errors.find_order(-1)
      assert reason == "Database connection failure!"
    end
  end
end
