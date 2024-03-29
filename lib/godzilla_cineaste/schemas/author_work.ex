defmodule GodzillaCineaste.AuthorWork do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.Work

  schema "author_works" do
    belongs_to :person, Person
    belongs_to :work, Work
    timestamps()
  end

  def changeset(author_work, attrs) do
    author_work
    |> cast(attrs, [:person_id, :work_id])
    |> validate_required([:person_id, :work_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:work)
  end
end
