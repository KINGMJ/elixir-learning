# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Streams do
  @moduledoc """
  Code that sets up scenarios where you can play and develop a better sense for
  how Enum and Stream compare.
  """

  def experiment_1_enum(data) do
    simple_measurements(fn ->
      data
      |> Enum.map(&(&1 * 2))
      |> Enum.map(&(&1 + 1))
      |> Enum.map(&(&1 + 2))
      |> Enum.map(&(&1 + 3))
      |> Enum.map(&(&1 + 4))
      |> Enum.map(&(&1 + 5))
      |> Enum.map(&(&1 + 6))
      |> Enum.map(&(&1 + 7))
      |> Enum.map(&(&1 + 8))
      |> Enum.map(&(&1 + 9))
      |> Enum.map(&(&1 - 10))
      |> Enum.to_list()
    end)
  end

  def experiment_1_stream(data) do
    simple_measurements(fn ->
      data
      |> Stream.map(&(&1 * 2))
      |> Stream.map(&(&1 + 1))
      |> Stream.map(&(&1 + 2))
      |> Stream.map(&(&1 + 3))
      |> Stream.map(&(&1 + 4))
      |> Stream.map(&(&1 + 5))
      |> Stream.map(&(&1 + 6))
      |> Stream.map(&(&1 + 7))
      |> Stream.map(&(&1 + 8))
      |> Stream.map(&(&1 + 9))
      |> Stream.map(&(&1 - 10))
      |> Enum.to_list()
    end)
  end

  def experiment_2_enum(data) do
    simple_measurements(fn ->
      data
      |> Enum.map(&(&1 * 2))
      |> Enum.map(&(&1 + 1))
      |> Enum.map(&(&1 + 2))
      |> Enum.map(&(&1 + 3))
      |> Enum.map(&(&1 + 4))
      |> Enum.map(&(&1 + 5))
      |> Enum.map(&(&1 + 6))
      |> Enum.map(&(&1 + 7))
      |> Enum.map(&(&1 + 8))
      |> Enum.map(&(&1 + 9))
      |> Enum.map(&(&1 - 10))
      |> Enum.sum()
    end)
  end

  def experiment_2_stream(data) do
    simple_measurements(fn ->
      data
      |> Stream.map(&(&1 * 2))
      |> Stream.map(&(&1 + 1))
      |> Stream.map(&(&1 + 2))
      |> Stream.map(&(&1 + 3))
      |> Stream.map(&(&1 + 4))
      |> Stream.map(&(&1 + 5))
      |> Stream.map(&(&1 + 6))
      |> Stream.map(&(&1 + 7))
      |> Stream.map(&(&1 + 8))
      |> Stream.map(&(&1 + 9))
      |> Stream.map(&(&1 - 10))
      |> Enum.sum()
    end)
  end

  def experiment_3_enum(data) do
    simple_measurements(fn ->
      data
      |> Enum.map(&(&1 * 2))
      |> Enum.map(&(&1 + 1))
      |> Enum.map(&(&1 + 2))
      |> Enum.map(&(&1 + 3))
      |> Enum.map(&(&1 + 4))
      |> Enum.map(&(&1 + 5))
      |> Enum.map(&(&1 + 6))
      |> Enum.map(&(&1 + 7))
      |> Enum.map(&(&1 + 8))
      |> Enum.map(&(&1 + 9))
      |> Enum.map(&(&1 - 10))
      |> Enum.take(5)
    end)
  end

  def experiment_3_stream(data) do
    simple_measurements(fn ->
      data
      |> Stream.map(&(&1 * 2))
      |> Stream.map(&(&1 + 1))
      |> Stream.map(&(&1 + 2))
      |> Stream.map(&(&1 + 3))
      |> Stream.map(&(&1 + 4))
      |> Stream.map(&(&1 + 5))
      |> Stream.map(&(&1 + 6))
      |> Stream.map(&(&1 + 7))
      |> Stream.map(&(&1 + 8))
      |> Stream.map(&(&1 + 9))
      |> Stream.map(&(&1 - 10))
      |> Enum.take(5)
    end)
  end

  def experiment_4_enum() do
    simple_measurements(fn ->
      contents = File.read!("./test/support/lorem.txt")
      lines = String.split(contents, "\n")

      lines
      |> Enum.map(fn line ->
        line
        |> String.split(" ")
        |> Enum.count()
      end)
      |> Enum.sum()
      |> IO.inspect(label: "Total words counted")
    end)
  end

  def experiment_4_stream() do
    simple_measurements(fn ->
      File.stream!("./test/support/lorem.txt", [:read], :line)
      |> Stream.map(fn line ->
        line
        |> String.split(" ")
        |> Enum.count()
      end)
      |> Enum.sum()
      |> IO.inspect(label: "Total words counted")
    end)
  end

  def process_memory() do
    {:memory, value} = :erlang.process_info(self(), :memory)
    :erlang.float_to_binary(value / 1024 / 1024, decimals: 2) <> " MB"
  end

  @doc """
  This function just helps wrap the experimental one inside some crude
  measurement tools. These help give some feedback about how the function
  performed.
  """
  def simple_measurements(fun) do
    # Force garbage collection before running the experiment.
    # You would never do this in a production system!
    :erlang.garbage_collect()
    # Print out the starting memory usage
    IO.puts(process_memory())

    # start the timer
    start = Time.utc_now()

    # execute the passed in function. Ignore the result as that isn't what we
    # care about right now.
    _result = fun.()

    # stop the timer, output the final memory usage and time.
    stop = Time.utc_now()
    IO.puts(process_memory())
    IO.puts("#{Time.diff(stop, start, :millisecond)} msec")

    # We don't actually care to receive the function's result. Return an `:ok`
    # prevents a very large returned value from being added to the IEx history
    # which takes up more RAM and isn't part of a normal running system.
    :ok
  end
end
