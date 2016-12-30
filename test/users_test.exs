defmodule Slippers.UsersTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import Slippers.Users

  doctest Slippers.Users

  @client Slippers.Client.new(%{access_token: Application.get_env(:slippers, :tenkft_api_token)})
  @user_id Application.get_env(:slippers, :tenkft_user_id)

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixture/vcr_cassettes")
    HTTPoison.start
  end

  test "find/3" do
    use_cassette "users#find" do
      %{last_name: last_name, email: email} = find(@client, @user_id)
      assert last_name == "Jane"
      assert email == "mj@test.com"
    end
  end

  test "list/1" do
    use_cassette "users#list" do
      users = list(@client)
      assert length(users) == 2

      %{last_name: last_name} = List.last(users)
      assert last_name == "Jane"
    end
  end
end
