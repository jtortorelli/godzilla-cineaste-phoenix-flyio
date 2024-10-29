defmodule GodzillaCineaste.Award do
  use Ecto.Schema
  import Ecto.Changeset

  alias GodzillaCineaste.AwardCeremony

  schema "awards" do
    field :name, :string
    field :nickname, :string
    field :sort_name, :string

    has_many :ceremonies, AwardCeremony

    timestamps()
  end

  def changeset(award, attrs \\ %{}) do
    award
    |> cast(attrs, [:name, :nickname, :sort_name])
    |> validate_required([:name, :sort_name])
    |> unique_constraint([:name])
  end
end
