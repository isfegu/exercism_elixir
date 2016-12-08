defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
      |> Enum.filter(&(refuse_equals(base, &1)))
      |> Enum.filter(&(is_anagram(base, &1)))
  end

  def refuse_equals(base, candidate) do
    ! String.equivalent?(base |> String.downcase(), candidate |> String.downcase())
  end

  def is_anagram(base, candidate) do
    base
      |> String.downcase()
      |> String.codepoints()
      |> Enum.sort()
      ==
    candidate
      |> String.downcase()
      |> String.codepoints()
      |> Enum.sort()
  end
end
