defmodule Exmeal.Users.Update do
  alias Exmeal.{User, Repo}
  alias Exmeal.Users.Get

  @spec call(map) :: {:ok, User.t()} | {:error, Error.t()}
  def call(%{"id" => id} = params) do
    with {:ok, %User{} = user} <- Get.by_id(id) do
      user
      |> User.changeset(params)
      |> Repo.update()
    end
  end
end
