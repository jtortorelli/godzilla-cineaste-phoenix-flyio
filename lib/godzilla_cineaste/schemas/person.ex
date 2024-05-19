defmodule GodzillaCineaste.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{PartialDate, PersonAlternateName, Place, Role, Staff}

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

    has_many :roles, Role
    has_many :staff, Staff

    embeds_one :dob, PartialDate, on_replace: :update
    embeds_one :dod, PartialDate, on_replace: :update

    embeds_one :birth_place, Place, on_replace: :update
    embeds_one :death_place, Place, on_replace: :update

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
      :japanese_name
    ])
    |> validate_required([:slug, :display_name, :showcased, :tenant])
    |> unique_constraint([:slug])
    |> cast_embed(:dob)
    |> cast_embed(:dod)
    |> cast_embed(:alternate_names)
    |> cast_embed(:birth_place)
    |> cast_embed(:death_place)
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
    Enum.find(alternate_names, &(&1.category == :birth_name)) || %PersonAlternateName{}
  end

  def has_birth_date?(%__MODULE__{dob: %PartialDate{year: year}}) when is_integer(year), do: true
  def has_birth_date?(%__MODULE__{}), do: false

  def has_death_date?(%__MODULE__{dod: %PartialDate{year: year}}) when is_integer(year), do: true
  def has_death_date?(%__MODULE__{}), do: false

  def unknown_death_date?(%__MODULE__{dod: %PartialDate{unknown: true}}), do: true
  def unknown_death_date?(%__MODULE__{}), do: false

  def status(%__MODULE__{} = person) do
    cond do
      is_struct(person.dob) and is_nil(person.dod) ->
        :alive

      is_struct(person.dob) and is_struct(person.dod) and unknown_death_date?(person) ->
        :deceased_unknown_date

      is_struct(person.dob) and is_struct(person.dod) ->
        :deceased

      true ->
        :unknown
    end
  end

  def age(%__MODULE__{} = person) do
    case status(person) do
      :alive -> PartialDate.diff_from_now(person.dob)
      :deceased -> PartialDate.diff(person.dob, person.dod)
      _ -> nil
    end
  end
end
