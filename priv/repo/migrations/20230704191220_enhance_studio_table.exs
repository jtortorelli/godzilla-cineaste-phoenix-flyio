defmodule GodzillaCineaste.Repo.Migrations.EnhanceStudioTable do
  use Ecto.Migration

  def change do
    rename table(:studios), :name, to: :display_name

    alter table(:studios) do
      add :original_name, :string
      add :abbreviation, :string
      add :aliases, {:array, :string}
    end
  end
end
