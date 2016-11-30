defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> hyphens2spaces()
    |> capital2spaces()
    |> String.split()
    |> Enum.map(&(String.first(&1) |> String.upcase()))
    |> List.to_string()
  end

  defp hyphens2spaces(string) do
    Regex.replace(~r/-/, string, " ")
  end

  defp capital2spaces(string) do
    Regex.replace(~r/([A-Z])/, string, " \\1")
  end
end
