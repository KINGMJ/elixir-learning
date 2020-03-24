# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Fake.Customers do
  @moduledoc """
  Fake interface for working with Customers. This gives a more realistic API
  interface without worrying about databases. Keeps us focused on the code we
  are working on.
  """
  alias CodeFlow.Schemas.Customer
  alias CodeFlow.Schemas.Order

  @customer_db %{
    1 => %Customer{
      id: 1,
      name: "Squiggles and Blopps",
      contact_name: "Sally",
      contact_email: "sally@example.com"
    },
    2 => %Customer{
      id: 2,
      name: "ACME, Inc",
      contact_name: "Gary",
      contact_email: "gary@example.com"
    },
    3 => %Customer{
      id: 3,
      name: "Clown Supply Store",
      contact_name: "Howard",
      contact_email: nil
    },
    4 => %Customer{
      id: 4,
      name: "[INACTIVE] Lethargy Inc",
      contact_name: "Lucy",
      contact_email: "lucy@example.com",
      active: false
    },
    5 => %Customer{
      id: 5,
      name: "Always Broken, Co.",
      contact_name: "Bruce",
      contact_email: "bruce@example.com"
    }
  }

  @doc """
  A simplified simulation of a Repo.one/2 call. Takes an ID, looks up the
  Customer entry. If not found, a `nil` is returned.
  """
  @spec one(id :: integer) :: nil | Customer.t()
  def one(id) do
    Map.get(@customer_db, id)
  end

  @doc """
  Find a customer by it's unique ID.

  NOTE: This only provides canned data for use in the examples and practice
  exercises.
  """
  @spec find(id :: integer()) :: {:ok, Customer.t()} | {:error, String.t()}
  def find(id) when is_integer(id) do
    case Map.get(@customer_db, id) do
      nil -> {:error, "Customer not found"}
      %Customer{} = customer -> {:ok, customer}
    end
  end

  @doc """
  Create a customer from the params.

  This only provides a fake interface for creating a customer. It is actually
  sending a message to the process executing the test. The test process is
  verifying that the expected side-effects were created. In a real system, this
  would actually create entries in a database.
  """
  @spec create(params :: map) :: {:ok, Customer.t()} | {:error, String.t()}
  def create(%{name: name} = _params) when is_binary(name) do
    new_customer = %Customer{name: name}
    send(self(), {:customer_created, new_customer})
    {:ok, new_customer}
  end

  def create(_params) do
    {:error, "Customer `name` is required"}
  end

  @type event :: {atom(), any()}

  @doc """
  Notify a customer that an event occurred. The event is a tuple of the event
  name/type and any related data.

  NOTE: This only provides a mock interface for the practice examples. This
  sends a message to the process running the code, in the case of tests, it will
  be the test runner process. The test uses this message passing to observe that
  a created side-effect was triggered correctly. In a "real" system, you might
  instead observe the side-effects of a created email, SMS, etc.
  """
  @spec notify(Customer.t(), event) :: :ok | {:error, String.t() | :timeout}
  def notify(%Customer{contact_email: nil} = _customer, _event),
    do: {:error, "Customer contact email missing"}

  def notify(%Customer{id: 5} = _customer, _event),
    do: {:error, :timeout}

  def notify(%Customer{} = _customer, {:order_placed, %Order{} = _order} = event) do
    send(self(), {:notify, event})
    :ok
  end
end
