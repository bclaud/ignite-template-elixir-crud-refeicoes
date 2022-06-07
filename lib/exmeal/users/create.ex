defmodule Exmeal.Users.Create do
  alias Exmeal.{Repo, User, Error}

  @spec call(map) :: {:ok, User.t()} | {:error, Error.t()}
  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, %Ecto.Changeset{} = changeset}),
    do: {:error, Error.build(:bad_request, changeset)}
end
