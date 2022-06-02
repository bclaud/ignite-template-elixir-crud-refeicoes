defmodule Exmeal.Meals.Create do
  alias Exmeal.{Repo, Error, Meal}

  def call(meal) do
    meal
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, %Ecto.Changeset{} = changeset}),
    do: {:error, %Error{status: :bad_request, result: changeset}}
end
