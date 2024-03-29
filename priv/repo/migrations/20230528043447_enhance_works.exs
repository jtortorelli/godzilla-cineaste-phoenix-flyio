defmodule GodzillaCineaste.Repo.Migrations.EnhanceWorks do
  use Ecto.Migration

  def change do
    alter table(:works) do
      add :year, :integer
      add :publisher_id, references(:publishers)
      add :label_id, references(:labels)
    end
  end
end
