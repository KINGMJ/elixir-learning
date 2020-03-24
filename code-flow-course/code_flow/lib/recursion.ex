# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Recursion do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Schemas.OrderItem

  @doc """
  Sum a list of OrderItems to compute the order total.
  """
  def order_total(order_items) do
    do_order_total(order_items, 0)
  end

  def do_order_total([head | tail], sum) do
    do_order_total(tail, head.quantity * head.item.price + sum)
  end

  def do_order_total([], sum) do
    sum
  end

  @doc """
  Count the number of active customers. Note: Normally this would be done with a
  query to an SQL database. This is just to practice conditionally incrementing
  a counter and looping using recursion.
  """
  def count_active(customers) do
    do_count_active(customers, 0)
  end

  def do_count_active([head | tail], num) do
    case head.active do
      true    ->  do_count_active(tail, num + 1)
      _       ->  do_count_active(tail, num)
    end
  end

  def do_count_active([], num) do
    num
  end

  @doc """
  Create the desired number of customers. Provide the number of customers to
  create. Something like this could be used in a testing setup.
  """
  def create_customers(number) do
    do_create_customers(number, 0)
  end

  def do_create_customers(number, times) when times < number do
    {:ok, _customer} = Customers.create(%{name: "Customer #{times}"})
    do_create_customers(number, times + 1)
  end

  def do_create_customers(number, _times) do
    "Created #{number} customers!"
  end

  @doc """
  Compute the value in the Fibonacci sequence for the number. If the number is
  "10", then the result is 10 plus the value of the 9th index of the fibonacci
  sequence.
  https://en.wikipedia.org/wiki/Fibonacci_number
  """
  def fibonacci(_num) do

  end
end
