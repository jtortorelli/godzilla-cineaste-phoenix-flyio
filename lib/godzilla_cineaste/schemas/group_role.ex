defmodule GodzillaCineaste.GroupRole do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Character, Film, Group}

  schema "group_roles" do
    field :avatar_url, :string
    field :name, :string
    field :order, :string

    belongs_to :group, Group
    belongs_to :film, Film
    belongs_to :character, Character

    timestamps()
  end

  def changeset(group_role, attrs) do
    group_role
    |> cast(attrs, [:name, :order, :avatar_url])
    |> validate_required([:name, :order, :avatar_url])
  end
end
