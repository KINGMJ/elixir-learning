defmodule Example do
    def add(a, b) do
        IO.puts a+b
    end

    def listen do
        receive do
            {:ok, "hello"} -> IO.puts("Words")
        end

        listen()
    end

    def explode, do: exit(:kaboom)

    def run do
        Process.flag(:trap_exit, true)
        spawn_link(Example, :explode, [])

        receive do
            {:EXIT, from_pid, reason} -> IO.inspect(from_pid)
                                         IO.puts("Exit reason: #{reason}")
        end
    end

    def run2 do
        {pid, ref} = spawn_monitor(Example, :explode, [])

        receive do
            {:DOWN, ref, :process, from_pid, reason} -> IO.puts("Exit reason: #{reason}")
        end

    end

    def double(x) do
        :timer.sleep(50000)
        x * 2
    end
end

