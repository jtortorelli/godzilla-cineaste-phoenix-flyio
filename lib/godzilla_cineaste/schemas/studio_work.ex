defmodule GodzillaCineaste.StudioWork do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Studio, Work}

  schema "studio_works" do
    belongs_to :studio, Studio
    belongs_to :work, Work

    timestamps()
  end

  def changeset(studio_work, attrs) do
    studio_work
    |> cast(attrs, [:studio_id, :work_id])
    |> validate_required([:studio_id, :work_id])
    |> assoc_constraint(:studio)
    |> assoc_constraint(:work)
  end
end
