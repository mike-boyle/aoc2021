{h, vert, aim} =
  File.stream!("./02/2.txt")
  |> Stream.map(fn x ->
    [cmd, distance] = x |> String.split()
    [cmd, String.to_integer(distance)]
  end)
  |> Enum.reduce({0, 0, 0}, fn [dir, x], {horizontal, vertical, aim} ->
    case dir do
      "forward" ->
        {horizontal + x, vertical + aim * x, aim}

      "down" ->
        {horizontal, vertical, aim + x}

      "up" ->
        {horizontal, vertical, aim - x}
    end
  end)

IO.puts(vert * h)
