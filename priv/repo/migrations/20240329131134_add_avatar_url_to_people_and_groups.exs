defmodule GodzillaCineaste.Repo.Migrations.AddAvatarUrlToPeopleAndGroups do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :avatar_url, :string
    end

    alter table(:groups) do
      add :avatar_url, :string
    end
  end
end
