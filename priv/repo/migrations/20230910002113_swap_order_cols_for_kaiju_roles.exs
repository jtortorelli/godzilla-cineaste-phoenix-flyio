defmodule GodzillaCineaste.Repo.Migrations.SwapOrderColsForKaijuRoles do
  use Ecto.Migration

  def change do
    alter table(:kaiju_roles) do
      remove :order
    end

    rename table(:kaiju_roles), :integer_sort, to: :order
  end
end
