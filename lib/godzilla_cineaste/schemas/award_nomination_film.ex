defmodule GodzillaCineaste.AwardNominationFilm do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AwardNomination, Film}

  schema "award_nominations_films" do
    belongs_to :film, Film
    belongs_to :award_nomination, AwardNomination

    timestamps()
  end

  def changeset(award_nomination_film, attrs \\ %{}) do
    award_nomination_film
    |> cast(attrs, [:film_id, :award_nomination_id])
    |> validate_required([:film_id, :award_nomination_id])
    |> assoc_constraint(:film)
    |> assoc_constraint(:award_nomination)
  end
end
