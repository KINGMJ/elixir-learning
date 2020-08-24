defmodule AlchemyMarkdownTest do
  use ExUnit.Case
  doctest AlchemyMarkdown

  test "italicizes" do
    str = "Something *important*"
    assert AlchemyMarkdown.italics(str) ==  "Something <em>important</em>"
  end
end
