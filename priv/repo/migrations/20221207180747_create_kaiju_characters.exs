defmodule GodzillaCineaste.Repo.Migrations.CreateKaijuCharacters do
  use Ecto.Migration

  def change do
    create table(:kaiju_characters) do
      add :slug, :string
      add :display_name, :string
      add :tenant, :integer

      timestamps()
    end
  end
end
