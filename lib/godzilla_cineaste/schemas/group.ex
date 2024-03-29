defmodule GodzillaCineaste.Group do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{GroupRole, GroupStaff}

  schema "groups" do
    field :display_name, :string
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_name, :string
    field :tenant, :integer

    has_many :group_roles, GroupRole
    has_many :group_staff, GroupStaff

    timestamps()
  end

  def changeset(group, attrs) do
    group
    |> cast(attrs, [:slug, :display_name, :sort_name, :showcased, :tenant])
    |> validate_required([:slug, :display_name, :sort_name, :showcased, :tenant])
  end
end
