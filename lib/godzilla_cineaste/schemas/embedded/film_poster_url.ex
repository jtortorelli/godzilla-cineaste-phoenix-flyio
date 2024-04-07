defmodule GodzillaCineaste.FilmPosterUrl do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :url, :string
    field :primary, :boolean
  end

  def changeset(film_poster_url, attrs \\ %{}) do
    film_poster_url
    |> cast(attrs, [:url, :primary])
    |> validate_required([:url, :primary])
  end
end
