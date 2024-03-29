defmodule GodzillaCineaste.Repo.Migrations.CreateWorks do
  use Ecto.Migration

  def change do
    create table(:works) do
      add :title, :string
      add :format, :string

      timestamps()
    end
  end
end
