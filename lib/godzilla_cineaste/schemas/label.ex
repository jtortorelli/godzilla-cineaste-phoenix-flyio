defmodule GodzillaCineaste.Label do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Publisher

  schema "labels" do
    field :slug, :string
    field :name, :string

    belongs_to :publisher, Publisher

    timestamps()
  end

  def changeset(label, attrs) do
    label
    |> cast(attrs, [:slug, :name, :publisher_id])
    |> validate_required([:slug, :name, :publisher_id])
    |> assoc_constraint(:publisher)
  end
end
