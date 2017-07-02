defmodule Politicos.CampanaController do
  use Politicos.Web, :controller

  alias Politicos.Campana

  def index(conn, _params) do
    campanas = Repo.all(Campana)
    render(conn, "index.html", campanas: campanas)
  end

  def new(conn, _params) do
    changeset = Campana.changeset(%Campana{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"campana" => campana_params}) do
    changeset = Campana.changeset(%Campana{}, campana_params)

    case Repo.insert(changeset) do
      {:ok, _campana} ->
        conn
        |> put_flash(:info, "Campana created successfully.")
        |> redirect(to: campana_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    campana = Repo.get!(Campana, id)
    render(conn, "show.html", campana: campana)
  end

  def edit(conn, %{"id" => id}) do
    campana = Repo.get!(Campana, id)
    changeset = Campana.changeset(campana)
    render(conn, "edit.html", campana: campana, changeset: changeset)
  end

  def update(conn, %{"id" => id, "campana" => campana_params}) do
    campana = Repo.get!(Campana, id)
    changeset = Campana.changeset(campana, campana_params)

    case Repo.update(changeset) do
      {:ok, campana} ->
        conn
        |> put_flash(:info, "Campana updated successfully.")
        |> redirect(to: campana_path(conn, :show, campana))
      {:error, changeset} ->
        render(conn, "edit.html", campana: campana, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    campana = Repo.get!(Campana, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(campana)

    conn
    |> put_flash(:info, "Campana deleted successfully.")
    |> redirect(to: campana_path(conn, :index))
  end
end
