defmodule Temperaturex.CLI do
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
      { _, [station], _ } -> station
      _ -> :help
    end
  end

end
