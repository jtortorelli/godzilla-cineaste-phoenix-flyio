defmodule GodzillaCineaste.Repo.Migrations.AddAwardsTables do
  use Ecto.Migration

  def change do
    create table(:awards) do
      add :name, :string
      add :nickname, :string
      add :sort_name, :string

      timestamps()
    end

    create table(:award_ceremonies) do
      add :award_id, references(:awards)
      add :ordinal, :integer
      add :held_at, :date

      timestamps()
    end

    create table(:award_categories) do
      add :ceremony_id, references(:award_ceremonies)
      add :name, :string
      add :order, :integer
      add :competitive, :boolean

      timestamps()
    end

    create table(:award_nominations) do
      add :category_id, references(:award_categories)
      add :won, :boolean

      timestamps()
    end

    create table(:award_nominations_films) do
      add :film_id, references(:films)
      add :award_nomination_id, references(:award_nominations)

      timestamps()
    end

    create table(:award_nominations_people) do
      add :person_id, references(:people)
      add :award_nomination_id, references(:award_nominations)

      timestamps()
    end

    create unique_index(:awards, [:name])
    create unique_index(:award_ceremonies, [:award_id, :ordinal])
    create unique_index(:award_categories, [:ceremony_id, :name])
  end
end
