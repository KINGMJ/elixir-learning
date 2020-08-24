defmodule AlchemyMarkdown do
  @moduledoc """
  Documentation for `AlchemyMarkdown`.
  """

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

end
