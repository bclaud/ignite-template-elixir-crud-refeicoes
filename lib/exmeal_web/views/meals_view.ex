defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  @attrs_to_show [:date, :description, :calories, :id]

  def render("create.json", %{meal: meal}) do
    %{message: "Meal created!", meal: %{meal: Map.take(meal, @attrs_to_show)}}
  end

  def render("show.json", %{meal: meal}) do
    %{meal: Map.take(meal, @attrs_to_show)}
  end
end
