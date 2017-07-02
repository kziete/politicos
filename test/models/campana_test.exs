defmodule Politicos.CampanaTest do
  use Politicos.ModelCase

  alias Politicos.Campana

  @valid_attrs %{fecha: %{day: 17, month: 4, year: 2010}, nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Campana.changeset(%Campana{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Campana.changeset(%Campana{}, @invalid_attrs)
    refute changeset.valid?
  end
end
