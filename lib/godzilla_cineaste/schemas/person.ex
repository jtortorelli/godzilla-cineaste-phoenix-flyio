defmodule GodzillaCineaste.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AuthorWork, KaijuRole, PartialDate, Role, Staff, Work}

  schema "people" do
    field :display_name, :string
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_name, :string
    field :tenant, :integer
    field :disambig_chars, :string
    field :avatar_url, :string

    embeds_one :dob, PartialDate, on_replace: :update
    embeds_one :dod, PartialDate, on_replace: :update

    has_many :kaiju_roles, KaijuRole
    has_many :roles, Role
    has_many :staff, Staff

    many_to_many :works, Work, join_through: AuthorWork

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:avatar_url, :slug, :display_name, :sort_name, :showcased, :tenant])
    |> validate_required([:slug, :display_name, :sort_name, :showcased, :tenant])
    |> cast_embed(:dob)
    |> cast_embed(:dod)
  end

  def display_date_range(person) do
    case person do
      %{dob: %{"year" => nil}, dod: %{"year" => nil}} -> nil
      %{dob: %{"year" => year}, dod: %{"year" => nil, "unknown" => true}} -> "#{year} - ?"
      %{dob: %{"year" => year}, dod: %{"year" => nil}} -> "b. #{year}"
      %{dob: %{"year" => year}, dod: %{"year" => dod_year}} -> "#{year} - #{dod_year}"
    end
  end
end
