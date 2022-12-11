defmodule GodzillaCineaste.Repo.Migrations.AddUniqueIndexesToAuthorWorks do
  use Ecto.Migration

  def change do
    create unique_index(:author_works, [:person_id, :work_id])
  end
end
