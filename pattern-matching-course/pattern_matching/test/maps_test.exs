# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.MapsTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias PatternMatching.Maps

  describe "return_name/1" do
    test "returns the name from a map" do
      map = %{name: "George", age: 45, favorite_color: "blue"}
      assert "George" == Maps.return_name(map)

      map = %{name: "Bernice", age: 50, favorite_color: "red"}
      assert "Bernice" == Maps.return_name(map)

      map = %{name: "Tammy", age: 32, favorite_color: "periwinkle"}
      assert "Tammy" == Maps.return_name(map)
    end
  end

  describe "has_sides?/1" do
    test "returns true when the key `sides` exists" do
      map = %{sides: 3, shape: "triangle"}
      assert Maps.has_sides?(map)

      map = %{sides: 12, shape: "dodecahedron"}
      assert Maps.has_sides?(map)
    end

    test "returns false when no `sides` key is present" do
      map = %{name: "Tom", age: 36}
      assert false == Maps.has_sides?(map)

      map = %{customer: "ACME, Inc.", balance: 14_562}
      assert false == Maps.has_sides?(map)
    end
  end

  describe "net_change/1" do
    test "subtracts beginning balance from ending balance" do
      customer = %{customer: "Bobby's Lemonade Stand", initial_balance: 2, ending_balance: 24}
      {:ok, 22} = Maps.net_change(customer)

      account = %{account: "Car Loan", initial_balance: 24_000, ending_balance: 20_000}
      {:ok, -4_000} = Maps.net_change(account)
    end

    test "returns error if missing balance information" do
      person = %{name: "Terry", age: 55}
      {:error, "Missing balance information"} = Maps.net_change(person)

      country = %{country: "Grayskull", initial_balance: 1_000}
      {:error, "Missing balance information"} = Maps.net_change(country)

      country = %{country: "Grayskull", initial_balance: 1_000}
      {:error, "Missing balance information"} = Maps.net_change(country)
    end
  end

  describe "classify_response/1" do
    setup _ do
      success = %{"success" => true, "token" => "syriuC2ia",
                  "account" => %{"status_code" => "1000"},
                  "messages" => %{"general" => %{"result_code" => 0}}}
      throttle = %{"success" => false, "token" => nil,
                  "account" => nil,
                  "messages" => %{"general" => %{"result_code" => 3}}}
      frozen = %{"success" => false, "token" => "syriuC2ia",
                  "account" => %{"status_code" => "3001"},
                  "messages" => %{"general" => %{"result_code" => 0}}}
      invalid = %{"success" => false, "token" => "invalid",
                  "account" => %{"status_code" => ""},
                  "messages" => %{"general" => %{"result_code" => -1}}}

      {:ok, %{invalid: invalid, throttle: throttle, frozen: frozen, success: success}}
    end

    test "returns token value when valid", %{success: success} do
      # successful when success is "true", return the token value
      assert {:ok, "syriuC2ia"} == Maps.classify_response(success)
    end

    test "returns error when invalid", %{invalid: invalid} do
      # invalid response have a success "false" and a result_code of "-1"
      assert {:error, :invalid} == Maps.classify_response(invalid)
    end

    test "returns retry when throttled", %{throttle: throttle} do
      # throttled response have a success "false" and a result_code of "3"
      assert {:error, :retry} == Maps.classify_response(throttle)
    end

    test "returns error with reason when frozen", %{frozen: frozen} do
      # frozen response have a success "false" and a status_code of "3001"
      assert {:error, :frozen} == Maps.classify_response(frozen)
    end
  end
end
