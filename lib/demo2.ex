defmodule Demo2 do
  def cond_test do
    cond do
      2 + 2 == 5 -> "This will not be true"
      1 + 1 == 2 -> "But this will"
      2 * 2 == 4 -> "And this ?"
    end
  end

  def cond_test2 do
    cond do
      2 + 2 == 5 -> "This is never true"
      2 * 2 == 3 -> "Not this"
      true -> "This is always true"
    end
  end

  def cond_test3 do
    hd([1, 2, 3]) -> "1 is considered as true"
  end
end
