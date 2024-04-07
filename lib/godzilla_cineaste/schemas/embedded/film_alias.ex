defmodule GodzillaCineaste.FilmAlias do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :title, :string
    field :context, :string
  end

  def changeset(film_alias, attrs \\ %{}) do
    film_alias
    |> cast(attrs, [:title, :context])
    |> validate_required([:title, :context])
  end
end
