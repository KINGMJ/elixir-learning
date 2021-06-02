defmodule Demo3 do
  def map_test do
    users = [
      john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
      mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
    ]

    ## 获取值
    IO.puts(users[:john].age)

    ## put_in
    users = put_in(users[:john].age, 31)

    IO.inspect(users)

    ## update_in
    update_in(users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end)
  end
end
