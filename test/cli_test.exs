defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Temperaturex.CLI, only: [parse_args: 1, process: 1]

  test ":help is returned when parsing -h or --help options" do
    assert parse_args(["--help"]) == :help
    assert parse_args(["-h"]) == :help
  end

  test "option is returned when one option is given" do
    assert parse_args(["potato"]) == "potato"
  end

  test ":help is returned when two or more options are given" do
    assert parse_args(["1", "2", "3"]) == :help
    assert parse_args(["1", "2"]) == :help
  end

  test "help message is displayed when help flags are given" do
    fun = fn -> process(:help) end
    assert capture_io(fun) == "usage: tempx <station name>\n\n"
  end
end
