defmodule GodzillaCineaste.Repo.Migrations.AddIntegerSortToKaijuRoles do
  use Ecto.Migration

  def change do
    alter table(:kaiju_roles) do
      add :integer_sort, :integer
    end
  end
end
