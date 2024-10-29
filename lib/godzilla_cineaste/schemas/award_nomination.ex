defmodule GodzillaCineaste.AwardNomination do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AwardCategory, AwardNominationFilm, AwardNominationPerson, Film, Person}

  schema "award_nominations" do
    field :won, :boolean

    belongs_to :category, AwardCategory
    many_to_many :films, Film, join_through: AwardNominationFilm
    many_to_many :people, Person, join_through: AwardNominationPerson
    timestamps()
  end

  def changeset(award_nomination, attrs \\ %{}) do
    award_nomination
    |> cast(attrs, [:won, :category_id])
    |> validate_required([:won, :category_id])
    |> assoc_constraint(:category)
  end
end
