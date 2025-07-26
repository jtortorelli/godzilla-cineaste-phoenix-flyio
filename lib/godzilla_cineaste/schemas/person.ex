defmodule GodzillaCineaste.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :slug, :string
    field :sort_name, :string
    field :showcased, :boolean, default: false
    field :tenant, :integer

    field :document, :map

    timestamps()
  end

  def changeset(person, attrs) do
    person
    |> cast(attrs, [
      :slug,
      :sort_name,
      :showcased,
      :tenant,
      :document
    ])
    |> validate_required([:slug, :display_name, :showcased, :tenant])
    |> unique_constraint([:slug])
  end
end
