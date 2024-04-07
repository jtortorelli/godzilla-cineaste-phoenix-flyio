defmodule GodzillaCineaste.FilmStudio do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, Studio}

  schema "film_studios" do
    belongs_to :film, Film
    belongs_to :studio, Studio
    timestamps()
  end

  def changeset(film_studio, attrs) do
    film_studio
    |> cast(attrs, [:film_id, :studio_id])
    |> validate_required([:studio_id])
    |> assoc_constraint(:studio)
  end

  def changeset(film_studio, attrs, _position) do
    changeset(film_studio, attrs)
  end
end
