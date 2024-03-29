defmodule GodzillaCineaste.Repo.Migrations.AddDisplayTitleColumnForFilms do
  use Ecto.Migration

  def change do
    alter table("films") do
      add :display_title, {:array, :map}
    end
  end
end
