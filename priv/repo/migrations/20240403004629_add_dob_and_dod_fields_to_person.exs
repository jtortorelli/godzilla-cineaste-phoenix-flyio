defmodule GodzillaCineaste.Repo.Migrations.AddDobAndDodFieldsToPerson do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :dob, :map
      add :dod, :map
    end
  end
end
