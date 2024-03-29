defmodule GodzillaCineaste.Studio do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, FilmStudio}

  schema "studios" do
    field :abbreviation, :string
    field :aliases, {:array, :string}
    field :display_name, :string
    field :better_display_name, :string
    field :original_name, :string
    field :slug, :string

    many_to_many :films, Film, join_through: FilmStudio

    timestamps()
  end

  @doc false
  def changeset(studio, attrs) do
    studio
    |> cast(attrs, [:abbreviation, :aliases, :display_name, :original_name, :slug])
    |> validate_required([:slug, :display_name])
    |> unique_constraint(:slug)
  end
end
