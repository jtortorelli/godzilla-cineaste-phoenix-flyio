defmodule GodzillaCineaste.Role do
  use Ecto.Schema
  import Ecto.Changeset

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
      :description,
      :name,
      :order,
      :uncredited,
      :qualifiers,
      :title,
      :film_id,
      :character_id,
      :person_id,
      :group_id,
      :top_billed,
      :mergeable,
      :role_qualifiers,
      :character_qualifiers
    ])
    |> validate_required([:order, :uncredited, :film_id, :top_billed])
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
      :person_id,
      :group_id,
      :top_billed,
      :mergeable,
      :role_qualifiers,
      :character_qualifiers
    ])
    |> change(order: position)
    |> validate_required([:order, :uncredited, :film_id])
    |> validate_identifying_info()
    |> assoc_constraint(:film)
    |> assoc_constraint(:character)
    |> assoc_constraint(:person)
    |> assoc_constraint(:group)
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
