defmodule GodzillaCineaste.FilmSeries do
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_series" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(film_series, attrs) do
    film_series
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end
