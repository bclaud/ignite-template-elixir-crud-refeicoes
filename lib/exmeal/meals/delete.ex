defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Repo, Meal}
  alias Exmeal.Meals.Get

  def call(id) do
    with {:ok, %Meal{} = meal} <- Get.by_id(id) do
      Repo.delete(meal)
      |> handle_delete
    else
      {:error, _reason} = error -> error
    end
  end

  defp handle_delete({:ok, %Meal{}} = result), do: result
end
