defmodule DropTest do
  use ExUnit.Case, async: true
  test "Zero distance gives zero velocity" do
    assert Drops.fall_velocity(:earth, 0) == 0
  end
  test "Velocity of object on mars from 10 meters" do
    assert Drops.fall_velocity(:mars, 10) == :math.sqrt(2 * 3.71 * 10)
  end
end
