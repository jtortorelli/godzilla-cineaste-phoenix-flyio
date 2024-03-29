defmodule GodzillaCineaste.FilmSynopsis do
  use Ecto.Schema

  alias GodzillaCineaste.Film

  schema "film_synopses" do
    field :synopsis, :string

    belongs_to :film, Film

    timestamps()
  end
end
