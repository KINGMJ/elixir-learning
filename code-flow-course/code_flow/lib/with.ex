# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.With do
  @moduledoc """
  Defining a workflow or "Code Flow" using a `with` statement.
  """
  alias CodeFlow.Schemas.Order
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Fake.Orders
  alias CodeFlow.Fake.Items

  @spec place_new_order(customer_id :: integer, item_id :: integer, quantity :: integer) ::
          {:ok, Order.t()} | {:error, String.t()}

  def place_new_order(customer_id, item_id, quantity) do
    with {:ok, customer} <- Customers.find(customer_id),
         {:ok, item} <- Items.find(item_id),
         {:ok, order} <- Orders.new(customer),
         {:ok, order} <- Orders.add_item(order, item, quantity),
         :ok <- Customers.notify(customer, {:order_placed, order}) do
      {:ok, order}
    else
      {:error, :timeout} -> {:error, "Timed out attempting to notify customer"}
      error -> error
    end
  end
end
