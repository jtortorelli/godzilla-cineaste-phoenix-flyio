defmodule GodzillaCineaste.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :slug, :string
    field :display_name, :string
    field :sort_name, :string
    field :showcased, :boolean, default: false
    field :tenant, :integer
    field :profession, :string
    field :avatar_url, :string
    field :japanese_name, :string
    timestamps()
  end

  def changeset(group, attrs) do
    group
    |> cast(attrs, [
      :slug,
      :display_name,
      :sort_name,
      :showcased,
      :tenant,
      :profession,
      :avatar_url,
      :japanese_name
    ])
    |> validate_required([:slug, :display_name, :showcased, :tenant])
    |> unique_constraint([:slug])
  end
end
