alias GodzillaCineaste.{AuthorWork, Entity, Group, KaijuRole, Person, Repo, Role, Staff}

# Entity
# |> Repo.all()
# |> Enum.map(fn entity ->
#   attrs = %{
#     slug: entity.slug,
#     display_name: entity.display_name,
#     sort_name: entity.sort_name,
#     showcased: entity.showcased,
#     tenant: entity.tenant,
#     disambig_chars: Map.get(entity.metadata, "disambig_chars"),
#     profession: entity.profession,
#     avatar_url: entity.avatar_url,
#     dob: Map.get(entity.metadata, "dob"),
#     dod: Map.get(entity.metadata, "dod")
#   }

#   case entity.type do
#     :person -> Person.changeset(%Person{}, attrs)
#     :group -> Group.changeset(%Group{}, attrs)
#   end
# end)
# |> Enum.map(fn changeset -> Repo.insert!(changeset) end)

# Role
# |> Repo.all()
# |> Enum.map(fn role ->
#   entity = Repo.get_by!(Entity, id: role.entity_id)

#   if entity.type == :person do
#     person = Repo.get_by!(Person, slug: entity.slug)
#     role |> Role.changeset(%{person_id: person.id}) |> Repo.update!()
#   else
#     group = Repo.get_by!(Group, slug: entity.slug)
#     role |> Role.changeset(%{group_id: group.id}) |> Repo.update!()
#   end
# end)

# Staff
# |> Repo.all()
# |> Enum.map(fn staff ->
#   entity = Repo.get_by!(Entity, id: staff.entity_id)

#   if entity.type == :person do
#     person = Repo.get_by!(Person, slug: entity.slug)
#     staff |> Staff.changeset(%{person_id: person.id}) |> Repo.update!()
#   else
#     group = Repo.get_by!(Group, slug: entity.slug)
#     staff |> Staff.changeset(%{group_id: group.id}) |> Repo.update!()
#   end
# end)

# KaijuRole
# |> Repo.all()
# |> Enum.map(fn k_role ->
#   if k_role.entity_id do
#     entity = Repo.get_by!(Entity, id: k_role.entity_id)
#     person = Repo.get_by!(Person, slug: entity.slug)
#     k_role |> KaijuRole.changeset(%{person_id: person.id}) |> Repo.update!()
#   end
# end)

# AuthorWork
# |> Repo.all()
# |> Enum.map(fn author_work ->
#   entity = Repo.get_by!(Entity, id: author_work.entity_id)
#   person = Repo.get_by!(Person, slug: entity.slug)
#   author_work |> AuthorWork.changeset(%{person_id: person.id}) |> Repo.update!()
# end)

Entity
|> Repo.all()
|> Enum.flat_map(fn entity ->
  case entity.metadata["japanese_name"] do
    nil ->
      []

    japanese_name ->
      changeset =
        if entity.type == :person do
          Person
          |> Repo.get_by!(slug: entity.slug)
          |> Person.changeset(%{japanese_name: japanese_name})
        else
          Group
          |> Repo.get_by!(slug: entity.slug)
          |> Group.changeset(%{japanese_name: japanese_name})
        end

      [changeset]
  end
end)
|> Enum.map(fn changeset -> Repo.update!(changeset) end)
