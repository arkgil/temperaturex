defmodule Temperaturex.Printer do
  import Temperaturex.XMLParser, only: [get_text_content: 2]
  @xml_base_path "/current_observation/"
  @data_tags [:location, :weather, :temperature_string, :wind_string,
              :windchill_string]

  def print(xml) do
    @data_tags
    |> Enum.map(&get_data(xml, &1))
    |> Enum.map(&get_header/1)
    |> Enum.each(&print_data/1)
  end

  def get_data(xml, tag) do
    data = get_text_content(xml, "#{@xml_base_path}#{tag}")
    {tag, data}
  end

  def get_header({tag, data}) do
    header =
      tag
      |> Atom.to_string()
      |> String.split("_")
      |> Enum.at(0)
      |> String.capitalize()
    {header, data}
  end

  def print_data({header, data}) do
    IO.puts "#{header}: #{data}"
  end

end
