# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.Binaries do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  @png_signature <<137::size(8), 80::size(8), 78::size(8), 71::size(8), 13::size(8), 10::size(8),
                   26::size(8), 10::size(8)>>

  @jpg_signature <<255::size(8), 216::size(8)>>

  def identify_command("SAY " <> words), do: {:say, words}

  def identify_command("WAVE " <> words), do: {:wave, words}

  def identify_command(_value), do: {:error, "Unrecognized command"}

  def format_phone(<<area::binary-size(3), three::binary-size(3), four::binary-size(4)>>) do
    "(#{area}) #{three}-#{four}"
  end

  def format_phone(<<three::binary-size(3), four::binary-size(4)>>) do
    "#{three}-#{four}"
  end

  def format_phone(value), do: value

  def image_type(<< @png_signature, _rest::binary >>), do: :png

  def image_type(<< @jpg_signature, _rest::binary >>), do: :jpg

  def image_type(_value), do: :unknown

end
