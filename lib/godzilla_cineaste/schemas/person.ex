defmodule GodzillaCineaste.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AuthorWork, KaijuRole, Role, Staff, Work}

  schema "people" do
    field :display_name, :string
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_name, :string
    field :tenant, :integer
    field :disambig_chars, :string
    field :avatar_url, :string

    has_many :kaiju_roles, KaijuRole
    has_many :roles, Role
    has_many :staff, Staff

    many_to_many :works, Work, join_through: AuthorWork

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:avatar_url, :slug, :display_name, :sort_name, :showcased, :tenant])
    |> validate_required([:slug, :display_name, :sort_name, :showcased, :tenant])
  end
end
