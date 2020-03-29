filename = IO.gets("File to count the words from: ") |> String.trim()
body = File.read!(filename) 
        |> String.split(~r{(\\n|[^\w'])+})
        |> Enum.filter(fn x -> x != "" end)

IO.puts filename
IO.inspect body
body |> Enum.count() |> IO.puts()

# 知识点：
# 1. exs 文件，执行 elixir word_count.exs 编译
# 2. 管道操作符 |>
# 3. IO.inspect 打印更多类型的数据  IO.pus 只能打印 String 和 Charlist
# 4. 正则表达式
# 5. File模块和Enum模块
# 6. File.read! 函数命名规范，返回布尔值后面带上!