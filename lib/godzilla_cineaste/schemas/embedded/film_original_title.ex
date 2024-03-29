defmodule GodzillaCineaste.FilmOriginalTitle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :original, :string
    field :transliteration, :string
    field :translation, :string
  end

  def changeset(film_original_title, attrs) do
    film_original_title
    |> cast(attrs, [:original, :transliteration, :translation])
  end
end
