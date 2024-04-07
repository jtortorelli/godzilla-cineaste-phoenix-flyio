defmodule GodzillaCineaste.Repo.Migrations.CleanUpPersonAndGroup do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      remove :person_id
      remove :group_id
    end

    alter table(:staff) do
      remove :person_id
      remove :group_id
    end

    alter table(:kaiju_roles) do
      remove :person_id
    end

    alter table(:author_works) do
      remove :person_id
    end

    drop table(:people)

    drop table(:groups)
  end
end
