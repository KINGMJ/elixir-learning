defmodule Example do
    import Sayings.Greetings
    
    def print_message(name), do:  basic(name)
end

defmodule Sayings.Greetings do
    def basic(name), do: "Hi, #{name}"
end

