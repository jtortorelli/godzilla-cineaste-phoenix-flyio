defmodule GodzillaCineaste.Staff do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Entity, Film}

  schema "staff" do
    field :order, :integer
    field :role, :string
    field :staff_alias, :string

    belongs_to :film, Film
    belongs_to :entity, Entity

    timestamps()
  end

  def changeset(staff, attrs \\ %{}) do
    staff
    |> cast(attrs, [:order, :role, :staff_alias, :film_id, :entity_id])
    |> validate_required([:order, :role, :film_id, :entity_id])
    |> assoc_constraint(:film)
    |> assoc_constraint(:entity)
  end

  def changeset(staff, attrs, position) do
    staff
    |> cast(attrs, [:role, :staff_alias, :film_id, :entity_id])
    |> change(order: position)
    |> validate_required([:order, :role, :film_id, :entity_id])
    |> assoc_constraint(:film)
    |> assoc_constraint(:entity)
  end
end
