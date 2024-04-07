defmodule GodzillaCineaste.ProductionCommittee do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Studio, ProductionCommitteeStudio}

  schema "production_committees" do
    field :slug, :string
    field :display_name, :string

    many_to_many :studios, Studio, join_through: ProductionCommitteeStudio

    timestamps()
  end

  def changeset(production_committee, attrs) do
    production_committee
    |> cast(attrs, [:slug, :display_name])
    |> validate_required([:slug, :display_name])
    |> unique_constraint(:slug)
  end
end
