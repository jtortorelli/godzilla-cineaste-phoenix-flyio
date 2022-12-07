defmodule GodzillaCineaste.AuthorWork do
  use Ecto.Schema

  schema "author_works" do
    field :person_id, :id
    field :work_id, :id
    timestamps()
  end
end
