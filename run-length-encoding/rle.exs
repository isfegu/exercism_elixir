defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode("") do
    ""
  end

  def encode(string) do
    encode(String.codepoints(string), hd(String.codepoints(string)), 0, "")
  end

  def encode([], letter, acc, string) do
    string <> to_string(acc) <> letter
  end

  def encode([h|t], letter, acc, string) when h === letter do
    encode(t, letter, acc + 1, string)
  end

  def encode([h|t], letter, acc, string) do
    encode(t, h, 1, string <> to_string(acc) <> letter)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    letters = String.split(string, ~r/[0-9]+/, trim: true)
    numbers = String.split(string, ~r/[A-Z]+/, trim: true)
    decode(numbers, letters, "")
  end

  def decode([], [], string) do
    string
  end

  def decode([nh|nt], [lh|lt], string) do
    decode(nt, lt, string <> String.duplicate(lh, String.to_integer(nh)))
  end
end
