defmodule Slippers.Roles do
  import Slippers
  alias Slippers.Client

  @doc """
  Get a single `role`.
  ## Example
      Slippers.Roles.find(client, "12345")
  More info at: https://github.com/10Kft/10kft-api/blob/master/sections/roles.md#show-role
  """
  @spec find(Client.t, pos_integer, [{atom, binary}] | []) :: Slippers.response
  def find(client, role_id, params \\ []) do
    get("roles/#{role_id}", client, params)
  end

  @doc """
  Get all roles.
  ## Example
      Slippers.Roles.list(client)
  More info at: https://github.com/10Kft/10kft-api/blob/master/sections/roles.md#list-roles-index
  """
  @spec list(Client.t, [{atom, binary}] | []) :: Slippers.response
  def list(client, params \\ []) do
    get("roles", client, params)
    |> Slippers.Parser.parse_list
  end
end
