defmodule Exmeal.Error do
  @type t :: %__MODULE__{}
  @enforce_keys [:status, :result]

  defstruct [:status, :result]

  @type response_status() :: :not_found | :bad_request

  @spec build(response_status(), String.t() | Ecto.Changeset.t()) :: %__MODULE__{
          status: response_status(),
          result: String.t() | Ecto.Changeset.t()
        }
  def build(status, result) do
    %__MODULE__{status: status, result: result}
  end
end
