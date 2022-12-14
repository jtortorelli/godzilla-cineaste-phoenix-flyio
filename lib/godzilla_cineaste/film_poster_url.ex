defmodule GodzillaCineaste.FilmPosterUrl do
  use Ecto.Schema

  embedded_schema do
    field :url, :string
    field :primary, :boolean
  end
end
