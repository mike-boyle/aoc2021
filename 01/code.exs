val =
  case File.read("./01/1.txt") do
    {:ok, content} ->
      content

    {:error, reason} ->
      raise reason
  end

strings = val |> String.split("\n") |> Enum.map(fn x -> String.to_integer(x) end)

zongs =
  Enum.zip([Enum.drop(strings, 2), Enum.drop(strings, 1), strings])
  |> Enum.map(fn x -> x |> Tuple.to_list() |> Enum.sum() end)

strongs =
  Enum.zip_reduce(Enum.drop(zongs, 1), zongs, 0, fn
    x, y, acc when x > y -> acc + 1
    _, _, acc -> acc
  end)

IO.puts(strongs)
