defmodule Temperaturex.CLI do
  import Temperaturex.WeatherConditions, only: [fetch: 1]
  @moduledoc """
  CLI module provides functionality of taking and parsing
  command line arguments, and processing these arguments
  using functions defined in other modules
  """

  @doc """
  Main application function, it is invoked on application start
  and gets passed command line arguments.
  """
  @spec main(list) :: nil
  def main(argv) do
    argv
    |> parse_args
    |> process
    nil
  end

  @doc """
  `argv` is a list containing command line arguments.
  Possible argument values are:
  * -h or --help in which case it returns :help
  * weather station name, in which case given name is returned
  * otherwise returns :help
  """
  @spec parse_args(list) :: :help | String.t
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    case parse do
      { [help: true], _, _ } -> :help
      { _, [station], _ } -> String.upcase station
      _ -> :help
    end
  end


  @doc """
  Either displays help message or dispatches later
  arguments processing to external function.
  """
  @spec process(:help) :: nil
  @spec process(String.t) :: String.t
  def process(:help) do
     IO.puts """
     usage: tempx <station name>
     """
     System.halt(0)
  end
  def process(station) do
    case fetch(station) do
      {:ok, body} ->
        body
      {:error, _} ->
        IO.puts "Sorry, an error occured"
        System.halt(1)   
    end
  end

end
