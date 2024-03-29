defmodule GodzillaCineaste.Film do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{
    FilmAlias,
    FilmCredits,
    FilmDisplayTitle,
    FilmOriginalTitle,
    FilmPosterUrl,
    FilmSeriesEntry,
    FilmStudio,
    FilmWork,
    KaijuRole,
    ProductionCommittee,
    Role,
    Staff,
    Work
  }

  schema "films" do
    field :release_date, :date
    field :runtime, :integer
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_title, :string
    field :tenant, :integer
    field :title, :string
    field :pitch, :string

    belongs_to :production_committee, ProductionCommittee

    embeds_many :aliases, FilmAlias, on_replace: :delete
    embeds_many :poster_urls, FilmPosterUrl, on_replace: :delete
    embeds_one :original_title, FilmOriginalTitle, on_replace: :update
    embeds_many :display_title, FilmDisplayTitle, on_replace: :delete

    has_many :kaiju_roles, KaijuRole, preload_order: [asc: :order], on_replace: :delete

    has_many :roles, Role, preload_order: [asc: :order], on_replace: :delete
    has_many :staff, Staff, preload_order: [asc: :order], on_replace: :delete

    has_one :series_entry, FilmSeriesEntry
    has_one :credits, FilmCredits

    has_many :film_studios, FilmStudio, on_replace: :delete
    has_many :studios, through: [:film_studios, :studio]
    many_to_many :works, Work, join_through: FilmWork

    timestamps()
  end

  @doc false
  def changeset(film, attrs \\ %{}) do
    film
    |> cast(attrs, [
      :slug,
      :title,
      :release_date,
      :runtime,
      :showcased,
      :tenant,
      :sort_title,
      :production_committee_id
    ])
    |> validate_required([
      :slug,
      :title,
      :release_date,
      :runtime,
      :showcased,
      :tenant,
      :sort_title
    ])
    |> unique_constraint(:slug)
    |> cast_embed(:aliases,
      with: &FilmAlias.changeset/2,
      sort_param: :alias_order,
      drop_param: :alias_delete
    )
    |> cast_embed(:poster_urls,
      with: &FilmPosterUrl.changeset/2,
      sort_param: :poster_url_order,
      drop_param: :poster_url_delete
    )
    |> cast_embed(:original_title)
    |> cast_assoc(:staff,
      with: &Staff.changeset/3,
      sort_param: :staff_order,
      drop_param: :staff_delete
    )
    |> cast_assoc(:roles,
      with: &Role.changeset/3,
      sort_param: :role_order,
      drop_param: :role_delete
    )
    |> cast_assoc(:kaiju_roles,
      with: &KaijuRole.changeset/3,
      sort_param: :kaiju_role_order,
      drop_param: :kaiju_role_delete
    )
    |> cast_assoc(:film_studios,
      with: &FilmStudio.changeset/3,
      sort_param: :film_studios_order,
      drop_param: :film_studios_delete
    )
    |> assoc_constraint(:production_committee)
  end
end
