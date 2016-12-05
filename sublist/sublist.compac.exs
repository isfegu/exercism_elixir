defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  def sublist?(a, b) when length(b) >= length(a) do
    if a === Enum.take(b, length(a)) do
      true
    else
      sublist?(a, tl(b))
    end
  end

  def sublist?(_, _), do: false

end
