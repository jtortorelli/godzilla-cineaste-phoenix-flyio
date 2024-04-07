defmodule GodzillaCineaste.KaijuRole do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Entity, Film, KaijuCharacter, KaijuVariant}

  schema "kaiju_roles" do
    field :actor_alias, :string
    field :avatar_url, :string
    field :name, :string
    field :order, :integer
    field :qualifiers, {:array, :string}
    field :uncredited, :boolean, default: false

    belongs_to :entity, Entity
    belongs_to :film, Film
    belongs_to :kaiju_character, KaijuCharacter
    belongs_to :kaiju_variant, KaijuVariant

    timestamps()
  end

  @doc false
  def changeset(kaiju_role, attrs) do
    kaiju_role
    |> cast(attrs, [
      :actor_alias,
      :avatar_url,
      :film_id,
      :kaiju_character_id,
      :kaiju_variant_id,
      :name,
      :order,
      :entity_id,
      :qualifiers,
      :uncredited
    ])
    |> validate_required([:film_id, :name, :order, :uncredited])
    |> assoc_constraint(:film)
    |> assoc_constraint(:kaiju_character)
    |> assoc_constraint(:kaiju_variant)
    |> assoc_constraint(:entity)
  end

  def changeset(kaiju_role, attrs, position) do
    kaiju_role
    |> cast(attrs, [
      :actor_alias,
      :avatar_url,
      :film_id,
      :kaiju_character_id,
      :kaiju_variant_id,
      :name,
      :uncredited
    ])
    |> cast(attrs, [:qualifiers], empty_values: [])
    |> change(order: position)
    |> validate_required([:name, :order, :uncredited])
    |> assoc_constraint(:film)
    |> assoc_constraint(:kaiju_character)
    |> assoc_constraint(:kaiju_variant)
  end
end
