defmodule GodzillaCineaste.TVSeriesMainCast do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Person, TVSeries}

  schema "tv_series_main_cast" do
    field :name, :string
    field :order, :integer
    field :num_of_episodes, :integer
    belongs_to :tv_series, TVSeries
    belongs_to :person, Person

    timestamps()
  end

  def changeset(tv_series_main_cast, attrs \\ %{}) do
    tv_series_main_cast
    |> cast(attrs, [:name, :order, :num_of_episodes, :tv_series_id, :person_id])
    |> validate_required([:name, :order, :tv_series_id, :person_id])
    |> assoc_constraint(:tv_series)
    |> assoc_constraint(:person)
  end
end
