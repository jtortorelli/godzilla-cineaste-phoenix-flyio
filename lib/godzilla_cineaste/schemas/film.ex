defmodule GodzillaCineaste.Film do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "films" do
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_title, :string
    field :tenant, :integer

    field :document, :map

    timestamps()
  end

  @doc false
  def changeset(film, attrs \\ %{}) do
    film
    |> cast(attrs, [
      :slug,
      :showcased,
      :tenant,
      :sort_title,
      :document
    ])
    |> validate_required([
      :slug,
      :showcased,
      :tenant,
      :sort_title,
      :document
    ])
    |> unique_constraint(:slug)
  end
end
