defmodule GodzillaCineaste.KaijuCharacter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kaiju_characters" do
    field :display_name, :string
    field :slug, :string
    field :tenant, :integer

    timestamps()
  end

  @doc false
  def changeset(kaiju_character, attrs) do
    kaiju_character
    |> cast(attrs, [:slug, :display_name, :tenant])
    |> validate_required([:slug, :display_name, :tenant])
  end
end
