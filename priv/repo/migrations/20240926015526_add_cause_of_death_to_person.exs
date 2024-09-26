defmodule GodzillaCineaste.Repo.Migrations.AddCauseOfDeathToPerson do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :cause_of_death, :string
    end
  end
end
