defmodule GodzillaCineaste.FilmCredits do
  use Ecto.Schema

  alias GodzillaCineaste.Film

  schema "film_credits" do
    field :credits, :string

    belongs_to :film, Film

    timestamps()
  end
end
