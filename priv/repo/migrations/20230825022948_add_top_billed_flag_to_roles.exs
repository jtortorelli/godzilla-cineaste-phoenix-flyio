defmodule GodzillaCineaste.Repo.Migrations.AddTopBilledFlagToRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      add :top_billed, :boolean, default: true
    end
  end
end
