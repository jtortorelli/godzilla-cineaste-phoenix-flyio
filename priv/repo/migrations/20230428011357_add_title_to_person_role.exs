defmodule GodzillaCineaste.Repo.Migrations.AddTitleToPersonRole do
  use Ecto.Migration

  def change do
    alter table(:person_roles) do
      add :title, :string
    end
  end
end
