defmodule GodzillaCineaste.FilmWork do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, Work}

  schema "film_works" do
    belongs_to :film, Film
    belongs_to :work, Work
    timestamps()
  end

  def changeset(film_work, attrs) do
    film_work
    |> cast(attrs, [:film_id, :work_id])
    |> validate_required([:film_id, :work_id])
    |> assoc_constraint(:film)
    |> assoc_constraint(:work)
  end
end
