defmodule Slippers.DisciplinesTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import Slippers.Disciplines

  doctest Slippers.Disciplines

  @client Slippers.Client.new(
    %{access_token: Application.get_env(:slippers, :tenkft_api_token) ||
      System.get_env("TENKFT_API_TOKEN")}
  )
  @discipline_id 103834

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixture/vcr_cassettes")
    HTTPoison.start
  end

  test "find/3" do
    use_cassette "disciplines#find" do
      %{value: value} = find(@client, @discipline_id)
      assert value == "QA"
    end
  end

  test "list/1" do
    use_cassette "disciplines#list" do
      disciplines = list(@client)
      assert length(disciplines) == 2

      %{value: value} = List.last(disciplines)
      assert value == "QA"
    end
  end
end
