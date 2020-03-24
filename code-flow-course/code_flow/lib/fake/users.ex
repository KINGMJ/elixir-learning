# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Fake.Users do
  @moduledoc """
  Fake interface for working with Users. This gives a more realistic API
  interface without worrying about databases. Keeps us focused on the code we
  are working on.
  """
  alias CodeFlow.Schemas.User

  @user_db %{
    1 => %User{
      id: 1,
      name: "Annie",
      age: 35,
      hair: "blond",
      points: 2200,
      admin: true,
      active: true
    },
    2 => %User{
      id: 2,
      name: "George",
      age: 17,
      hair: "brown",
      points: 450,
      admin: false,
      active: true
    },
    3 => %User{
      id: 3,
      name: "Jill",
      age: 10,
      hair: "dark brown",
      points: 320,
      admin: false,
      active: true
    },
    4 => %User{
      id: 4,
      name: "Tom",
      age: 50,
      hair: nil,
      points: 2000,
      admin: false,
      active: true
    },
    5 => %User{
      id: 5,
      name: "Lizzie",
      age: 18,
      hair: "blond",
      points: 1200,
      admin: false,
      active: true
    }
  }

  @doc """
  A simplified simulation of a Repo.one/2 call. Takes an ID, looks up the
  User entry. If not found, a `nil` is returned.
  """
  @spec one(id :: integer) :: nil | User.t()
  def one(id) do
    Map.get(@user_db, id)
  end

  @doc """
  Find a user by it's unique ID.

  NOTE: This only provides canned data for use in the examples and practice
  exercises.
  """
  @spec find(id :: integer()) :: {:ok, User.t()} | {:error, String.t()}
  def find(id) when is_integer(id) and id < 0 do
    {:error, "Database connection failure!"}
  end

  def find(id) when is_integer(id) do
    case Map.get(@user_db, id) do
      nil -> {:error, "User not found"}
      %User{} = user -> {:ok, user}
    end
  end
end
