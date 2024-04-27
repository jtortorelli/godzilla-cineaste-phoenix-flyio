defmodule GodzillaCineaste.PartialDate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :year, :integer
    field :month, :integer
    field :day, :integer
    field :unknown, :boolean
  end

  def changeset(partial_date, attrs) do
    cast(partial_date, attrs, [:year, :month, :day, :unknown])
  end
end
