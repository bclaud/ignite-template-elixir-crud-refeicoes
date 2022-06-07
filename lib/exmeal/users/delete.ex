defmodule Exmeal.Users.Delete do
  alias Exmeal.{User, Repo, Error}
  alias Exmeal.Users.Get

  @spec call(:binary_id) :: {:ok, User.t()} | {:error, Error.t()}
  def call(id) do
    case Get.by_id(id) do
      {:ok, %User{} = user} -> Repo.delete(user)
      {:error, _result} = error -> error
    end
  end
end
