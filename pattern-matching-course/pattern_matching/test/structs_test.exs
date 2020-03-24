# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.StructsTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias PatternMatching.Structs
  # alias the structs
  alias PatternMatching.{Customer, User}

  setup _ do
    customer = %Customer{name: "Widgets 4 Sale"}
    user = %User{name: "Kris Rowe"}
    {:ok, customer: customer, user: user}
  end

  describe "get_name/1" do
    test "returns a User or Customer name", %{customer: customer, user: user} do
      assert {:ok, "Kris Rowe"} == Structs.get_name(user)
      assert {:ok, "Widgets 4 Sale"} == Structs.get_name(customer)
    end

    test "returns error when given something that doesn't have a name" do
      assert {:error, "Doesn't have a name"} == Structs.get_name(123)
      assert {:error, "Doesn't have a name"} == Structs.get_name(%{stuff: true})
    end
  end

  describe "create_greeting/1" do
    test "creates a unique greeting for a Customer and User", %{customer: customer, user: user} do
      assert {:ok, "Greetings user Kris Rowe!"} == Structs.create_greeting(user)
      assert {:ok, "Howdy customer Widgets 4 Sale!"} == Structs.create_greeting(customer)
    end

    test "does not create a greeting when inactive", %{customer: customer, user: user} do
      # make the customer and user inactive
      customer = %Customer{customer | active: false}
      user = %User{user | active: false}

      assert {:error, "Recipient is inactive"} == Structs.create_greeting(customer)
      assert {:error, "Recipient is inactive"} == Structs.create_greeting(user)
    end
  end

  describe "deactivate_user/1" do
    test "updates user to set active to false", %{user: user} do
      {:ok, %User{} = updated} = Structs.deactivate_user(user)
      assert updated.active == false
    end

    test "returns an error if not a user", %{customer: customer} do
      assert {:error, "Not a User"} == Structs.deactivate_user(customer)
      assert {:error, "Not a User"} == Structs.deactivate_user(123)
    end
  end
end
