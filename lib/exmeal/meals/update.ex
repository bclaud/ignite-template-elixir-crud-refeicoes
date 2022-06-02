defmodule Exmeal.Meals.Update do
  alias Exmeal.{Repo, Error, Meal}
  alias Exmeal.Meals.Get

  def call(%{"id" => id} = params) do
    with {:ok, %Meal{} = meal} <- Get.by_id(id) do
      Meal.changeset(params, meal)
      |> Repo.update()
      |> handle_update
    else
      {:error, _reason} = error -> error
    end
  end

  defp handle_update({:ok, %Meal{}} = result), do: result

  defp handle_update({:error, %Ecto.Changeset{} = changeset}),
    do: {:error, %Error{status: :bad_request, result: changeset}}
end
