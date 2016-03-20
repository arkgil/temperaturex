defmodule WeatherConditions do
  @moduledoc """
  This module provides functionality for fetching weather condition
  data from US NOAA API.
  """
  @noaa_url Application.get_env(:temperaturex, :noaa_url)

  @doc """
  Fetches weather condition data.
  """
  def fetch(station) do
    response = HTTPoison.get("#{@noaa_url}/#{station}.xml")
    response
  end

end
