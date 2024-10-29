defmodule GodzillaCineaste.AwardCategory do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.{AwardCeremony, AwardNomination}

  schema "award_categories" do
    field :name, :string
    field :order, :integer
    field :competitive, :boolean

    belongs_to :ceremony, AwardCeremony
    has_many :nominations, AwardNomination, foreign_key: :category_id

    timestamps()
  end

  def changeset(award_category, attrs \\ %{}) do
    award_category
    |> cast(attrs, [:name, :order, :competitive, :ceremony_id])
    |> validate_required([:name, :order, :competitive, :ceremony_id])
    |> unique_constraint([:ceremony_id, :name])
  end
end
