defmodule Politicos.Repo.Migrations.CreateCampana do
  use Ecto.Migration

  def change do
    create table(:campanas) do
      add :nombre, :string
      add :fecha, :date

      timestamps()
    end

  end
end
