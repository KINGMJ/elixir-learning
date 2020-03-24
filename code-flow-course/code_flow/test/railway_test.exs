# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.RailwayTest do
  @moduledoc """
  Complete the code to make the tests pass. Use the Railway Pattern to create
  steps in the workflow.
  """
  use ExUnit.Case
  alias CodeFlow.Schemas.User
  alias CodeFlow.Railway

  # INSTRUCTIONS:
  # =============
  # - Reject User's who are not active.
  # - Reject User's who's age is < 16.
  # - Reject User's who's name is in the hardcoded blacklist ["Tom", "Tim", "Tammy"].
  # - Increment the all other user's points by 100

  describe "award_points/2" do
    test "increments valid user's points by the desired amount" do
      user = %User{name: "Howard", active: true, points: 0, age: 22}
      {:ok, %User{} = updated_user} = Railway.award_points(user, 100)
      assert updated_user.points == 100

      {:ok, %User{points: 120}} = Railway.award_points(updated_user, 20)
    end

    test "rejects inactive users" do
      {:error, reason} = Railway.award_points(%User{name: "Howard", active: false}, 10)
      assert reason == "Not an active User"
    end

    test "rejects under-age users" do
      {:error, reason} = Railway.award_points(%User{name: "Howard", active: true, age: 15}, 10)
      assert reason == "User age is below the cutoff"
    end

    test "rejects users on the blacklist" do
      blacklist = ["Tom", "Tim", "Tammy"]
      Enum.each(blacklist, fn(name) ->
        user = %User{name: name, active: true, age: 20}
        {:error, reason} = Railway.award_points(user, 10)
        assert reason == "User #{inspect(name)} is blacklisted"
      end)
    end
  end

  ###
  ### For a more explicit walk-through on the suggested steps, use the following
  ### tests as a guide. The individual functions could be either public or private
  ### and may or may not be tested individually.
  ###

  describe "validate_is_active/1" do
    test "returns {:ok, user} when active" do
      user = %User{name: "Tom", active: true}
      assert {:ok, user} == Railway.validate_is_active(user)
    end

    test "returns error when not an active user" do
      user = %User{name: "Tom", active: false}
      assert {:error, "Not an active User"} == Railway.validate_is_active(user)
      assert {:error, "Not an active User"} == Railway.validate_is_active(123)
    end
  end

  describe "validate_at_least_age/2" do
    test "returns {:ok, user} when meets age requirement" do
      user = %User{name: "Tom", active: true, age: 10}
      assert {:ok, user} == Railway.validate_at_least_age({:ok, user}, 1)
      assert {:ok, user} == Railway.validate_at_least_age({:ok, user}, 9)
      assert {:ok, user} == Railway.validate_at_least_age({:ok, user}, 10)
    end

    test "returns error when does not meet age requirement" do
      user = %User{name: "Tom", active: true, age: 9}
      assert {:error, "User age is below the cutoff"} == Railway.validate_at_least_age({:ok, user}, 10)
      assert {:error, "User age is below the cutoff"} == Railway.validate_at_least_age({:ok, user}, 11)
      assert {:error, "User age is below the cutoff"} == Railway.validate_at_least_age({:ok, user}, 30)
      # passes through whatever given from higher level
      assert {:error, "other stuff"} == Railway.validate_at_least_age({:error, "other stuff"}, 20)
      assert "not a user" == Railway.validate_at_least_age("not a user", 20)
    end
  end

  describe "check_name_blacklist/1" do
    test "returns {:ok, user} when name not in blacklist" do
      user1 = %User{name: "Joan"}
      user2 = %User{name: "Howard"}
      user3 = %User{name: "Ben"}
      assert {:ok, user1} == Railway.check_name_blacklist({:ok, user1})
      assert {:ok, user2} == Railway.check_name_blacklist({:ok, user2})
      assert {:ok, user3} == Railway.check_name_blacklist({:ok, user3})
    end

    test "returns error when name is in blacklist" do
      blacklist = ["Tom", "Tim", "Tammy"]
      Enum.each(blacklist, fn(name) ->
        user = %User{name: name}
        {:error, reason} = Railway.check_name_blacklist({:ok, user})
        assert reason == "User #{inspect(name)} is blacklisted"
      end)
    end
  end

  describe "increment_points/2" do
    test "increments points by desired amount" do
      user = %User{name: "Steve", age: 50, points: 200}
      assert {:ok, %User{points: 220}} = Railway.increment_points({:ok, user}, 20)
      assert {:ok, %User{points: 195}} = Railway.increment_points({:ok, user}, -5)
      assert {:ok, %User{points: 400}} = Railway.increment_points({:ok, user}, 200)
    end

    test "returns whatever was passed in if not {:ok, user}" do
      assert {:error, "Wrong"} == Railway.increment_points({:error, "Wrong"}, 10)
      assert 123 == Railway.increment_points(123, 10)
    end
  end
end
