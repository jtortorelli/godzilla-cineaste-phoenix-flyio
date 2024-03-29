defmodule GodzillaCineaste.Repo.Migrations.AddBetterDisplayNameToStudios do
  use Ecto.Migration

  def change do
    alter table(:studios) do
      add :better_display_name, :string
    end
  end
end
