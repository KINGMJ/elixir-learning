defmodule CompireAndReplaceText do
  def compire() do
    files = Path.wildcard("8.WordCompire/Text/**/*.txt")
    # 中文对照文件
    file_compire_content = read_from_file("8.WordCompire/compire.txt")

    files
    |> Enum.each(fn file ->
      file_content = read_from_file(file)
      res = find_and_replace_element(file_content, file_compire_content)
      save_to_file(res, file)
    end)
  end

  # 从文件中读取并过滤掉不合法的格式
  def read_from_file(file) do
    file
    |> File.read!()
    |> String.split(~r{[\r\n]+})
    |> Enum.filter(fn x -> x != "" && count_char(x, "=") == 1 end)
    |> Enum.map(fn x -> split_string_to_map(x) end)
  end

  # 将 "脱力フェラ="Weakness fellatio" 转换为map结构 %{"脱力フェラ" => "Weakness fellatio"}
  defp split_string_to_map(str) do
    list = str |> String.split("=")
    [a, b] = list
    %{a => b}
  end

  # 如果list2中存在相同的key，用list2替代
  defp find_and_replace_element(list1, list2) do
    Enum.map(list1, fn x ->
      element = Enum.find(list2, fn y -> get_map_key(y) == get_map_key(x) end)

      case element do
        nil -> x
        _ -> element
      end
    end)
  end

  defp get_map_key(map), do: map |> Map.keys() |> List.first()

  # 对比后的结果保存到文件中
  defp save_to_file(res, file) do
    result =
      res
      |> Enum.reverse()
      |> Enum.reduce("", fn x, acc ->
        key = get_map_key(x)
        ~s(#{key}=#{x[key]}\r\n#{acc})
      end)

    File.write!(file, result)
  end

  # 统计字符串中字符出现的次数
  def count_char(text, char) do
    text
    |> String.graphemes()
    |> Enum.reduce(0, fn x, acc ->
      if x == char, do: acc + 1, else: acc
    end)
  end
end
