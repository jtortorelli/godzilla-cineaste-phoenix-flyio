defmodule GodzillaCineaste.KaijuRole do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, KaijuCharacter, Person}

  schema "kaiju_role" do
    field :actor_alias, :string
    field :avatar_url, :string
    field :name, :string
    field :qualifiers, {:array, :string}
    field :order, :string
    field :uncredited, :boolean, default: false

    belongs_to :person, Person
    belongs_to :film, Film
    belongs_to :kaiju_character, KaijuCharacter

    timestamps()
  end

  @doc false
  def changeset(kaiju_role, attrs) do
    kaiju_role
    |> cast(attrs, [:name, :order, :uncredited, :avatar_url, :actor_alias])
    |> validate_required([:name, :order, :uncredited, :avatar_url, :actor_alias])
  end
end
