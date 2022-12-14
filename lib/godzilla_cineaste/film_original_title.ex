defmodule GodzillaCineaste.FilmOriginalTitle do
  use Ecto.Schema

  embedded_schema do
    field :original, :string
    field :transliteration, :string
    field :translation, :string
  end
end
