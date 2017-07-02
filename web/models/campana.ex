defmodule Politicos.Campana do
  use Politicos.Web, :model

  schema "campanas" do
    field :nombre, :string
    field :fecha, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :fecha])
    |> validate_required([:nombre, :fecha])
  end
end
