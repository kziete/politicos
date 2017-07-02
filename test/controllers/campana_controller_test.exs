defmodule Politicos.CampanaControllerTest do
  use Politicos.ConnCase

  alias Politicos.Campana
  @valid_attrs %{fecha: %{day: 17, month: 4, year: 2010}, nombre: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, campana_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing campanas"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, campana_path(conn, :new)
    assert html_response(conn, 200) =~ "New campana"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, campana_path(conn, :create), campana: @valid_attrs
    assert redirected_to(conn) == campana_path(conn, :index)
    assert Repo.get_by(Campana, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, campana_path(conn, :create), campana: @invalid_attrs
    assert html_response(conn, 200) =~ "New campana"
  end

  test "shows chosen resource", %{conn: conn} do
    campana = Repo.insert! %Campana{}
    conn = get conn, campana_path(conn, :show, campana)
    assert html_response(conn, 200) =~ "Show campana"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, campana_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    campana = Repo.insert! %Campana{}
    conn = get conn, campana_path(conn, :edit, campana)
    assert html_response(conn, 200) =~ "Edit campana"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    campana = Repo.insert! %Campana{}
    conn = put conn, campana_path(conn, :update, campana), campana: @valid_attrs
    assert redirected_to(conn) == campana_path(conn, :show, campana)
    assert Repo.get_by(Campana, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    campana = Repo.insert! %Campana{}
    conn = put conn, campana_path(conn, :update, campana), campana: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit campana"
  end

  test "deletes chosen resource", %{conn: conn} do
    campana = Repo.insert! %Campana{}
    conn = delete conn, campana_path(conn, :delete, campana)
    assert redirected_to(conn) == campana_path(conn, :index)
    refute Repo.get(Campana, campana.id)
  end
end
