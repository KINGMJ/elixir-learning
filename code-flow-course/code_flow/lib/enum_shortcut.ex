# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.EnumShortcut do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Schemas.Customer
  # alias CodeFlow.Schemas.OrderItem

  # alias CodeFlow.Fake.Customers
  # alias CodeFlow.Schemas.OrderItem

  @doc """
  Create the desired number of customers. Provide the number of customers to
  create. Something like this could be used in a testing setup.
  """
  def create_customers(_number) do

  end

  @doc """
  Sum a list of OrderItems to compute the order total.
  """
  def order_total(_order_items) do

  end

  @doc """
  Count the number of active customers. Note: Normally this would be done with a
  query to an SQL database. This is just to practice conditionally incrementing
  a counter and looping using recursion.
  """
  def count_active(_customers) do

  end
end
