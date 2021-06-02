defmodule Example do
  @doc """
  iex> spawn(Example, :add, [2, 3])

  iex> pid = spawn(Example, :listen, [])
  #PID<0.140.0>
  iex> send pid, {:ok, "hello"}
  {:ok, "hello"}
  Words

  iex> spawn(Example, :explode, [])
  #PID<0.144.0>
  spawn_link(Example, :explode, [])
  ** (EXIT from #PID<0.138.0>) shell process exited with reason: :kaboom

  iex> Example.run
  #PID<0.149.0>
  Exit reason: kaboom
  :ok

  iex> Example.run2
  Exit reason: kaboom
  :ok


  iex> task = Task.async(Example, :double, [2000])
  %Task{
  owner: #PID<0.109.0>,
  pid: #PID<0.139.0>,
  ref: #Reference<0.1046014478.3383492612.61050>
  }
  iex> Task.await task
  4000
  """
  def add(a, b) do
    IO.puts(a + b)
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
      {:EXIT, from_pid, reason} ->
        IO.inspect(from_pid)
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
    :timer.sleep(5000)
    x * 2
  end
end
