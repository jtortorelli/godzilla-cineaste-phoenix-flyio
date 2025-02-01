import Ecto.Query
alias GodzillaCineaste.{Person, Film, Repo, Role}

%{id: person_id} = Repo.get_by!(Person, slug: "dunham-robert")

alias = "Dan Yuma"

film_slugs = [
  "dogora-1964"
]

for slug <- film_slugs do
  %{id: film_id} = Repo.get_by!(Film, slug: slug)

  roles =
    Role
    |> from()
    |> where([r], r.film_id == ^film_id and r.person_id == ^person_id)
    |> Repo.all()

  for r <- roles do
    r |> Role.changeset(%{actor_alias: alias}) |> Repo.update!()
  end
end
