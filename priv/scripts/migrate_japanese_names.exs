alias NimbleCSV.RFC4180, as: CSV
alias GodzillaCineaste.{Entity, Repo}

"priv/scripts/legacy_people_japanese_names.csv"
|> File.read!()
|> CSV.parse_string(skip_headers: false)
|> Enum.map(fn [slug, japanese_name] ->
  entity = Repo.get_by!(Entity, slug: slug)
  metadata = Map.merge(entity.metadata, %{"japanese_name" => japanese_name})
  Entity.changeset(entity, %{metadata: metadata}) |> Repo.update!()
end)
