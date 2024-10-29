defmodule GodzillaCineaste.AwardCeremony do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Award

  schema "award_ceremonies" do
    field :ordinal, :integer
    field :held_at, :date

    belongs_to :award, Award

    timestamps()
  end

  def changeset(award_ceremony, attrs \\ %{}) do
    award_ceremony
    |> cast(attrs, [:ordinal, :held_at, :award_id])
    |> validate_required([:ordinal, :held_at, :award_id])
    |> assoc_constraint(:award)
    |> unique_constraint([:award_id, :ordinal])
  end
end
