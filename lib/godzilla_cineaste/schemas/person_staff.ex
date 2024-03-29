defmodule GodzillaCineaste.PersonStaff do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Film, Person}

  schema "person_staff" do
    field :order, :string
    field :role, :string

    belongs_to :film, Film
    belongs_to :person, Person

    timestamps()
  end

  @doc false
  def changeset(person_staff, attrs) do
    person_staff
    |> cast(attrs, [:role, :order, :person_id, :film_id])
    |> validate_required([:role, :order, :person_id, :film_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:film)
  end
end
