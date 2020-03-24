# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.GuardClausesTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias PatternMatching.User
  alias PatternMatching.GuardClauses

  describe "return_numbers/1" do
    test "returns value or error" do
      assert 1.5 == GuardClauses.return_numbers(1.5)
      assert 100.99 == GuardClauses.return_numbers(100.99)
      assert 10 == GuardClauses.return_numbers(10)
      assert -500 == GuardClauses.return_numbers(-500)

      assert :error == GuardClauses.return_numbers("1.5")
      assert :error == GuardClauses.return_numbers(:an_atom)
      assert :error == GuardClauses.return_numbers(%{name: "Tammy"})
    end
  end

  describe "return_lists/1" do
    test "returns value or error" do
      assert [10, 1.5] == GuardClauses.return_lists([10, 1.5])
      assert [] == GuardClauses.return_lists([])
      assert [1, 2, 3] == GuardClauses.return_lists([1, 2, 3])

      assert :error == GuardClauses.return_lists("1.5")
      assert :error == GuardClauses.return_lists(10)
      assert :error == GuardClauses.return_lists(10.75)
      assert :error == GuardClauses.return_lists(:ok)
    end
  end

  describe "return_any_size_tuples/1" do
    test "returns value or error" do
      assert {:ok, 1} == GuardClauses.return_any_size_tuples({:ok, 1})
      assert {1, 2, 3} == GuardClauses.return_any_size_tuples({1, 2, 3})
      assert {"a"} == GuardClauses.return_any_size_tuples({"a"})
      assert {:ok, 2018, 12, 25} == GuardClauses.return_any_size_tuples({:ok, 2018, 12, 25})

      assert :error == GuardClauses.return_any_size_tuples("1.5")
      assert :error == GuardClauses.return_any_size_tuples(1.4)
      assert :error == GuardClauses.return_any_size_tuples(:ok)
      assert :error == GuardClauses.return_any_size_tuples([1, 2, 3])
    end
  end

  describe "return_maps/1" do
    test "returns value or error" do
      assert %{name: "Jim"} == GuardClauses.return_maps(%{name: "Jim"})
      assert %{name: "Tammy"} == GuardClauses.return_maps(%{name: "Tammy"})
      assert %{email: "j@example.com"} == GuardClauses.return_maps(%{email: "j@example.com"})
      assert %{} == GuardClauses.return_maps(%{})

      assert :error == GuardClauses.return_maps({:ok, "valid"})
      assert :error == GuardClauses.return_maps("1.5")
      assert :error == GuardClauses.return_maps(1.4)
      assert :error == GuardClauses.return_maps(:ok)
      assert :error == GuardClauses.return_maps([1, 2, 3])
    end
  end

  describe "run_function/1" do
    test "returns the result of the function or error" do
      fun = fn -> :ok end
      assert :ok == GuardClauses.run_function(fun)

      assert "I ran!!" == GuardClauses.run_function(fn -> "I ran!!" end)

      assert :error == GuardClauses.run_function("ok?")
      assert :error == GuardClauses.run_function([1, 2, 3])
    end
  end

  describe "classify_user/1" do
    test "idenitifies minors" do
      assert {:ok, :minor} == GuardClauses.classify_user(%User{name: "Jill", age: 10})
      assert {:ok, :minor} == GuardClauses.classify_user(%User{name: "Bill", age: 17})
      assert {:ok, :minor} == GuardClauses.classify_user(%User{name: "Annie", age: 7})
    end

    test "identifies legal US adults" do
      assert {:ok, :adult} == GuardClauses.classify_user(%User{name: "Tom", age: 50})
      assert {:ok, :adult} == GuardClauses.classify_user(%User{name: "Mary", age: 35})
      assert {:ok, :adult} == GuardClauses.classify_user(%User{name: "Lizzie", age: 18})
    end

    test "returns error when not a user" do
      assert {:error, "Not a user"} == GuardClauses.classify_user(10)
      assert {:error, "Not a user"} == GuardClauses.classify_user("I'm a user")
      assert {:error, "Not a user"} == GuardClauses.classify_user({:ok, "Let me in"})
    end

    test "returns error when age not provided" do
      assert {:error, "Age missing"} == GuardClauses.classify_user(%User{name: "Adam"})
      assert {:error, "Age missing"} == GuardClauses.classify_user(%User{name: "Dave", age: nil})
    end

    test "returns error when age is negative" do
      assert {:error, "Age cannot be negative"} == GuardClauses.classify_user(%User{name: "Steve", age: -1})
      assert {:error, "Age cannot be negative"} == GuardClauses.classify_user(%User{name: "Sally", age: -50})
    end
  end

  describe "award_child_points/3" do
    setup _ do
      timmy = %User{name: "Little Timmy", age: 11, points: 100, gender: :male}
      grace = %User{name: "Grace", age: 13, points: 200, gender: :female}
      [timmy: timmy, grace: grace]
    end

    test "when user's age is <= age cutoff, increase user's points by x amount", %{timmy: timmy, grace: grace} do
      # test at the boundary condition
      expected_points = timmy.points + 100
      assert %User{points: ^expected_points} = GuardClauses.award_child_points(timmy, 11, 100)
      # test below the boundary
      expected_points = grace.points + 100
      assert %User{points: ^expected_points} = GuardClauses.award_child_points(grace, 15, 100)
    end

    test "when user's age is older than the cutoff, return user unmodified", %{grace: grace} do
      assert grace.age == 13
      assert grace == GuardClauses.award_child_points(grace, 10, 2000)
      assert grace == GuardClauses.award_child_points(grace, 11, 2000)
      assert grace == GuardClauses.award_child_points(grace, 12, 2000)
    end
  end
end
