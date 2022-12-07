defmodule GodzillaCineaste.Film do
  use Ecto.Schema
  import Ecto.Changeset

  schema "films" do
    field :release_date, :date
    field :runtime, :integer
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_title, :string
    field :tenant, :integer
    field :title, :string

    field :aliases, {:array, :map}
    field :poster_urls, {:array, :map}
    field :original_title, :map

    timestamps()
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:slug, :title, :release_date, :runtime, :showcased, :tenant, :sort_title])
    |> validate_required([:slug, :title, :release_date, :runtime, :showcased, :tenant, :sort_title])
  end
end
