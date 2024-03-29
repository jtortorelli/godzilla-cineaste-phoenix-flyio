defmodule GodzillaCineaste.ProductionCommitteeStudio do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{ProductionCommittee, Studio}

  schema "production_committee_studios" do
    belongs_to :studio, Studio
    belongs_to :production_committee, ProductionCommittee
    timestamps()
  end

  def changeset(production_committee_studio, attrs) do
    production_committee_studio
    |> cast(attrs, [:studio_id, :production_committee_id])
    |> validate_required([:studio_id, :production_committee_id])
    |> assoc_constraint(:studio)
    |> assoc_constraint(:production_committee)
  end
end
