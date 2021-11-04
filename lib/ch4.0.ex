defmodule DropLogic do
  def fall_velocity(planemo, distance) do
    if distance >= 0 and is_number(distance) do
      gravity =
        case planemo do
          :earth -> 9.8
          :moon -> 1.6
          :mars -> 3.71
          _ -> 0
        end

      velocity = :math.sqrt(2 * gravity * distance)

      cond do
        velocity == 0 -> {velocity, :stable}
        velocity < 5 -> {velocity, :slow}
        velocity >= 5 and velocity <= 10 -> {velocity, :moving}
        velocity >= 10 and velocity <= 20 -> {velocity, :fast}
        velocity > 20 -> {velocity, :gas_gas_gaaaaas}
      end
    else
      {:error, "U suck ma boiiii"}
    end
  end
end

defmodule Countd do
  def countdown(from) when from > 0 do
    IO.inspect(from)
    countdown(from - 1)
  end

  def countdown(from) do
    IO.puts("Blastoff!!!")
    from
  end
end

defmodule Countu do
  def countup(limit) do
    countup(1, limit)
  end

  defp countup(count, limit) when count <= limit do
    IO.inspect(count)
    countup(count + 1, limit)
  end

  defp countup(_count, _limit) do
    IO.puts("Finished!")
  end
end

defmodule Fact do
  def factorial(n) when n > 1 do
    IO.puts("Calling from #{n}")
    result = n * factorial(n - 1)
    IO.puts("#{n} yields #{result}")
    result
  end

  def factorial(n) when n <= 1 do
    IO.puts("Calling from 1")
    IO.puts("1 yields 1")
    1
  end
end

defmodule Factt do
  def factorial(n) do
    factorial(1, n, 1)
  end

  defp factorial(curent, n, result) when curent <= n do
    new_result = curent * result
    IO.puts("#{curent} yields #{new_result}")
    factorial(curent + 1, n, new_result)
  end

  defp factorial(_curent, _n, result) do
    IO.puts("Finished!")
    result
  end
end
