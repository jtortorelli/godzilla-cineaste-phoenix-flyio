defmodule GodzillaCineaste.Repo.Migrations.AddJsonFilmFields do
  use Ecto.Migration

  def change do
    alter table("films") do
      add :aliases, {:array, :map}
      add :poster_urls, {:array, :map}
      add :original_title, :map
    end
  end
end
