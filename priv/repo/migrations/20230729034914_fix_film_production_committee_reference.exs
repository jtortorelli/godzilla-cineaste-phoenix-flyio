defmodule GodzillaCineaste.Repo.Migrations.FixFilmProductionCommitteeReference do
  use Ecto.Migration

  def change do
    rename table(:films), :production_committee, to: :production_committee_id
  end
end
