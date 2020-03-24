# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.RecursionTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias CodeFlow.Recursion
  alias CodeFlow.Schemas.Customer
  alias CodeFlow.Schemas.OrderItem
  alias CodeFlow.Schemas.Item

  describe "order_total/1" do
    test "returns 0 for an empty list" do
      assert 0 == Recursion.order_total([])
    end

    test "sums the total for all OrderItems in a list" do
      order_items = [
        %OrderItem{quantity: 2, item: %Item{name: "Item 1", price: 5.00}},
        %OrderItem{quantity: 1, item: %Item{name: "Item 2", price: 8.75}},
        %OrderItem{quantity: 3, item: %Item{name: "Item 3", price: 2.50}},
        %OrderItem{quantity: 10, item: %Item{name: "Item 4", price: 11.00}},
        %OrderItem{quantity: 0, item: %Item{name: "Item 5", price: 1.00}}
      ]
      assert 136.25 == Recursion.order_total(order_items)
    end
  end

  describe "count_active/1" do
    test "returns 0 for empty list" do
      assert 0 == Recursion.count_active([])
    end

    test "returns correct count of active customers" do
      customers = [
        %Customer{name: "Cust 1", active: true},
        %Customer{name: "Cust 2", active: true},
        %Customer{name: "Cust 3", active: false},
        %Customer{name: "Cust 4", active: true},
      ]
      assert 3 == Recursion.count_active(customers)
    end
  end

  describe "create_customers/1" do
    test "does not create any when given 0" do
      assert "Created 0 customers!" == Recursion.create_customers(0)
      refute_received {:customer_created, _new_customer}
    end

    test "calls Customers.create/1 correct number of times" do
      assert "Created 3 customers!" == Recursion.create_customers(3)
      assert_received {:customer_created, _new_customer}
      assert_received {:customer_created, _new_customer}
      assert_received {:customer_created, _new_customer}
      refute_received {:customer_created, _new_customer}
    end

    test "returns text saying how many were created" do
      assert "Created 0 customers!" == Recursion.create_customers(0)
      assert "Created 1 customers!" == Recursion.create_customers(1)
      assert "Created 5 customers!" == Recursion.create_customers(5)
      assert "Created 10 customers!" == Recursion.create_customers(10)
      assert "Created 100 customers!" == Recursion.create_customers(100)
    end
  end

  describe "fibonacci/1" do
    test "computes the fibonacci sequence" do
      # implement a fibonnaci number sequence generator using pattern matching
      # and recursion.
      # Fibonacci series is described as Fib(n) = Fib(n-1) + Fib(n-2)
      # "n" is computed as the sum of the 2 numbers preceeding it.
      # Given the starting values where Fib(0) = 0 and Fib(1) = 1

      assert 0 == Recursion.fibonacci(0)
      assert 1 == Recursion.fibonacci(1)
      assert 1 == Recursion.fibonacci(2)
      assert 2 == Recursion.fibonacci(3)
      assert 3 == Recursion.fibonacci(4)
      assert 5 == Recursion.fibonacci(5)
      assert 8 == Recursion.fibonacci(6)
      assert 13 == Recursion.fibonacci(7)
      assert 21 == Recursion.fibonacci(8)
      assert 610 == Recursion.fibonacci(15)
      assert 10_946 == Recursion.fibonacci(21)
    end
  end
end
