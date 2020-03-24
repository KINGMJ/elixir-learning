# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.CaseTest do
  @moduledoc """
  Complete the code to make the tests pass. Use the `case` statement to solve
  the failing tests.
  """
  use ExUnit.Case
  alias CodeFlow.Schemas.User
  alias CodeFlow.Case

  describe "classify_user/1" do
    test "idenitifies minors" do
      assert {:ok, :minor} == Case.classify_user(%User{name: "Jill", age: 10})
      assert {:ok, :minor} == Case.classify_user(%User{name: "Bill", age: 17})
      assert {:ok, :minor} == Case.classify_user(%User{name: "Annie", age: 7})
    end

    test "identifies legal US adults" do
      assert {:ok, :adult} == Case.classify_user(%User{name: "Tom", age: 50})
      assert {:ok, :adult} == Case.classify_user(%User{name: "Mary", age: 35})
      assert {:ok, :adult} == Case.classify_user(%User{name: "Lizzie", age: 18})
    end

    test "nil age returns specific reason" do
      assert {:error, "Age is required"} == Case.classify_user(%User{name: "Nilbo", age: nil})
    end

    test "anything else is :invalid" do
      assert {:error, :invalid} == Case.classify_user(%User{name: "Time Travis", age: -100})
      assert {:error, :invalid} == Case.classify_user("a string")
      assert {:error, :invalid} == Case.classify_user(40)
    end
  end

  describe "read_file/1" do
    test "returns file contents when file found" do
      {:ok, contents} = Case.read_file("./test/support/secret_numbers.txt")
      assert contents =~ "These are my secrets!"
    end

    test "returns error when file not found" do
      {:error, reason} = Case.read_file(".test/support/invalid_file.txt")
      assert reason == "File not found"
    end
  end

  describe "find_user/1" do
    test "returns User struct when found" do
      {:ok, %User{} = found} = Case.find_user(1)
      assert found.id == 1
      assert found.name == "Annie"

      {:ok, %User{} = found} = Case.find_user(2)
      assert found.id == 2
    end

    test "returns error tuple when with explanation when not found" do
      {:error, reason} = Case.find_user(100)
      assert reason == "User not found"

      {:error, reason} = Case.find_user("abc")
      assert reason == "User not found"
    end
  end
end
