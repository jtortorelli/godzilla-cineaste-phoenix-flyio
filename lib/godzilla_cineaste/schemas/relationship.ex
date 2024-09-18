defmodule GodzillaCineaste.Relationship do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Person

  @relationships [
    :daughter,
    :father,
    :father_in_law,
    :granddaughter,
    :grandfather,
    :grandson,
    :mother,
    :nephew,
    :son,
    :son_in_law,
    :spouse,
    :uncle
  ]

  schema "relationships" do
    field :relationship, Ecto.Enum, values: @relationships
    field :order, :integer, default: 0

    belongs_to :self, Person
    belongs_to :relative, Person

    timestamps()
  end

  def changeset(relationship, attrs) do
    relationship
    |> cast(attrs, [:self_id, :relative_id, :relationship, :order])
    |> validate_required([:self_id, :relative_id, :relationship])
    |> unique_constraint([:self_id, :relative_id])
  end
end
