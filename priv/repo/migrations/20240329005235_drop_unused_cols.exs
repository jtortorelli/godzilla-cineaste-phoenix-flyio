defmodule GodzillaCineaste.Repo.Migrations.DropUnusedCols do
  use Ecto.Migration

  def change do
    alter table(:films) do
      remove :tagline
    end

    drop table(:film_synopses)
    drop table(:person_roles)
    drop table(:person_staff)
    drop table(:group_roles)
    drop table(:group_staff)
  end
end
