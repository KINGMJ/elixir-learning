defmodule Demo4 do
  ## 递归打印Hello!
  def recursion_test do
    print_multiple_times("Hello!", 3)
  end

  ## 递归对数字列表项求和
  def recursion_test2 do
    sum_list([1, 2, 3], 0)
  end

  ## 递归对列表项*2
  def recursion_test3 do
    double_each([1, 2, 3])
  end

  defp print_multiple_times(msg, n) when n <= 1 do
    IO.puts(msg)
  end

  defp print_multiple_times(msg, n) do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  defp sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  defp sum_list([], accumulator) do
    accumulator
  end

  defp double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  defp double_each([]) do
    []
  end
end
