defmodule GodzillaCineaste.AuthorWork do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Entity, Work}

  schema "author_works" do
    belongs_to :entity, Entity
    belongs_to :work, Work
    timestamps()
  end

  def changeset(author_work, attrs) do
    author_work
    |> cast(attrs, [:entity_id, :work_id])
    |> validate_required([:entity_id, :work_id])
    |> assoc_constraint(:work)
    |> assoc_constraint(:entity)
  end
end
