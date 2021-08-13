defmodule Bounce do
  def report(count) do
    new_count = receive do
      msg -> IO.puts("Received #{count}: #{msg}")
        #shows received messages
        count + 1
    end
    report(new_count)
  end
end

defmodule Bounce2 do
  def report do
    receive do
      x -> IO.puts("Divided to #{x/2}")
        #divides given number in 2
        report()
    end

  end
end

defmodule Drops do
  def drop do
   receive do
     {from, planemo, distance} ->
      send(from, {planemo, distance, fall_velocity(planemo, distance)})
      #calculates the velocity of falling objects on earth, moon and mars
      drop()
    end
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

defmodule MphDrop do
  def mph_drop do
    Process.flag(:trap_exit, true)
    drop_pid = spawn_link(Drops, :drop, [])
    convert(drop_pid)
  end
  def convert(drop_pid) do
    receive do
     {planemo, distance} ->
      send(drop_pid, {self(), planemo, distance})
      convert(drop_pid)
      {:EXIT, _pid, _reason} ->
       new_drop_pid = spawn_link(Drops, :drop, [])
       convert(new_drop_pid)
     {planemo, distance, velocity} ->
      mph_velocity = 2.23693629 * velocity
      IO.write("on #{planemo}, a fall of #{distance} meters")
      IO.puts("yields a velocity of #{mph_velocity} mph")
      convert(drop_pid)
        #makes an endless process of calculating the velocity of falling objects on earth, moon and mars
    end
  end
end

defmodule DatabaseServer do
  def start do
    spawn(fn -> connection = :rand.uniform(1000)
    loop(connection)
  end)
  end
  defp loop(connection) do
    receive do
      {:run_query, from_pid, query_def} ->
        query_result = run_query(connection, query_def)
        send(from_pid, {:query_result, query_result})
        # code
    end
    loop(connection)
  end
  defp run_query(connection, query_def) do
    Process.sleep(2000)
    "Connection #{connection}: #{query_def} result"
  end
  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end
  def get_result do
    receive do
      {:query_result, result} -> result
    after
      5000 -> {:error, :timeout}
        # code
    end
  end
end
