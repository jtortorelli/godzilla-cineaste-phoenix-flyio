defmodule GodzillaCineaste.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AuthorWork, KaijuRole, PersonRole, PersonStaff, Work}

  schema "people" do
    field :display_name, :string
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_name, :string
    field :tenant, :integer

    has_many :kaiju_roles, KaijuRole
    has_many :person_roles, PersonRole
    has_many :person_staff, PersonStaff

    many_to_many :works, Work, join_through: AuthorWork

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:slug, :display_name, :sort_name, :showcased, :tenant])
    |> validate_required([:slug, :display_name, :sort_name, :showcased, :tenant])
  end
end
