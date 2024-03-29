defmodule GodzillaCineaste.Repo.Migrations.DropOldFilmWorkId do
  use Ecto.Migration

  def change do
    alter table(:films) do
      remove :work_id
    end
  end
end
