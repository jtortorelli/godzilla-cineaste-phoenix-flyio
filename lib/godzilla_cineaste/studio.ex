defmodule GodzillaCineaste.Studio do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, FilmStudio}

  schema "studios" do
    field :name, :string
    field :slug, :string

    many_to_many :films, Film, join_through: FilmStudio

    timestamps()
  end

  @doc false
  def changeset(studio, attrs) do
    studio
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end
