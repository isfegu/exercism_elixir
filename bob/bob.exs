defmodule Bob do
  def hey(), do: "Fine. Be that way!"
  def hey(input) do
    cond do
      # Empty input, silence and prolonged silence
      input |> String.trim() |> String.length() == 0  -> "Fine. Be that way!"
      # Question
      input |> String.ends_with?("?")                 -> "Sure."
      # Shouting
      input |> shouting_compact() == true             -> "Whoa, chill out!"
      # Other cases
      input |> String.length() > 0                    -> "Whatever."
    end
  end

  defp shouting(input) do
    raw = Regex.scan(~r/\p{L}+/, input)
    if Enum.count(raw) == 0 do
      false
    else
      Enum.map(raw,
        fn(x) ->
          Enum.map(x,
              fn(y) ->
                  y |> String.upcase()
              end
              )
        end
      ) == raw
    end
  end

  @doc """
      More elegant solution by Eval: http://exercism.io/submissions/4a42841191fa4cb3b237aeb6da09599d
      Thanks!
  """
  defp shouting_compact(input) do
    String.match?(input, ~r/[[:upper:]]/) && String.upcase(input) === input
  end
end
