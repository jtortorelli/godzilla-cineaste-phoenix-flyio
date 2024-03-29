defmodule GodzillaCineaste.Repo.Migrations.RenameKaijuRoleTable do
  use Ecto.Migration

  def change do
    rename table(:kaiju_role), to: table(:kaiju_roles)
  end
end
