defmodule Demo9 do
  def fun do
    data = %{width: 10, height: 5}

    with {:ok, width} <- Map.fetch(data, :width),
         {:ok, height} <- Map.fetch(data, :height) do
      {:ok, width * height}
    end
  end

   def fun2 do
    data = %{ height: 5}

    with {:ok, width} <- Map.fetch(data, :width),
         {:ok, height} <- Map.fetch(data, :height) do
      {:ok, width * height}
    end
  end

  def fun3 do
   data = %{width: 10, height: 5}

    with {:ok, width} <- Map.fetch(data, :width),
         {:ok, height} when height<5 <- Map.fetch(data, :height) do
      {:ok, width * height}
    end
  end
end

