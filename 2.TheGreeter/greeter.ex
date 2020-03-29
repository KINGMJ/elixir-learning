defmodule Greeter do
  @author "Jerry"

  def sayhi do
     name = IO.gets("Hi, there! What's your name?\n") |> String.trim()

     case name do
      @author  ->  IO.puts("Wow, we have the same name!")
      _        ->  IO.puts("Hi, #{name}!")
     end
  end
end
