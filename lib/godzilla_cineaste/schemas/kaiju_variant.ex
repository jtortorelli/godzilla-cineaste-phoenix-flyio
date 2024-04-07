defmodule GodzillaCineaste.KaijuVariant do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.KaijuCharacter

  schema "kaiju_variants" do
    field :display_name, :string
    field :slug, :string

    belongs_to :kaiju_character, KaijuCharacter

    timestamps()
  end

  def changeset(kaiju_variant, attrs) do
    kaiju_variant
    |> cast(attrs, [
      :display_name,
      :slug,
      :kaiju_character_id
    ])
    |> validate_required([:display_name, :slug, :kaiju_character_id])
    |> assoc_constraint(:kaiju_character)
  end
end
