defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @seconds_in_year 31557600
  @conversion %{:mercury => 0.2408467, :venus => 0.61519726, :earth => 1, :mars => 1.8808158, :jupiter => 11.862615, :saturn => 29.447498, :uranus => 84.016846, :neptune => 164.79132}

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth = seconds / @seconds_in_year
    case planet do
        :mercury -> earth / 0.2408467
        :venus -> earth / 0.61519726
        :earth -> earth
        :mars -> earth / 1.8808158
        :jupiter -> earth / 11.862615
        :saturn -> earth / 29.447498
        :uranus -> earth / 84.016846
        :neptune -> earth / 164.79132
    end
  end

  @doc """
  Another way to return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on?(planet, pos_integer) :: float
  def age_on?(planet, seconds) do
    seconds / (@seconds_in_year * @conversion[planet])
  end
end
