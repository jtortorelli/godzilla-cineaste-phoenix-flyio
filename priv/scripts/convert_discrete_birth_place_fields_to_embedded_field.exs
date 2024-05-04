alias GodzillaCineaste.{Person, Repo}

Person
|> Repo.all()
|> Enum.map(fn p ->
  birth_place = %{city: p.birth_city, country_subdivision: p.birth_country_subdivision, country: p.birth_country}
  p |> Person.changeset(%{birth_place: birth_place}) |> Repo.update!()
end)
