# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.BinariesTest do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  use ExUnit.Case
  alias PatternMatching.Binaries

  describe "identify_command/1" do
    test "correctly identifies known commands" do
      assert {:say, "Hey guys!"} == Binaries.identify_command("SAY Hey guys!")
      assert {:wave, "friend_user"} == Binaries.identify_command("WAVE friend_user")
    end

    test "returns error when command unrecognized" do
      assert {:error, "Unrecognized command"} == Binaries.identify_command("MOCK other_person Boo!")
    end
  end

  describe "format_phone/1" do
    test "formats 2 types of phone numbers" do
      assert "(800) 555-4444" == Binaries.format_phone("8005554444")
      assert "555-4444" == Binaries.format_phone("5554444")
    end

    test "returns input when no match" do
      assert "short" == Binaries.format_phone("short")
      assert "original" == Binaries.format_phone("original")
      assert nil == Binaries.format_phone(nil)
    end
  end

  # Define image header data for PNG and JPG types.
  @png_signature <<137::size(8), 80::size(8), 78::size(8), 71::size(8), 13::size(8), 10::size(8),
                   26::size(8), 10::size(8)>>

  @jpg_signature <<255::size(8), 216::size(8)>>

  describe "image_type/1" do
    test "identifies a PNG signature" do
      image_data = @png_signature <> "FAKE_IMAGE_DATA"
      assert :png == Binaries.image_type(image_data)
    end

    test "identifies a JPG signature" do
      image_data = @jpg_signature <> "FAKE_IMAGE_DATA"
      assert :jpg == Binaries.image_type(image_data)
    end

    test "returns when unable to identify" do
      assert :unknown == Binaries.image_type("invalid")
      assert :unknown == Binaries.image_type(<<127::size(8), 99::size(8)>> <> "DATA")
    end
  end
end
