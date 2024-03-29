defmodule GodzillaCineaste.FilmCredits do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Film

  schema "film_credits" do
    field :credits, :string

    belongs_to :film, Film

    timestamps()
  end

  def changeset(film_credits, attrs) do
    film_credits
    |> cast(attrs, [:credits, :film_id])
    |> validate_required([:credits])
    |> assoc_constraint(:film)
  end
end
