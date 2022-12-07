defmodule GodzillaCineaste.Studio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "studios" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(studio, attrs) do
    studio
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end
