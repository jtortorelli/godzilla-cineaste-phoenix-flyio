defmodule GodzillaCineaste.Repo.Migrations.AddTaglineToFilms do
  use Ecto.Migration

  def change do
    alter table(:films) do
      add :tagline, :string
    end
  end
end
