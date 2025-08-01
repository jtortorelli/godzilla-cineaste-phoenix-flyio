slugs = ~w(


)

Enum.each(slugs, fn slug ->
  entity = GodzillaCineaste.People.get_entity_by_slug!(slug)
  selected_filmography = GodzillaCineaste.People.get_selected_filmography_by_entity!(entity)

  birth_name = GodzillaCineaste.Person.birth_name(entity) |> Map.from_struct()

  birth_place =
    with "" <- GodzillaCineaste.Place.display_place(entity.birth_place) do
      nil
    end

  death_place =
    with "" <- GodzillaCineaste.Place.display_place(entity.death_place) do
      nil
    end

  spouses =
    entity.relationships |> Enum.filter(&(&1.relationship == :spouse)) |> Enum.sort_by(& &1.order)

  family =
    entity.relationships |> Enum.filter(&(&1.relationship != :spouse)) |> Enum.sort_by(& &1.order)

  {dob, dob_resolution} =
    case entity.dob do
      %{year: year, month: month, day: day}
      when is_integer(year) and is_integer(month) and is_integer(day) ->
        {"#{year}-#{String.pad_leading(Integer.to_string(month), 2, "0")}-#{String.pad_leading(Integer.to_string(day), 2, "0")}",
         "exact"}

      %{year: year, month: month} when is_integer(year) and is_integer(month) ->
        {"#{year}-#{String.pad_leading(Integer.to_string(month), 2, "0")}-01", "month"}

      %{year: year} when is_integer(year) ->
        {"#{year}-01-01", "year"}

      _ ->
        {nil, nil}
    end

  {dod, dod_resolution} =
    case entity.dod do
      %{year: year, month: month, day: day}
      when is_integer(year) and is_integer(month) and is_integer(day) ->
        {"#{year}-#{String.pad_leading(Integer.to_string(month), 2, "0")}-#{String.pad_leading(Integer.to_string(day), 2, "0")}",
         "exact"}

      %{year: year, month: month} when is_integer(year) and is_integer(month) ->
        {"#{year}-#{String.pad_leading(Integer.to_string(month), 2, "0")}-01", "month"}

      %{year: year} when is_integer(year) ->
        {"#{year}-01-01", "year"}

      %{unknown: true} ->
        {"unknown", "unknown"}

      _ ->
        {nil, nil}
    end

  role_display_name = fn
    %GodzillaCineaste.Role{} = role ->
      GodzillaCineaste.Role.role_display_name(role) |> String.trim()

    %GodzillaCineaste.KaijuRole{} = role ->
      role.name
  end

  aliases =
    entity.alternate_names
    |> Enum.reject(&(&1.category == :birth_name))
    |> Enum.map(fn alias ->
      %{
        name: alias.name,
        japanese_name: alias.japanese_name,
        context: alias.context,
        category: alias.category
      }
    end)

  map = %{
    name: entity.display_name,
    aliases: aliases,
    type: "person",
    profession: entity.profession,
    avatar_url: entity.avatar_url,
    japanese_name: entity.japanese_name,
    dob: dob,
    dob_resolution: dob_resolution,
    birth_name: birth_name.name,
    japanese_birth_name: birth_name.japanese_name,
    birth_place: birth_place,
    dod: dod,
    dod_resolution: dod_resolution,
    death_place: death_place,
    cause_of_death: entity.cause_of_death,
    spouses:
      Enum.map(spouses, fn s ->
        %{
          name: s.relative.display_name,
          slug: if(s.relative.showcased, do: s.relative.slug, else: nil)
        }
        |> Map.reject(fn {_, v} -> is_nil(v) or v == [] end)
      end),
    family:
      Enum.map(family, fn f ->
        %{
          name: f.relative.display_name,
          slug: if(f.relative.showcased, do: f.relative.slug, else: nil),
          relationship: f.relationship |> Atom.to_string() |> String.replace("_", "-")
        }
        |> Map.reject(fn {_, v} -> is_nil(v) or v == [] end)
      end),
    works:
      Enum.map(selected_filmography, fn
        %GodzillaCineaste.Film{} = film ->
          %{
            title: film.title,
            slug: film.slug,
            poster_url: GodzillaCineaste.Film.primary_poster_url(film),
            year: film.release_date.year,
            format: "film",
            staff:
              Enum.map(film.staff, fn staff ->
                %{
                  role: staff.role,
                  staff_alias: staff.staff_alias
                }
                |> Map.reject(fn {_, v} -> is_nil(v) or v == [] end)
              end),
            roles:
              Enum.map(film.kaiju_roles ++ film.roles, fn role ->
                %{
                  name: role_display_name.(role),
                  actor_alias: role.actor_alias,
                  qualifiers: role.qualifiers,
                  uncredited: role.uncredited
                }
                |> Map.reject(fn {_, v} -> is_nil(v) or v == [] end)
              end)
          }
          |> Map.reject(fn {_, v} -> is_nil(v) or v == [] end)

        _ ->
          nil
      end)
  }

  map
  |> Map.reject(fn {_, v} -> is_nil(v) or v == [] end)
  |> Ymlr.document!()
  |> then(&File.write!("data/people/#{slug}.yml", &1))
end)
