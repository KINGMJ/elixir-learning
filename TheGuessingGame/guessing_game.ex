defmodule GuessingGame do
  # guess between a low number and a high number -> guess middle number
  # tell user our guess
  # "yes" -> game over
  # "bigger" -> bigger(low,high)
  # "smaller" -> smaller(low,high)
  # anything else -> tell user to enter a valid response

  # 在一个数字区间里让电脑猜数字，
  # 如果猜到了我们输入"yes"，
  # 如果猜的比我们给定的小，输入"bigger"
  # 如果猜的比我们给定的大，输入"smaller"

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end

  def guess(a, b) when a > b, do: guess(b, a)

  def guess(low, high) do
    answer = IO.gets("Hmm... maybe you're thinking of #{mid(low, high)} ?\n")

    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess your number!"

      _ ->
        IO.puts(~s{Type "bigger", "smaller" or "yes"})
        guess(low, high)
    end
  end

  # 知识点：
  # 1. max/min/mid 函数
  # 2. 字符串插值：#{}
  # 3. IO.gets 和 IO.puts
  # 4. ~s{} / ~s() 字符串处理
  # 5. case
  # 6. def guess(a, b) when a > b, do: guess(b, a) 函数简写，哨兵子句，多个子句
end
