defmodule GodzillaCineaste.TVSeriesMainStaff do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{Person, TVSeries}

  schema "tv_series_main_staff" do
    field :role, :string
    field :order, :integer

    belongs_to :tv_series, TVSeries
    belongs_to :person, Person

    timestamps()
  end

  def changeset(tv_series_main_staff, attrs \\ %{}) do
    tv_series_main_staff
    |> cast(attrs, [
      :role,
      :order,
      :tv_series_id,
      :person_id
    ])
    |> validate_required([:role, :order, :tv_series_id, :person_id])
    |> assoc_constraint(:tv_series)
    |> assoc_constraint(:person)
  end
end
