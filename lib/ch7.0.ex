defmodule Planemo do
  defstruct name: nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

defmodule Tower do
  defstruct location: "", height: 20, planemo: :earth, name: ""
end

defmodule StructDrop do
  def fall_velocity(t = %Tower{}) do
    fall_velocity(t.planemo, t.height)
  end

  def fall_velocity(:earth, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  def fall_velocity(:moon, distance) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  def fall_velocity(:mars, distance) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end

defimpl Inspect, for: Tower do
  import Inspect.Algebra

  def inspect(item, _options) do
    metres = concat(to_string(item.height), "m:")

    msg =
      concat([
        metres,
        break,
        item.name,
        ",",
        break,
        item.location,
        ",",
        break,
        to_string(item.planemo)
      ])
  end
end
