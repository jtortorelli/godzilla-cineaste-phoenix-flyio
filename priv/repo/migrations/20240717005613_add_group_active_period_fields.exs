defmodule GodzillaCineaste.Repo.Migrations.AddGroupActivePeriodFields do
  use Ecto.Migration

  def change do
    alter table(:groups) do
      add :active_period_start, :map, default: "{}"
      add :active_period_end, :map, default: "{}"
    end
  end
end
