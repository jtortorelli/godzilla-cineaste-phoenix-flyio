defmodule GodzillaCineaste.Repo.Migrations.AddDisambiguationColForPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :disambig_chars, :string
    end
  end
end
