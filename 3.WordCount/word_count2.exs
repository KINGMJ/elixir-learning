filename = IO.gets("File to count the words from: ") |> String.trim()

body = File.read!(filename)
          |> String.split(~r{\r\n})




lines_num = body |> Enum.count

IO.puts("lines num: #{lines_num}")

body = Enum.filter(body, &(&1 != ""))

IO.inspect(body)

strs_num = Enum.reduce(body, fn x, acc -> String.length(x) + String.length(acc) end)

IO.puts("strs num: #{strs_num}")
