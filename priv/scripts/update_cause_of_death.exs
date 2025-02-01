alias NimbleCSV.RFC4180, as: CSV
alias GodzillaCineaste.{Person, Repo}

"priv/scripts/update-cause-of-death.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.map(fn [slug, cause] ->
  person = Repo.get_by!(Person, slug: slug)
  changeset = Person.changeset(person, %{cause_of_death: cause})
  Repo.update!(changeset)
end)
