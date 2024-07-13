defmodule GodzillaCineaste.GroupMember do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Group, Person}

  schema "group_members" do
    belongs_to :group, Group
    belongs_to :person, Person

    timestamps()
  end

  def changeset(group_member, attrs) do
    group_member
    |> cast(attrs, [:group_id, :person_id])
    |> validate_required([:group_id, :person_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:group)
  end
end
