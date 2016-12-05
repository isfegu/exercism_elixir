defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b do
    :equal
  end

  def compare(a, b) do
    if Enum.count(a) > Enum.count(b) do
      is_superlist?(a, b)
    else
      if sequence?(a, b), do: :sublist, else: :unequal
    end
  end

  defp is_superlist?(a, b) do
    if sequence?(b, a), do: :superlist, else: :unequal
  end

  defp sequence?(a, b) do
    if Enum.count(a) == 1 do
      String.match?(b |> Enum.join(), ~r/#{a |> Enum.join()}+[^\.]/)
    else
      String.contains?(b |> Enum.join(), a |> Enum.join())
    end
  end
end
