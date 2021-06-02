defmodule Demo1 do
  def case_test do
    case {1, 2, 3} do
      {4, 5, 6} -> "This clause won't match"
      {1, x, 3} -> "This clause will match and bind x to 2 in this clause"
      _ -> "This clause would match any value"
    end
  end

  def case_test2 do
    x = 1

    case 10 do
      ^x -> "Won't match"
      _ -> "Will match"
    end
  end

  def case_test3 do
    case {1, -2, 3} do
      {1, x, 3} when x > 0 -> "Will match"
      _ -> "Won't match"
    end
  end

  def case_test4 do
    case :ok do
      :error -> "Won't match"
    end
  end
end
