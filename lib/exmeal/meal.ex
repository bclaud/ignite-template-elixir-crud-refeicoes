defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @fields [:description, :date, :calories]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)
    belongs_to(:user, Exmeal.User)

    timestamps()
  end

  def changeset(params, meal \\ %__MODULE__{}) do
    meal
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
