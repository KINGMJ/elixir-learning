defmodule Demo11 do
  def test_map do
    map = %{
      name: "jack",
      age: 17,
      sex: "male"
    }

    test_echo_map(map)
  end

  def test_echo_map(%{name: name, age_a: age}) do
    name
    age
  end
end
