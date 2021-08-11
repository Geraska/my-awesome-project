defmodule Overall do
  def product([]) do
    0
  end
  def product(list) do
    product(list, 1)
  end
  defp product([], accumulated_product) do
    accumulated_product
  end
  defp product([head | tail], accumulated_product) do
    product(tail, head * accumulated_product)
  end
end

defmodule ListDrop do
  def falls(list) do
    falls(list, [])
  end
  def falls([], results) do
    Enum.reverse(results)
  end
  def falls([head | tail], results) do
    falls(tail, [(Dropp.fall_velocity(head) | results)])
  end
end

defmodule Pascal do
  def triangle(rows) do
    triangle([[0, 1, 0]], 1, rows)
  end
  def triangle(list, count, rows) when count >= rows do
    Enum.reverse(list)
  end
  def triangle(list, count, rows) do
    [previous | _] = list
    triangle([add_row(previous) | list], count + 1, rows)
  end
  def add_row(initial) do
    add_row(initial, 0, [])
  end
  def add_row([], 0, final) do
    [0 | final]
  end
  def add_row([h | t], last, new) do
    add_row(t, h, [last + h | new])
  end
end
