alias NimbleCSV.RFC4180, as: NimbleCSV
alias GodzillaCineaste.{Person, Repo}

"priv/legacy_people.csv"
|> File.read!()
|> NimbleCSV.parse_string(skip_headers: false)
|> Enum.map(fn [
                 slug,
                 dob_year,
                 dob_month,
                 dob_day,
                 dob_unknown,
                 dod_year,
                 dod_month,
                 dod_day,
                 dod_unknown
               ] ->
  existing_person = Repo.get_by!(Person, slug: slug)
  dob = %{year: dob_year, month: dob_month, day: dob_day, unknown: dob_unknown}
  dod = %{year: dod_year, month: dod_month, day: dod_day, unknown: dod_unknown}

  existing_person |> Person.changeset(%{dob: dob, dod: dod}) |> Repo.update!()
end)
