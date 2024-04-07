defmodule GodzillaCineaste.FilmDisplayTitle do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :style, Ecto.Enum, values: [:title, :subtitle]
    field :content, :string
  end

  def changeset(film_display_title, attrs) do
    film_display_title
    |> cast(attrs, [:style, :content])
  end
end
