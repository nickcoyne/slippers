defmodule Slippers.Client do
  defstruct auth: nil,
            endpoint: Application.get_env(:slippers, :tenkft_endpoint) ||
                        System.get_env("TENKFT_ENDPOINT") ||
                        "https://api.10000ft.com/api/v1/"

  @type auth :: %{access_token: binary}
  @type t :: %__MODULE__{auth: auth, endpoint: binary}

  @spec new() :: t
  def new(), do: %__MODULE__{}

  @spec new(auth) :: t
  def new(auth),  do: %__MODULE__{auth: auth}

  @spec new(auth, binary) :: t
  def new(auth, endpoint) do
    endpoint = if String.ends_with?(endpoint, "/") do
      endpoint
    else
      endpoint <> "/"
    end
    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end
