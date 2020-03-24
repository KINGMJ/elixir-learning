# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Case do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Schemas.User
  alias CodeFlow.Fake.Users

  def classify_user(user) do
    case user do
      %User{age: nil}                               -> {:error, "Age is required"}
      %User{age: age} when age >=0 and age < 18     -> {:ok, :minor}
      %User{age: age} when age >= 18                -> {:ok, :adult}
      _                                             -> {:error, :invalid}
    end
  end

  def read_file(filename) do
    case File.read(filename) do
      {:ok, contents}       -> {:ok, contents}
      {:error, :enoent}     -> {:error, "File not found"}
    end
  end

  def find_user(user_id) do
      case Users.one(user_id) do
        %User{} = user  -> {:ok, user}
        nil             -> {:error, "User not found"}
      end
  end
end
