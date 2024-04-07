alias GodzillaCineaste.{
  Film,
  FilmCredits,
  KaijuCharacter,
  KaijuRole,
  Label,
  Person,
  Publisher,
  Repo,
  Role
}

migrate_macrons = fn
  string when is_binary(string) ->
    string
    |> String.replace("ā", "â")
    |> String.replace("Ā", "Â")
    |> String.replace("ē", "ê")
    |> String.replace("Ē", "Ê")
    |> String.replace("ī", "î")
    |> String.replace("Ī", "Î")
    |> String.replace("ō", "ô")
    |> String.replace("Ō", "Ô")
    |> String.replace("ū", "û")
    |> String.replace("Ū", "Û")

  string ->
    string
end

# film_credits = Repo.all(FilmCredits)
# Enum.each(film_credits, fn fc ->
#   updated_credits =
#     fc.credits
#     |> String.replace("ā", "â")
#     |> String.replace("Ā", "Â")
#     |> String.replace("ē", "ê")
#     |> String.replace("Ē", "Ê")
#     |> String.replace("ī", "î")
#     |> String.replace("Ī", "Î")
#     |> String.replace("ō", "ô")
#     |> String.replace("Ō", "Ô")
#     |> String.replace("ū", "û")
#     |> String.replace("Ū", "Û")

#   fc
#   |> FilmCredits.changeset(%{credits: updated_credits})
#   |> Repo.update!()
# end)

# films = Repo.all(Film)

# Enum.each(films, fn
#   %Film{
#     original_title: %{translation: translation, transliteration: transliteration} = original_title
#   } = f
#   when is_binary(translation) and is_binary(transliteration) ->
#     updated_original_title =
#       original_title
#       |> Map.from_struct()
#       |> Map.put(:translation, migrate_macrons.(translation))
#       |> Map.put(:transliteration, migrate_macrons.(transliteration))

#     f
#     |> Film.changeset(%{original_title: updated_original_title})
#     |> Repo.update!()

#   %Film{original_title: %{translation: translation} = original_title} = f
#   when is_binary(translation) ->
#     updated_original_title =
#       original_title |> Map.from_struct() |> Map.put(:translation, migrate_macrons.(translation))

#     f
#     |> Film.changeset(%{original_title: updated_original_title})
#     |> Repo.update!()

#   _ ->
#     :ok
# end)

# kaiju_roles = Repo.all(KaijuRole)

# Enum.each(kaiju_roles, fn kr ->
#   kr
#   |> KaijuRole.changeset(%{name: migrate_macrons.(kr.name)})
#   |> Repo.update!()
# end)

# kaiju_characters = Repo.all(KaijuCharacter)

# Enum.each(kaiju_characters, fn kc ->
#   kc
#   |> KaijuCharacter.changeset(%{display_name: migrate_macrons.(kc.display_name)})
#   |> Repo.update!()
# end)

# labels = Repo.all(Label)

# Enum.each(labels, fn l ->
#   l
#   |> Label.changeset(%{name: migrate_macrons.(l.name)})
#   |> Repo.update!()
# end)

# people = Repo.all(Person)

# Enum.each(people, fn p ->
#   p
#   |> Person.changeset(%{display_name: migrate_macrons.(p.display_name)})
#   |> Repo.update!()
# end)

# publishers = Repo.all(Publisher)

# Enum.each(publishers, fn p ->
#   p
#   |> Publisher.changeset(%{name: migrate_macrons.(p.name)})
#   |> Repo.update!()
# end)

roles = Repo.all(Role)

Enum.each(roles, fn r ->
  r
  |> Role.changeset(%{
    name: migrate_macrons.(r.name),
    description: migrate_macrons.(r.description)
  })
  |> Repo.update!()
end)
