defmodule GodzillaCineaste.Staff do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, Group, Person}

  schema "staff" do
    field :order, :integer
    field :role, :string
    field :staff_alias, :string

    belongs_to :film, Film
    belongs_to :person, Person
    belongs_to :group, Group

    timestamps()
  end

  def changeset(staff, attrs \\ %{}) do
    staff
    |> cast(attrs, [:order, :role, :staff_alias, :film_id, :person_id, :group_id])
    |> validate_required([:order, :role, :film_id])
    |> validate_identifying_info()
    |> assoc_constraint(:film)
    |> assoc_constraint(:person)
    |> assoc_constraint(:group)
  end

  def changeset(staff, attrs, position) do
    staff
    |> cast(attrs, [:role, :staff_alias, :film_id, :person_id, :group_id])
    |> change(order: position)
    |> validate_required([:order, :role, :film_id])
    |> validate_identifying_info()
    |> assoc_constraint(:film)
    |> assoc_constraint(:person)
    |> assoc_constraint(:group)
  end

  defp validate_identifying_info(changeset) do
    case apply_changes(changeset) do
      %{person_id: nil, group_id: nil} ->
        changeset
        |> add_error(:person_id, "either person ID or group ID is required")
        |> add_error(:group_id, "either person ID or group ID is required")

      %{person_id: person_id, group_id: group_id}
      when is_binary(person_id) and is_binary(group_id) ->
        changeset
        |> add_error(:person_id, "role cannot belong to both a person and a group")
        |> add_error(:group_id, "role cannot belong to both a person and a group")

      _ ->
        changeset
    end
  end
end
