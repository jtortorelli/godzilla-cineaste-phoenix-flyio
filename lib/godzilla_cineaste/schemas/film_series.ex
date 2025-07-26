defmodule GodzillaCineaste.FilmSeries do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_series" do
    field :slug, :string

    field :document, :map

    timestamps()
  end

  @doc false
  def changeset(film_series, attrs) do
    film_series
    |> cast(attrs, [:slug, :document])
    |> validate_required([:slug, :document])
  end
end
