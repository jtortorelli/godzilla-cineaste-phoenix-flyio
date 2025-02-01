alias NimbleCSV.RFC4180, as: CSV
alias GodzillaCineaste.{Person, Relationship, Repo}

# %{slug: "nugent-carol", display_name: "Carol Nugent", tenant: 1}
# |> then(&Person.changeset(%Person{}, &1))
# |> Repo.insert!()

# "priv/scripts/relationships.csv"
# |> File.read!()
# |> CSV.parse_string()
# |>
Enum.map([["adams-nick", "nugent-carol", "spouse", nil]], fn [
                                                               self_slug,
                                                               relative_slug,
                                                               relationship,
                                                               order
                                                             ] ->
  existing_self = Repo.get_by!(Person, slug: self_slug)
  existing_relative = Repo.get_by!(Person, slug: relative_slug)

  Relationship.changeset(%Relationship{}, %{
    self_id: existing_self.id,
    relative_id: existing_relative.id,
    relationship: relationship,
    order: order
  })
end)
|> Enum.map(&Repo.insert!/1)
