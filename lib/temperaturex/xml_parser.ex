defmodule Temperaturex.XMLParser do
  @moduledoc """
  Module provides functions for simple XML parsing.
  All credits to [elixir sips](http://elixirsips.com/episodes/028_parsing_xml.html)
  """
  require Record
  Record.defrecord :xml_element, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xml_text, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @doc """
  Wrapper around :xmerl_scan.string function.
  """
  def from_string(xml_string) do
    {xml, _rest} = :xmerl_scan.string(String.to_char_list xml_string)
    xml
  end

  @doc """
  Function extracts text content from node specified by xpath
  from xml element passed as a first argument.
  """
  def get_text_content(xml, xpath)  do
    [element] = :xmerl_xpath.string(String.to_char_list(xpath), xml)
    [text] = xml_element(element, :content)
    xml_text(text, :value) |> List.to_string
  end
end
