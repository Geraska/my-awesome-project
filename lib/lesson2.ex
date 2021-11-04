defmodule Lesson do
  def lesson(value) when value <= 99 and value >= 10 do
    ten = div(value, 10)
    one = rem(value, 10)
    key = ten + one
    IO.puts("We have #{key}")
  end
end

defmodule Lesson1 do
  def lesson(value) when value <= 99 and value >= 9 do
    list = Integer.digits(value)
    reverse = Enum.reverse(list)
    result = List.to_integer(reverse)
    IO.puts("We have #{result}")
  end
end

defmodule Test do
  def test do
    IO.gets("Enter a list: ")
    |> Enum.map(&List.to_integer/1)
  end
end

defmodule Lesson2 do
  def lesson(value) when value >= 100 and value <= 999 do
    hundred = div(value, 100)
    ten = div(rem(value, 100), 10)
    one = rem(value, 10)
    IO.puts("We have #{hundred} hundreds, #{ten} tens and #{one} ones")
  end
end

defmodule Lesson3 do
  def lesson(value) when value <= 999 and value >= 100 do
    list = Integer.digits(value)
    [r, g, d] = list
    result = [g, r, d]
    IO.puts("We have #{result}")
  end
end

defmodule Lesson4 do
  def lesson(value) when value >= 10 and value <= 99 do
    list = Integer.digits(value)
    result = Enum.sum(Enum.map(list, fn x -> x * x end))
    IO.puts("We have #{result}")
  end
end

defmodule Lesson5 do
  def lesson(value) when value >= 10 and value <= 99 do
    ten = div(value, 10)
    one = rem(value, 10)
    result = (ten - one) * (ten - one)
    IO.puts("We have #{result}")
  end
end

defmodule Lesson6 do
  def lesson?(value) when value >= 10 and value <= 99 do
    new_value = Integer.to_charlist(value)
    ten = Enum.at(new_value, 0)
    one = Enum.at(new_value, 1)
    result = (ten - one) * (ten - one)
    IO.puts("We have #{result}")
  end
end

defmodule Lesson7 do
  def lesson(value) when value >= 100 and value <= 999 do
    list = Integer.digits(value)
    [head | tail] = list
    [head1 | tail1] = tail
    result = [head1, head, tail1]
    IO.puts("We have #{result}")
  end
end

defmodule Lesson8 do
  def lesson(value) when value <= 99 and value >= 10 do
    list = Integer.to_charlist(value)
    ten = Enum.at(list, 0)
    one = Enum.at(list, 1)
    pre_result = [one, ten]
    result = List.to_integer(pre_result)
    IO.puts("We have #{result}")
  end
end

defmodule Lesson9 do
  def lesson(value) do
    list = Integer.to_charlist(value)
    hundred = Enum.at(list, 0)
    ten = Enum.at(list, 1)
    one = Enum.at(list, 2)
    pre_result = [ten, hundred, one]
    result = List.to_integer(pre_result)
    IO.puts("We have #{result}")
  end
end
