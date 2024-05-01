defmodule GodzillaCineaste.PersonAlternateName do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :name, :string
    field :japanese_name, :string
    field :category, Ecto.Enum, values: [:birth_name, :alias, :mistranslation]
    field :context, :string
  end

  def changeset(person_alternate_name, attrs) do
    cast(person_alternate_name, attrs, [:name, :japanese_name, :category, :context])
  end
end
