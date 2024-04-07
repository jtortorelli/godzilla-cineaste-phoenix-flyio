alias GodzillaCineaste.{Film, Person, PersonStaff, Repo}

# enter film slug here
# e.g. godzilla-1954
slug = ""

film = Repo.get_by!(Film, slug: slug)

attrs = [
  # enter tuples here
  # e.g. {"Director", "honda-ishiro"}
]

assign_ordering = fn attrs ->
  attrs
  |> Enum.count()
  |> then(&Range.new(1, &1))
  |> Enum.into([], &Integer.to_string/1)
  |> Enum.sort()
  |> Enum.zip_with(attrs, fn sort_val, attr -> Map.put(attr, :order, sort_val) end)
end

Repo.transaction(fn ->
  attrs
  |> Enum.map(fn {role, slug} -> %{role: role, slug: slug, film_id: film.id} end)
  |> Enum.map(fn %{slug: slug} = attrs ->
    person = Repo.get_by!(Person, slug: slug)
    Map.put(attrs, :person_id, person.id)
  end)
  |> assign_ordering.()
  |> Enum.map(&PersonStaff.changeset(%PersonStaff{}, &1))
  |> Enum.map(&Repo.insert!/1)
  |> IO.inspect()
end)
