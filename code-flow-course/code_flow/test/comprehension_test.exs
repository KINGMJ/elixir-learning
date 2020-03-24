# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.ComprehensionTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias CodeFlow.Comprehension
  alias CodeFlow.Schemas.User

  describe "award_unfair_points/2" do
    test "returns correctly filtered list of users with incremented points" do
      users = [
        %User{id: 1, name: "Bruce Milford", points: 10, active: true},
        %User{id: 2, name: "Lucy Bradshaw", points: 300, active: true},
        %User{id: 3, name: "Howard Herman", points: 60, active: true},
        %User{id: 4, name: "Lou Gruceman", points: 250, active: false},
        %User{id: 5, name: "Sherry Gruceman", points: 75, active: true},
        %User{id: 6, name: "Larry Brown", points: 0, active: false}
      ]
      results = Comprehension.award_unfair_points(users, 100)
      assert length(results) == 3
      # assert 3 expected users returned with desired incremented point values
      assert [%{id: 1, points: 110}, %{id: 2, points: 400}, %{id: 5, points: 175}] = results
    end
  end

  describe "build_chessboard/0" do
    test "returns expected list with maps" do
      # match asserts it returns a list
      [first | _rest] = Comprehension.build_chessboard()
      # match asserts it is a map with the expected keys
      %{row: _row, col: _col, name: _name} = first
    end

    test "includes spot checked values" do
      Comprehension.build_chessboard()
      |> assert_board_contains("a", 1, "a1")
      |> assert_board_contains("a", 8, "a8")
      |> assert_board_contains("b", 2, "b2")
      |> assert_board_contains("c", 3, "c3")
      |> assert_board_contains("d", 4, "d4")
      |> assert_board_contains("e", 5, "e5")
      |> assert_board_contains("f", 6, "f6")
      |> assert_board_contains("g", 7, "g7")
      |> assert_board_contains("h", 1, "h1")
      |> assert_board_contains("h", 8, "h8")
    end

    test "has correct number of squares" do
      board = Comprehension.build_chessboard()
      assert length(board) == 64
    end
  end

  defp assert_board_contains(board, col, row, name) do
    assert is_list(board), "Board should be a list"
    case Enum.  find(board, &(&1.name == name)) do
      %{col: c, row: r} = _found ->
        assert col == c, "Column value is wrong for #{inspect name}"
        assert row == r, "Row value is wrong for #{inspect name}"
        # assertions passed, return the board so we can continue piping
        board

      nil ->
        raise "Board does not contain name #{inspect name}"
    end
  end

  describe "team_points/1" do
    test "returns 0 for an empty list" do
      assert 0 == Comprehension.team_points([])
    end

    test "returns 0 when no active users" do
      assert 0 == Comprehension.team_points([%User{id: 4, name: "Lou Gruceman", points: 250, active: false}])
    end

    test "totals points of active users" do
      users = [
        %User{id: 1, name: "Bruce Milford", points: 10, active: true},
        %User{id: 2, name: "Lucy Bradshaw", points: 300, active: true},
        %User{id: 3, name: "Howard Herman", points: 60, active: true},
        %User{id: 4, name: "Lou Gruceman", points: 250, active: false},
        %User{id: 5, name: "Sherry Gruceman", points: 75, active: true},
        %User{id: 6, name: "Larry Brown", points: 0, active: false}
      ]
      assert 445 == Comprehension.team_points(users)
    end
  end
end
