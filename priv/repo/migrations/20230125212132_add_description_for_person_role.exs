defmodule GodzillaCineaste.Repo.Migrations.AddDescriptionForPersonRole do
  use Ecto.Migration

  def change do
    alter table(:person_roles) do
      add :description, :string
    end
  end
end
