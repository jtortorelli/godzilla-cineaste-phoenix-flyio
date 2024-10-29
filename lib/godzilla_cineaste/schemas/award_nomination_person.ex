defmodule GodzillaCineaste.AwardNominationPerson do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AwardNomination, Person}

  schema "award_nominations_people" do
    belongs_to :person, Person
    belongs_to :award_nomination, AwardNomination

    timestamps()
  end

  def changeset(award_nomination_person, attrs \\ %{}) do
    award_nomination_person
    |> cast(attrs, [:person_id, :award_nomination_id])
    |> validate_required([:person_id, :award_nomination_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:award_nomination)
  end
end
