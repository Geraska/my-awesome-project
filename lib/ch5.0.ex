defmodule Ask do
  def line() do
    planemo = get_planemo()
    distance = get_distance()
    Dropp.fall_velocity({planemo, distance})
  end

  defp get_planemo() do
    IO.puts("""
    Which planemo you want?
    1. Earth
    2. Moon
    3. Mars
    """)

    answer = IO.getn("Which? > ")
    value = String.first(answer)
    char_to_planemo(value)
  end

  defp get_distance() do
    input = IO.gets("How far? (meters) > ")
    value = String.trim(input)
    String.to_integer(value)
  end

  defp char_to_planemo(char) do
    case char do
      "1" -> :earth
      "2" -> :moon
      "3" -> :mars
    end
  end
end
