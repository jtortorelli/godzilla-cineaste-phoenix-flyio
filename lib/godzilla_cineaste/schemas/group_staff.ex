defmodule GodzillaCineaste.GroupStaff do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, Group}

  schema "group_staff" do
    field :order, :string
    field :role, :string

    belongs_to :film, Film
    belongs_to :group, Group

    timestamps()
  end

  def changeset(group_staff, attrs) do
    group_staff
    |> cast(attrs, [:role, :order, :film_id, :group_id])
    |> validate_required([:role, :order, :film_id, :group_id])
    |> assoc_constraint(:film)
    |> assoc_constraint(:group)
  end
end
