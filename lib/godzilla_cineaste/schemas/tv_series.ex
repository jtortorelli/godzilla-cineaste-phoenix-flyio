defmodule GodzillaCineaste.TVSeries do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{TVSeriesMainCast, TVSeriesMainStaff}

  schema "tv_series" do
    field :first_air_date, :date
    field :last_air_date, :date
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_title, :string
    field :tenant, :integer
    field :title, :string
    field :num_seasons, :integer
    field :title_card_url, :string

    has_many :main_cast, TVSeriesMainCast
    has_many :main_staff, TVSeriesMainStaff

    timestamps()
  end

  def changeset(tv_series, attrs \\ %{}) do
    tv_series
    |> cast(attrs, [
      :first_air_date,
      :last_air_date,
      :slug,
      :sort_title,
      :tenant,
      :title,
      :title_card_url,
      :num_seasons
    ])
    |> validate_required([:slug, :title, :showcased, :tenant, :first_air_date])
    |> unique_constraint(:slug)
  end
end
