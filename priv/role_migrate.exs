import Ecto.Query
alias GodzillaCineaste.{Film, GroupRole, PersonRole, Repo, Role}

films = Repo.all(Film)

role_mapper = fn
  {%PersonRole{} = person_role, index} ->
    order = if person_role.order == "z", do: 999, else: index

    attrs = %{
      actor_alias: person_role.actor_alias,
      avatar_url: person_role.avatar_url,
      description: person_role.description,
      name: person_role.name,
      order: order,
      uncredited: person_role.uncredited,
      qualifiers: person_role.qualifiers,
      title: person_role.title,
      film_id: person_role.film_id,
      character_id: person_role.character_id,
      person_id: person_role.person_id
    }

    Role.changeset(%Role{}, attrs)

  {%GroupRole{} = group_role, index} ->
    order = if group_role.order == "z", do: 999, else: index

    attrs = %{
      avatar_url: group_role.avatar_url,
      name: group_role.name,
      order: order,
      film_id: group_role.film_id,
      character_id: group_role.character_id,
      group_id: group_role.group_id
    }

    Role.changeset(%Role{}, attrs)
end

Enum.each(films, fn %{id: film_id} ->
  Repo.transaction(fn ->
    person_roles = Repo.all(from pr in PersonRole, where: pr.film_id == ^film_id)
    group_roles = Repo.all(from gr in GroupRole, where: gr.film_id == ^film_id)

    person_roles
    |> Enum.concat(group_roles)
    |> Enum.sort_by(& &1.order)
    |> Enum.with_index()
    |> Enum.map(&role_mapper.(&1))
    |> Enum.map(&Repo.insert!(&1))
  end)
end)
