defmodule Exmeal.Meals.Get do
  alias Exmeal.{Repo, Error, Meal}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, %Error{status: :not_found, result: "Meal not found"}}
      meal -> {:ok, meal}
    end
  end
end
