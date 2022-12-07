defmodule GodzillaCineaste.FilmStudio do
  use Ecto.Schema

  schema "film_studios" do
    field :film_id, :id
    field :studio_id, :id
    timestamps()
  end
end
