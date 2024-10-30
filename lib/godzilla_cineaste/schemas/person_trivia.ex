defmodule GodzillaCineaste.PersonTrivia do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Person

  schema "people_trivia" do
    field :trivia, {:array, :binary}

    belongs_to :person, Person

    timestamps()
  end

  def changeset(person_trivia, attrs \\ %{}) do
    person_trivia
    |> cast(attrs, [:trivia, :person_id])
    |> validate_required([:trivia, :person_id])
    |> unique_constraint(:person_id)
    |> assoc_constraint(:person)
  end
end
