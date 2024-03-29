defmodule GodzillaCineaste.Repo.Migrations.AddPitchToFilms do
  use Ecto.Migration

  def change do
    alter table(:films) do
      add :pitch, :string
    end
  end
end
