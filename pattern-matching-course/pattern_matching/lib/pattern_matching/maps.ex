# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.Maps do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """

  def return_name(%{name: name}) do
    name
  end

  def has_sides?(%{sides: _}), do: true

  def has_sides?(_value), do: false

  def net_change(%{initial_balance: initial, ending_balance: ending}) do
    {:ok, ending - initial}
  end

  def net_change(_value) do
    {:error, "Missing balance information"}
  end

  def classify_response(%{"success" => true, "token" => token} = _response) do
    {:ok, token}
  end

  def classify_response(
        %{"success" => false, "messages" => %{"general" => %{"result_code" => -1}}} = _response
      ) do
    {:error, :invalid}
  end

   def classify_response(
        %{"success" => false, "messages" => %{"general" => %{"result_code" => 3}}} = _response
      ) do
    {:error, :retry}
  end

  def classify_response(
        %{"success" => false, "account" => %{"status_code" => "3001"}} = _response
      ) do
    {:error, :frozen}
  end
end
