defmodule GodzillaCineaste.Place do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :city, :string
    field :country_subdivision, :string
    field :country, :string
  end

  def changeset(place, attrs) do
    cast(place, attrs, [:city, :country_subdivision, :country])
  end
end
