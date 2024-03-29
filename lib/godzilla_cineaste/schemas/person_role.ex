defmodule GodzillaCineaste.PersonRole do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Character, Film, Person}

  schema "person_roles" do
    field :actor_alias, :string
    field :avatar_url, :string
    field :description, :string
    field :name, :string
    field :order, :string
    field :uncredited, :boolean, default: false
    field :qualifiers, {:array, :string}, default: []
    field :title, :string

    belongs_to :person, Person
    belongs_to :film, Film
    belongs_to :character, Character

    timestamps()
  end

  @doc false
  def changeset(person_role, attrs) do
    person_role
    |> cast(attrs, [
      :name,
      :description,
      :order,
      :uncredited,
      :avatar_url,
      :actor_alias,
      :film_id,
      :person_id,
      :character_id,
      :qualifiers,
      :title
    ])
    |> validate_required([:order, :uncredited, :film_id, :person_id])
    |> validate_identifying_info()
    |> assoc_constraint(:person)
    |> assoc_constraint(:film)
    |> assoc_constraint(:character)
  end

  defp validate_identifying_info(changeset) do
    case apply_changes(changeset) do
      %{name: nil, description: nil} ->
        add_error(changeset, :name, "name and description cannot both be null")

      _ ->
        changeset
    end
  end
end
