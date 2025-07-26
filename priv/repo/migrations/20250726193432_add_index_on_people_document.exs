defmodule GodzillaCineaste.Repo.Migrations.AddIndexOnPeopleDocument do
  use Ecto.Migration

  def change do
    create index(:people, [:document], using: :gin)
  end
end
