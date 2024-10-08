defmodule GodzillaCineaste.Role do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Person
  alias GodzillaCineaste.{Character, Film, Group, Person}

  schema "roles" do
    field :actor_alias, :string
    field :avatar_url, :string
    field :description, :string
    field :name, :string
    field :order, :integer
    field :uncredited, :boolean, default: false
    field :qualifiers, {:array, :string}, default: []
    field :title, :string
    field :top_billed, :boolean, default: true
    field :mergeable, :boolean, default: false
    field :role_qualifiers, :string
    field :character_qualifiers, :string

    belongs_to :film, Film
    belongs_to :character, Character
    belongs_to :person, Person
    belongs_to :group, Group

    timestamps()
  end

  def changeset(role, attrs \\ %{}) do
    role
    |> cast(attrs, [
      :actor_alias,
      :avatar_url,
      :character_id,
      :character_qualifiers,
      :description,
      :film_id,
      :group_id,
      :mergeable,
      :name,
      :order,
      :person_id,
      :qualifiers,
      :role_qualifiers,
      :uncredited,
      :title,
      :top_billed
    ])
    |> validate_required([
      :order,
      :uncredited,
      :film_id,
      :top_billed
    ])
    |> validate_identifying_info()
    |> assoc_constraint(:film)
    |> assoc_constraint(:character)
    |> assoc_constraint(:person)
    |> assoc_constraint(:group)
  end

  def changeset(role, attrs, position) do
    role
    |> cast(attrs, [
      :actor_alias,
      :avatar_url,
      :description,
      :name,
      :uncredited,
      :qualifiers,
      :title,
      :film_id,
      :character_id,
      :top_billed,
      :mergeable,
      :role_qualifiers,
      :character_qualifiers,
      :person_id,
      :group_id
    ])
    |> change(order: position)
    |> validate_required([:order, :uncredited, :film_id])
    |> validate_identifying_info()
    |> assoc_constraint(:film)
    |> assoc_constraint(:character)
    |> assoc_constraint(:person)
    |> assoc_constraint(:group)
  end

  def role_display_name(%__MODULE__{} = role) do
    [role.title, process_role_name(role.name || role.description)] |> Enum.join(" ")
  end

  def process_role_name(role_name) do
    role_name
    |> String.replace("-maru", "<span class=\"italic\">-maru</span>")
    |> String.replace("-seijin", "<span class=\"italic\">-seijin</span>")
    |> String.replace("Gôtengô", "<span class=\"italic\">Gôtengô</span>")
    |> String.replace("Eclair", "<span class=\"italic\">Eclair</span>")
    |> String.replace("Karyû", "<span class=\"italic\">Karyû</span>")
  end

  defp validate_identifying_info(changeset) do
    case apply_changes(changeset) do
      %{name: nil, description: nil} ->
        changeset
        |> add_error(:name, "name and description cannot both be null")
        |> add_error(:description, "name and description cannot both be null")

      _ ->
        changeset
    end
  end
end
