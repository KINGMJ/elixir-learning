# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Fake.Orders do
  @moduledoc """
  Fake interface for working with Orders. This gives a more realistic API
  interface without worrying about databases. Keeps us focused on the code we
  are working on.
  """
  alias CodeFlow.Schemas.Order
  alias CodeFlow.Schemas.OrderItem
  alias CodeFlow.Schemas.Customer
  alias CodeFlow.Schemas.Item

  @doc """
  Start a new Order for a customer. Does not allow ordering for an inactive customer.
  """
  @spec new(Customer.t()) :: {:ok, Order.t()} | {:error, String.t()}
  def new(%Customer{active: true} = customer) do
    new_id = :erlang.unique_integer([:positive, :monotonic])
    {:ok, %Order{id: new_id, customer: customer}}
  end

  def new(%Customer{} = _customer) do
    {:error, "Cannot create order for inactive customer"}
  end

  @doc """
  Add an item to an order. Includes the provided quantity. Does not allow order
  an inactive item. Returns an updated Order with the item added to the
  "order_items" list.
  """
  @spec add_item(Order.t(), Item.t(), quantity :: integer()) ::
          {:ok, Order.t()} | {:error, String.t()}
  def add_item(%Order{} = order, %Item{active: true} = item, quantity) do
    new_order_item = %OrderItem{item: item, quantity: quantity}
    updated_order = %Order{order | order_items: [new_order_item | order.order_items]}
    {:ok, updated_order}
  end

  def add_item(%Order{} = _order, %Item{active: false} = _item, _quantity) do
    {:error, "Cannot order an inactive item"}
  end

  @doc """
  Find and return an order by the ID. If not found, raises an exception.
  """
  def find!(id) when is_integer(id) and id < 0 do
    raise "Database connection failure!"
  end

  def find!(id) do
    customer = %Customer{id: 1, name: "Fake Customer"}

    database = %{
      30 => %Order{id: 30, customer: customer},
      31 => %Order{id: 31, customer: customer}
    }

    case Map.get(database, id) do
      nil -> raise("Order not found")
      %Order{} = order -> order
    end
  end
end
