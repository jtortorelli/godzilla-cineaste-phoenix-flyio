defmodule GodzillaCineaste.Work do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AuthorWork, Person}

  schema "works" do
    field :format, Ecto.Enum, values: [:novel, :manga]
    field :title, :string

    many_to_many :authors, Person, join_through: AuthorWork

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:title, :format])
    |> validate_required([:title, :format])
  end
end
