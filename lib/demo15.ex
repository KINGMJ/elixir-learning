defmodule Demo15 do
  import Integer

  # 推导
  def comprehensions_test do
    for n <- [1, 2, 3, 4, 5], do: n * n
  end

  # 使用模式匹配过滤
  def comprehensions_test1 do
    values = [good: 1, good: 2, bad: 3, bad: 4]
    for {:good, n} <- values, do: n * n
  end

  # 使用过滤器过滤
  def comprehensions_test2 do
    for n <- 0..5, rem(n, 3) == 0, do: n * n
  end

  # 使用多个过滤器过滤
  def comprehensions_test3 do
    for x <- 1..100,
        is_even(x),
        rem(x, 3) == 0,
        do: x
  end

  # 结合哨兵子句
  def comprehensions_test4 do
    for value when is_binary(value) <- ["abc", 123, "def", 456], String.contains?(value, "e") do
      value
    end
  end

  # 多个生成器，求笛卡尔积
  def comprehensions_test5 do
    for i <- [:a, :b, :c], j <- [1, 2], do: {i, j}
  end
end
