defmodule Slippers.Users do
  import Slippers
  alias Slippers.Client

  @doc """
  Get a single `user`.
  ## Example
      Slippers.Users.find(client, "12345")
  More info at: https://github.com/10Kft/10kft-api/blob/master/sections/users.md#show-user
  """
  @spec find(Client.t, pos_integer, [{atom, binary}] | []) :: Slippers.response
  def find(client, user_id, params \\ []) do
    get("users/#{user_id}", client, params)
  end

  @doc """
  Get all users.
  ## Example
      Slippers.Users.list(client)
  More info at: https://github.com/10Kft/10kft-api/blob/master/sections/users.md#list-users-index
  """
  @spec list(Client.t, [{atom, binary}] | []) :: Slippers.response
  def list(client, params \\ []) do
    get("users", client, params)
  end
end
