defmodule AreaProtocalTest do
  use ExUnit.Case
  doctest AreaProtocal
  import AreaProtocal.Area

  test "不支持的结构" do
    assert area({5, 10}) == :unsupported
  end

  test "长方形的面积" do
    length = 10
    width = 5
    assert area(%Rectangle{length: length, width: width}) == length * width
  end

  test "正方形的面积" do
    side = 5
    assert area(%Square{side: side}) == side * side
  end

  test "圆的面积" do
    radius = 5
    assert area(%Circle{radius: radius}) == 3.14 * radius * radius
  end

  test "椭圆的面积" do
    long_axias = 10
    short_axias = 5

    assert area(%Ellipse{long_axias: long_axias, short_axias: short_axias}) ==
             3.14 * long_axias * short_axias
  end
end
