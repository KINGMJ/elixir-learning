defmodule AreaProtocal do
  defprotocol Area do
    @fallback_to_any true
    def area(data)
  end

  defimpl Area, for: Any do
    def area(_), do: :unsupported
  end

  defimpl Area, for: Rectangle do
    def area(%Rectangle{length: length, width: width}), do: width * length
  end

  defimpl Area, for: Square do
    def area(%Square{side: side}), do: side * side
  end

  defimpl Area, for: Circle do
    def area(%Circle{radius: radius}), do: 3.14 * radius * radius
  end

  defimpl Area, for: Ellipse do
    def area(%Ellipse{long_axias: long_axias, short_axias: short_axias}),
      do: 3.14 * long_axias * short_axias
  end
end
