defmodule Exmeal.User do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @fields [:nome, :cpf, :email]

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:nome, :string)
    field(:cpf, :string)
    field(:email, :string)
    has_many(:meals, Exmeal.Meal)

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> Ecto.Changeset.cast(params, @fields)
    |> validate_required(@fields)
  end
end
