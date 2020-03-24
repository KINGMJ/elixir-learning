# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.KeywordsTest do
  @moduledoc """
  Complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias CodeFlow.Keywords
  alias CodeFlow.Schemas.Item

  describe "rounded/2" do
    test "defaults to 4 decimal places" do
      assert 1.2346 == Keywords.rounded(1.2345678)
      assert 1.6543 == Keywords.rounded(1.654321012)
      assert 1.12 == Keywords.rounded(1.1200000008889)
    end

    test "supports overriding to other precision" do
      assert 1.235 == Keywords.rounded(1.2345678, decimals: 3)
      assert 1.65 == Keywords.rounded(1.654321012, decimals: 2)
      assert 1.1 == Keywords.rounded(1.1200000008889, decimals: 1)
      assert 1.0 == Keywords.rounded(1.1200000008889, decimals: 0)
    end
  end

  describe "refactoring rounded/2" do
    test "overrides explicit nil value to default" do
      assert 1.2346 == Keywords.rounded(1.2345678, decimals: nil)
    end
  end

  describe "unit_price/2" do
    test "defaults to return a float" do
      assert 5.0 == Keywords.unit_price(%Item{price: 10.0, quantity: 2})
      assert 2.0 == Keywords.unit_price(%Item{price: 10.0, quantity: 5})
      assert 10.0 == Keywords.unit_price(%Item{price: 10.0, quantity: 1})
    end

    test "supports being returned as money with expected decimal places" do
      item = %Item{price: 10.0, quantity: 4}
      assert 2.5 == Keywords.unit_price(item, mode: :float)
      assert "2.50" == Keywords.unit_price(item, mode: :money)

      item = %Item{price: 10.0, quantity: 3}
      assert "3.33" == Keywords.unit_price(item, mode: :money)
    end
  end
end
