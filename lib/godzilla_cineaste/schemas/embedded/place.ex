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

  def display_place(%__MODULE__{
        city: city,
        country_subdivision: country_subdivision,
        country: country
      }) do
    [city, country_subdivision, country]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(", ")
  end
end
