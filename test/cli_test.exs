defmodule CLITest do
  use ExUnit.Case
  import Temperaturex.CLI, only: [parse_args: 1]

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
end
