defmodule GodzillaCineaste.FilmCredits do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_credits" do
    field :credits, :string
    field :slug, :string

    timestamps()
  end

  def changeset(film_credits, attrs) do
    film_credits
    |> cast(attrs, [:credits, :slug])
    |> validate_required([:credits, :slug])
  end
end
