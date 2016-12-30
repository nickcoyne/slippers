defmodule Slippers.Parser do
  @moduledoc """
  Parse API results usable data.
  """

  # @doc """
  # Parse list data from response.
  # """
  # @spec parse_list(Map.t) :: Slippers.response
  def parse_list(response_body) do
    response_body.data
  end
end
