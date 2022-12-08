defmodule GodzillaCineaste.Repo.Migrations.SetDefaultTimestamps do
  use Ecto.Migration

  def change do
    alter table(:author_works) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:characters) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:film_series) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:film_series_entries) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:film_studios) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:films) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:kaiju_characters) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:kaiju_roles) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:people) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:person_roles) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:person_staff) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:studios) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end

    alter table(:works) do
      modify(:inserted_at, :timestamp, default: fragment("now()"))
      modify(:updated_at, :timestamp, default: fragment("now()"))
    end
  end
end
