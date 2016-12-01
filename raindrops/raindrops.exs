defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    number
    |> Factors.of()
    |> stringfy()
  end

  def stringfy(numbers) do
    stringfy(numbers, "", List.last(numbers))
  end

  def stringfy([3|tail], string, last) do
    stringfy(tail, string <> "Pling", last)
  end

  def stringfy([5|tail], string, last) do
    stringfy(tail, string <> "Plang", last)
  end

  def stringfy([7|tail], string, last) do
    stringfy(tail, string <> "Plong", last)
  end

  def stringfy([1], _, _) do
    "1"
  end

  def stringfy([_|tail], string, last) do
    stringfy(tail, string, last)
  end

  def stringfy([], string, last) do
    if String.length(string) == 0, do: to_string(last), else: string
  end
end

defmodule Factors do
  def of(number) do
    of(number, [1], [number], 1)
  end

  defp of(number, asc, desc, divider) do
    divider = divider + 1
    if divider >= Enum.min(desc) do
      Enum.dedup(asc ++ desc)
    else
      if rem(number, divider) == 0 do
         desc =[div(number, divider)] ++ desc
         asc = asc ++ [divider]
         of(number, asc, desc, divider)
      else
         of(number, asc, desc, divider)
      end
    end
  end
end