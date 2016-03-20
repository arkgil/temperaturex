defmodule XMLParserTest do
  use ExUnit.Case
  import Temperaturex.XMLParser, only: [from_string: 1, get_text_content: 2]

  def sample_xml do
    """
    <html>
      <head>
        <title>Heya, Ho!</title>
      </head>
      <body>
        <p>This is my sweet parser <3</p>
      </body>
    </html>
    """
  end

  test "get title tag content" do
    path = "/html/head/title"
    xml = from_string(sample_xml)
    assert get_text_content(xml, path) == "Hya, Ho!"
  end
end
