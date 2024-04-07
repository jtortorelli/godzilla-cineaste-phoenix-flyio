alias GodzillaCineaste.{AuthorWork, Entity, Group, KaijuRole, Person, Repo, Role, Staff}

# people
# Person
# |> Repo.all()
# |> Enum.map(fn person ->
#   dob =
#     if person.dob,
#       do: %{
#         "dob" => %{
#           "year" => person.dob.year,
#           "month" => person.dob.month,
#           "day" => person.dob.day,
#           "unknown" => person.dob.unknown
#         }
#       },
#       else: %{}

#   dod =
#     if person.dod,
#       do: %{
#         "dod" => %{
#           "year" => person.dod.year,
#           "month" => person.dod.month,
#           "day" => person.dod.day,
#           "unknown" => person.dod.unknown
#         }
#       },
#       else: %{}

#   disambig_chars =
#     if person.disambig_chars, do: %{"disambig_chars" => person.disambig_chars}, else: %{}

#   metadata = dob |> Map.merge(dod) |> Map.merge(disambig_chars)

#   Entity.changeset(%Entity{}, %{
#     avatar_url: person.avatar_url,
#     display_name: person.display_name,
#     metadata: metadata,
#     showcased: person.showcased,
#     slug: person.slug,
#     sort_name: person.sort_name,
#     tenant: person.tenant,
#     type: :person
#   })
# end)
# |> Enum.map(&Repo.insert!(&1))

# groups
# Group
# |> Repo.all()
# |> Enum.map(fn group ->
#   Entity.changeset(%Entity{}, %{
#     avatar_url: group.avatar_url,
#     display_name: group.display_name,
#     metadata: %{},
#     showcased: group.showcased,
#     slug: group.slug,
#     sort_name: group.sort_name,
#     tenant: group.tenant,
#     type: :group
#   })
# end)
# |> Enum.map(&Repo.insert!(&1))

# author_works
# AuthorWork
# |> Repo.all()
# |> Repo.preload(:person)
# |> Enum.map(fn author_work ->
#   entity = Repo.get_by!(Entity, slug: author_work.person.slug)
#   AuthorWork.changeset(author_work, %{entity_id: entity.id})
# end)
# |> Enum.map(&Repo.update!(&1))

# kaiju_roles
# KaijuRole
# |> Repo.all()
# |> Repo.preload(:person)
# |> Enum.flat_map(fn kaiju_role ->
#   if kaiju_role.person do
#     entity = Repo.get_by!(Entity, slug: kaiju_role.person.slug)
#     [KaijuRole.changeset(kaiju_role, %{entity_id: entity.id})]
#   else
#     []
#   end
# end)
# |> Enum.map(&Repo.update!(&1))

# roles
# Role
# |> Repo.all()
# |> Repo.preload([:person, :group])
# |> Enum.map(fn role ->
#   entity =
#     if role.person,
#       do: Repo.get_by!(Entity, slug: role.person.slug),
#       else: Repo.get_by!(Entity, slug: role.group.slug)

#   Role.changeset(role, %{entity_id: entity.id})
# end)
# |> Enum.map(&Repo.update!(&1))

# staff
# Staff
# |> Repo.all()
# |> Repo.preload([:person, :group])
# |> Enum.map(fn staff ->
#   entity =
#     if staff.person,
#       do: Repo.get_by!(Entity, slug: staff.person.slug),
#       else: Repo.get_by!(Entity, slug: staff.group.slug)

#   Staff.changeset(staff, %{entity_id: entity.id})
# end)
# |> Enum.map(&Repo.update!(&1))
