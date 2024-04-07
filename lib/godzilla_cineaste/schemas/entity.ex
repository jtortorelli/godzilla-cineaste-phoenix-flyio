defmodule GodzillaCineaste.Entity do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "entities" do
    field :avatar_url, :string
    field :display_name, :string
    field :metadata, :map, default: %{}
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_name, :string
    field :tenant, :integer
    field :type, Ecto.Enum, values: [:person, :group]

    timestamps()
  end

  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [
      :avatar_url,
      :display_name,
      :metadata,
      :showcased,
      :slug,
      :sort_name,
      :tenant,
      :type
    ])
    |> validate_required([:display_name, :showcased, :slug, :sort_name, :tenant, :type])
  end
end
