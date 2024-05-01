defmodule GodzillaCineaste.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{PartialDate, PersonAlternateName}

  schema "people" do
    field :slug, :string
    field :display_name, :string
    field :sort_name, :string
    field :showcased, :boolean, default: false
    field :tenant, :integer
    field :disambig_chars, :string
    field :profession, :string
    field :avatar_url, :string
    field :japanese_name, :string
    field :birth_ward, :string
    field :birth_city, :string
    field :birth_country_subdivision, :string
    field :birth_country, :string

    embeds_one :dob, PartialDate, on_replace: :update
    embeds_one :dod, PartialDate, on_replace: :update

    embeds_many :alternate_names, PersonAlternateName, on_replace: :delete

    timestamps()
  end

  def changeset(person, attrs) do
    person
    |> cast(attrs, [
      :slug,
      :display_name,
      :sort_name,
      :showcased,
      :tenant,
      :disambig_chars,
      :profession,
      :avatar_url,
      :japanese_name,
      :birth_ward,
      :birth_city,
      :birth_country_subdivision,
      :birth_country
    ])
    |> validate_required([:slug, :display_name, :showcased, :tenant])
    |> unique_constraint([:slug])
    |> cast_embed(:dob)
    |> cast_embed(:dod)
    |> cast_embed(:alternate_names)
  end

  def display_date_range(person) do
    case person do
      %{dob: %{"year" => nil}, dod: %{"year" => nil}} -> nil
      %{dob: %{"year" => year}, dod: %{"year" => nil, "unknown" => true}} -> "#{year}-?"
      %{dob: %{"year" => year}, dod: %{"year" => nil}} -> "b. #{year}"
      %{dob: %{"year" => year}, dod: %{"year" => dod_year}} -> "#{year}-#{dod_year}"
    end
  end

  def birth_name(%__MODULE__{alternate_names: alternate_names}) do
    Enum.find(alternate_names, &(&1.category == :"birth name"))
  end

  def display_birth_place(%__MODULE__{
        birth_city: birth_city,
        birth_country_subdivision: birth_country_subdivision,
        birth_country: birth_country
      }) do
    [birth_city, birth_country_subdivision, birth_country]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(", ")
  end

  def has_birth_date?(%__MODULE__{dob: %PartialDate{year: year}}) when is_integer(year), do: true
  def has_birth_date?(%__MODULE__{}), do: false
end
