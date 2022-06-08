defmodule Exmeal.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:nome, :string)
      add(:cpf, :string)
      add(:email, :string)

      timestamps()
    end

    create(index(:users, [:email]))
  end
end
