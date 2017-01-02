defmodule Slippers.RolesTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import Slippers.Roles

  doctest Slippers.Roles

  @client Slippers.Client.new(
    %{access_token: Application.get_env(:slippers, :tenkft_api_token) ||
      System.get_env("TENKFT_API_TOKEN")}
  )
  @role_id 103840

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixture/vcr_cassettes")
    HTTPoison.start
  end

  test "find/3" do
    use_cassette "roles#find" do
      %{value: value} = find(@client, @role_id)
      assert value == "QA Analyst"
    end
  end

  test "list/1" do
    use_cassette "roles#list" do
      roles = list(@client)
      assert length(roles) == 2

      %{value: value} = List.last(roles)
      assert value == "QA Analyst"
    end
  end
end
