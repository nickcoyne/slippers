defmodule Slippers.Disciplines do
  import Slippers
  alias Slippers.Client

  @doc """
  Get a single `discipline`.
  ## Example
      Slippers.Disciplines.find(client, "12345")
  More info at: https://github.com/10Kft/10kft-api/blob/master/sections/disciplines.md#show-discipline
  """
  @spec find(Client.t, pos_integer, [{atom, binary}] | []) :: Slippers.response
  def find(client, discipline_id, params \\ []) do
    get("disciplines/#{discipline_id}", client, params)
  end

  @doc """
  Get all disciplines.
  ## Example
      Slippers.Disciplines.list(client)
  More info at: https://github.com/10Kft/10kft-api/blob/master/sections/disciplines.md#list-disciplines-index
  """
  @spec list(Client.t, [{atom, binary}] | []) :: Slippers.response
  def list(client, params \\ []) do
    get("disciplines", client, params)
    |> Slippers.Parser.parse_list
  end
end
