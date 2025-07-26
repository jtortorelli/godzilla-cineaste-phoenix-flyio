defmodule GodzillaCineaste.Repo.Migrations.GinIndexOnFilmDocumentCol do
  use Ecto.Migration

  def change do
    create index(:films, [:document], using: :gin)
  end
end
