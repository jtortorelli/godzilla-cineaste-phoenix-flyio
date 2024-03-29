alias NimbleCSV.RFC4180, as: CSV
alias GodzillaCineaste.{Film, ProductionCommittee, ProductionCommitteeStudio, Repo, Studio}

# "priv/production_committees.csv"
# |> File.read!()
# |> CSV.parse_string()
# |> Enum.map(fn [production_committee_slug, display_name, member_studio_slugs] ->
#   existing_production_committee =
#     Repo.get_by(ProductionCommittee, slug: production_committee_slug)

#   unless(existing_production_committee) do
#     Repo.transaction(fn ->
#       production_committee =
#         %ProductionCommittee{}
#         |> ProductionCommittee.changeset(%{
#           slug: production_committee_slug,
#           display_name: display_name
#         })
#         |> Repo.insert!()

#       studios =
#         member_studio_slugs
#         |> String.split(",")
#         |> Enum.map(fn member_studio_slug ->
#           member_studio_slug
#           |> String.trim()
#           |> then(&Repo.get_by!(Studio, slug: &1))
#         end)

#       Enum.each(studios, fn studio ->
#         %ProductionCommitteeStudio{}
#         |> ProductionCommitteeStudio.changeset(%{
#           production_committee_id: production_committee.id,
#           studio_id: studio.id
#         })
#         |> Repo.insert!()
#       end)
#     end)
#   end
# end)

"priv/film_production_committees.csv"
|> File.read!()
|> CSV.parse_string()
|> Enum.map(fn [film_slug, production_committee_slug] ->
  film = Repo.get_by!(Film, slug: film_slug)
  production_committee = Repo.get_by!(ProductionCommittee, slug: production_committee_slug)

  film
  |> Film.changeset(%{production_committee_id: production_committee.id})
  |> Repo.update!()
end)
