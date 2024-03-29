defmodule GodzillaCineaste.Group do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Role, Staff}

  schema "groups" do
    field :display_name, :string
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_name, :string
    field :tenant, :integer
    field :avatar_url, :string

    has_many :roles, Role
    has_many :staff, Staff

    timestamps()
  end

  def changeset(group, attrs) do
    group
    |> cast(attrs, [:avatar_url, :slug, :display_name, :sort_name, :showcased, :tenant])
    |> validate_required([:slug, :display_name, :sort_name, :showcased, :tenant])
  end
end
