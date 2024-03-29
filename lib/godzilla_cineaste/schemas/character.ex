defmodule GodzillaCineaste.Character do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Role

  schema "characters" do
    field :display_name, :string
    field :showcased, :boolean, default: false
    field :slug, :string
    field :tenant, :integer

    has_many :roles, Role

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:slug, :display_name, :showcased, :tenant])
    |> validate_required([:slug, :display_name, :showcased, :tenant])
  end
end
