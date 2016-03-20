defmodule Temperaturex.CLI do

  def main(argv) do
    argv
    |> parse_args
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    case parse do
      { [help: true], _, _ } -> :help
      { _, [station], _ } -> station
      _ -> :help 
    end
  end

end
