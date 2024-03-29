import Ecto.Query
alias GodzillaCineaste.{Film, GroupStaff, PersonStaff, Repo, Staff}

films = Repo.all(Film)

staff_mapper = fn
  {%PersonStaff{} = person_staff, index} ->
    attrs = %{
      order: index,
      role: person_staff.role,
      film_id: person_staff.film_id,
      person_id: person_staff.person_id
    }

    Staff.changeset(%Staff{}, attrs)

  {%GroupStaff{} = group_staff, index} ->
    attrs = %{
      order: index,
      role: group_staff.role,
      film_id: group_staff.film_id,
      group_id: group_staff.group_id
    }

    Staff.changeset(%Staff{}, attrs)
end

Enum.each(films, fn %{id: film_id} ->
  Repo.transaction(fn ->
    person_staff = Repo.all(from ps in PersonStaff, where: ps.film_id == ^film_id)
    group_staff = Repo.all(from gs in GroupStaff, where: gs.film_id == ^film_id)

    person_staff
    |> Enum.concat(group_staff)
    |> Enum.sort_by(& &1.order)
    |> Enum.with_index()
    |> Enum.map(&staff_mapper.(&1))
    |> Enum.map(&Repo.insert!(&1))
  end)
end)
