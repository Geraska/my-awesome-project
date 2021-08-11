defmodule Drop do
  @moduledoc """
  Функции вычисления скорости свободно падающего объекта в вакууме.
  *Introducing Elixir*, Second Edition, O'Reilly Media, Inc., 2017.
  Copyright 2017 by Simon St.Laurent and J. David Eisenberg.
  """
  @vsn 0.1
  @doc """
  Вычисляет скорость свободно падащего объекта на Земле, как
  если бы он падал в вакууме (то есть без учета сопротивления
  воздуха). Параметр distance определяет высоту в метрах, с которой
  падает объект, а возвращаемое значение выражает скорость в метрах
  в секунду.
  """
  import :math, only: [sqrt: 1]
  def fall_velocity(distance, gravity \\ 9.8), do: sqrt(2 * gravity * distance)
end

defmodule Convert do
  def mps_to_mph(mps), do: 2.23693629 * mps
  def mps_to_kph(mps), do: 3.6 * mps
end
#вспомагательные функций!
defmodule Combined do
  import Convert
  #принимает метры, возвращает мили в час
  def height_to_mph(meters), do: Drop.fall_velocity(meters) |> mps_to_mph()
end
