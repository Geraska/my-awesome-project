defmodule Dropp do
  def fall_velocity(where) do
    {planemo, distance} = where
    fall_velocity(planemo, distance)
  end

  defp fall_velocity(:earth, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:moon, distance) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  defp fall_velocity(:mars, distance) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end

defmodule MathDemo do
  def absolute_value(number) when number < 0 do
    -number
  end

  def absolute_value(0) do
    0
  end

  def absolute_value(number) when number > 0 do
    number
  end
end
