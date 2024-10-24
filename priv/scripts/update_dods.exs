alias NimbleCSV.RFC4180, as: CSV
alias GodzillaCineaste.{Person, Repo}

"priv/scripts/updated_dods.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.map(fn [slug, dod_year, dod_month, dod_day, dod_unknown] ->
  converted_dod_unknown = case dod_unknown do
    nil -> nil
    "TRUE" -> true
    _ -> false
  end
  person = Repo.get_by!(Person, slug: slug)
  dod_changes = %{year: dod_year, month: dod_month, day: dod_day, unknown: converted_dod_unknown}
  changeset = Person.changeset(person, %{dod: dod_changes})
  Repo.update!(changeset)
  end
)
