defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal

  action_fallback(ExmealWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{} = _meal} <- Exmeal.delete_meal(id) do
      conn
      |> Plug.Conn.send_resp(:no_content, "")
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end
end
