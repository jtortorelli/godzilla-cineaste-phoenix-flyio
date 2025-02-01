import Ecto.Query
alias GodzillaCineaste.{Person, Film, Repo, Staff}

%{id: person_id} = Repo.get_by!(Person, slug: "kimura-takeshi")

alias = "Mabuchi Kaoru"

film_slugs = [
  "frankenstein-conquers-the-world-1965",
  "adventure-of-kigan-castle-1966",
  "war-of-the-gargantuas-1966",
  "king-kong-escapes-1967",
  "destroy-all-monsters-1968",
  "godzilla-vs-hedorah-1971"
]

for slug <- film_slugs do
  %{id: film_id} = Repo.get_by!(Film, slug: slug)

  staffs =
    Staff
    |> from()
    |> where([r], r.film_id == ^film_id and r.person_id == ^person_id)
    |> Repo.all()

  for s <- staffs do
    s |> Staff.changeset(%{staff_alias: alias}) |> Repo.update!()
  end
end
