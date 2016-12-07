defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @letters ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase()
    |> exists?()
  end

  defp exists?(sentence) do
    exists?(sentence, @letters, true)
  end

  defp exists?(sentence, [letter|tail], prev) do
    if String.contains?(sentence, letter), do: exists?(sentence, tail, true), else: exists?(sentence, [], false)
  end

  defp exists?(_, [], prev), do: prev
end

#IO.inspect Pangram.pangram?("the quick brown fox jumps over the lazy dog")