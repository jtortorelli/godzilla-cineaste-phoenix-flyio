alias NimbleCSV.RFC4180, as: CSV

import Ecto.Query

alias GodzillaCineaste.{Award, AwardCeremony, Person, Repo}

"priv/scripts/mainichi-people-insert.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.map(fn [japanese_name, display_name, sort_name, slug, disambig_chars] ->
  attrs = %{
    japanese_name: japanese_name,
    display_name: display_name,
    sort_name: sort_name,
    slug: slug,
    disambig_chars: disambig_chars,
    tenant: 1,
    showcased: false
  }

  %Person{}
  |> Person.changeset(attrs)
  |> Repo.insert!()
end)
