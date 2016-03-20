defmodule Temperaturex.WeatherConditions do
  require Logger
  @moduledoc """
  This module provides functionality for fetching weather condition
  data from US NOAA API.
  """
  @noaa_url Application.get_env(:temperaturex, :noaa_url)

  @doc """
  Fetches weather condition data.
  """
  @spec fetch(String.t) :: tuple
  def fetch(station) do
    data_url = "#{@noaa_url}/#{station}.xml"
    Logger.info "Fetching data from #{data_url}"
    HTTPoison.get(data_url) |> handle
  end

  @doc """
  Handles response returned by NOAA's API.
  """
  @spec handle(tuple) :: tuple
  def handle({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  def handle({_, %{status_code: status, body: body}}) do
    Logger.error "Error: #{status} returned"
    {:error, body}
  end

end
