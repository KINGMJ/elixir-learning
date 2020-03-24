# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.WithTest do
  @moduledoc """
  Complete the code to make the tests pass. Use a `with` statement to perform
  the workflow.
  """
  use ExUnit.Case
  alias CodeFlow.Schemas.Order
  alias CodeFlow.With

  describe "place_new_order/3" do
    test "returns newly placed order" do
      customer_id = 1
      item_id = 10
      qty = 1
      {:ok, %Order{} = order} = With.place_new_order(customer_id, item_id, qty)
      assert order.customer.id == customer_id
      assert length(order.order_items) == 1
      [order_item] = order.order_items
      assert order_item.item.id == item_id
      assert order_item.quantity == qty
    end

    test "notifies customer that order was placed" do
      customer_id = 1
      item_id = 10
      qty = 1
      {:ok, _order} = With.place_new_order(customer_id, item_id, qty)
      # Working with a test/mock interface. That interface sends a message to
      # the process running the test. We assert that we received that message.
      assert_received {:notify, {:order_placed, received_order}}
      assert %Order{} = received_order
    end

    test "returns timed-out message as text" do
      {:error, reason} = With.place_new_order(5, 10, 1)
      assert reason == "Timed out attempting to notify customer"
    end

    test "failure to notify customer when email missing" do
      {:error, reason} = With.place_new_order(3, 10, 1)
      assert reason == "Customer contact email missing"
    end

    test "fails when customer not found" do
      {:error, reason} = With.place_new_order(100, 10, 1)
      assert reason == "Customer not found"
    end

    test "fails when item not found" do
      {:error, reason} = With.place_new_order(1, 100, 1)
      assert reason == "Item not found"
    end

    test "fails when ordering customer is inactive" do
      {:error, reason} = With.place_new_order(4, 10, 1)
      assert reason == "Cannot create order for inactive customer"
    end

    test "fails when item being ordered is inactive" do
      {:error, reason} = With.place_new_order(2, 30, 1)
      assert reason == "Cannot order an inactive item"
    end
  end
end
