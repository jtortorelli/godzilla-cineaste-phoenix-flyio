defmodule GodzillaCineaste.Work do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{
    AuthorWork,
    Entity,
    Film,
    FilmWork,
    Label,
    Publisher,
    Studio,
    StudioWork
  }

  @formats [
    :anime,
    :manga,
    :novel,
    :"novel series",
    :"original story",
    :"picture story",
    :screenplay,
    :"serialized novel",
    :"short story",
    :"unpublished novel"
  ]

  schema "works" do
    field :format, Ecto.Enum, values: @formats
    field :slug, :string
    field :title, :string
    field :year, :integer

    belongs_to :publisher, Publisher
    belongs_to :label, Label

    many_to_many :authors, Entity, join_through: AuthorWork
    many_to_many :films, Film, join_through: FilmWork
    many_to_many :studios, Studio, join_through: StudioWork

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:slug, :title, :format, :year, :publisher_id, :label_id])
    |> validate_required([:slug, :format])
    |> assoc_constraint(:publisher)
    |> assoc_constraint(:label)
  end
end
