defmodule GodzillaCineaste.Repo.Migrations.FixAllJsonbColumns do
  use Ecto.Migration

  def change do
    execute ~s/alter table "films" alter column "aliases" drop default;/
    execute ~s/alter table "films" alter column "aliases" type jsonb using to_json(aliases);/
    execute ~s/alter table "films" alter column "aliases" set default '[]';/
    execute ~s/alter table "films" alter column "poster_urls" drop default;/

    execute ~s/alter table "films" alter column "poster_urls" type jsonb using to_json(poster_urls);/

    execute ~s/alter table "films" alter column "poster_urls" set default '[]';/
    execute ~s/alter table "films" alter column "display_title" drop default;/

    execute ~s/alter table "films" alter column "display_title" type jsonb using to_json(display_title);/

    execute ~s/alter table "films" alter column "display_title" set default '[]';/
  end
end
