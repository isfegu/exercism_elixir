defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words_list = Regex.scan(~r/[[:alpha:]-1-9]+/u, String.downcase(sentence)) |> List.flatten()
    unique_words_list = words_list |> Enum.uniq()
    for word <- unique_words_list, into: %{}, do: {word, Enum.count(words_list, &(&1 == word))}
  end
end