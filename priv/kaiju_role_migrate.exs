import Ecto.Query
alias CineasteData.{Film, KaijuRole, Repo}

films = Repo.all(Film)

Enum.each(films, fn %{id: film_id} ->
  Repo.transaction(fn ->
    kaiju_roles = Repo.all(from kr in KaijuRole, where: kr.film_id == ^film_id)

    kaiju_roles
    |> Enum.sort_by(& &1.order)
    |> Enum.with_index()
    |> Enum.map(fn {kaiju_role, index} ->
      attrs = %{integer_sort: index}
      KaijuRole.changeset(kaiju_role, attrs)
    end)
    |> Enum.map(&Repo.update!(&1))
  end)
end)
