defmodule GodzillaCineaste.Entities do
  @moduledoc false
  import Ecto.Query

  alias GodzillaCineaste.{Entity, Repo}

  def list_entities(_search_term \\ nil) do
    Entity
    |> from()
    |> where([e], e.showcased)
    |> order_by([e], e.sort_name)
    |> Repo.all()
  end

  def display_date_range(%Entity{type: :person, metadata: metadata}) do
    case metadata do
      %{"dob" => %{"year" => nil}, "dod" => %{"year" => nil}} -> nil
      %{"dob" => %{"year" => year}, "dod" => %{"year" => nil, "unknown" => true}} -> "#{year}-?"
      %{"dob" => %{"year" => year}, "dod" => %{"year" => nil}} -> "b. #{year}"
      %{"dob" => %{"year" => year}, "dod" => %{"year" => dod_year}} -> "#{year}-#{dod_year}"
      true -> nil
    end
  end

  def display_date_range(_entity), do: nil

  def get_entity_by_slug!(slug) do
    Entity
    |> Repo.get_by!(slug: slug)
  end
end
