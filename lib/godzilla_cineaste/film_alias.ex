defmodule GodzillaCineaste.FilmAlias do
  use Ecto.Schema

  embedded_schema do
    field :title, :string
    field :context, :string
  end
end
