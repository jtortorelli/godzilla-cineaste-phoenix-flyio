defmodule GodzillaCineaste.Repo.Migrations.AddFilmSlugToFilmCredits do
  use Ecto.Migration

  def change do
    alter table(:film_credits) do
      add :slug, :string
    end

    create unique_index(:film_credits, [:slug])
  end
end
