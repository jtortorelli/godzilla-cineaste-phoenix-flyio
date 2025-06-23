alias GodzillaCineaste.{Film, Films, Group, Person, Role}

slugs = ~w(

)

Enum.each(slugs, fn slug ->
  film = Films.get_film_by_slug!(slug)

  {:ok, previous_film, next_film} = Films.get_adjacent_films_in_series(film)

  {top_billed_roles, rest_of_roles} = Enum.split_with(film.roles, fn role -> role.top_billed end)

  rest_of_roles =
    Enum.sort_by(rest_of_roles, fn
      %{person: %Person{sort_name: sort_name}} -> sort_name
      %{group: %Group{sort_name: sort_name}} -> sort_name
    end)

  display_staff = fn %Film{staff: staff} ->
    staff
    |> Enum.reduce([], fn s, acc ->
      current_role = s.role

      case acc do
        [{^current_role, ss} | rest] -> [{current_role, ss ++ [s]} | rest]
        _ -> [{current_role, [s]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  display_kaiju_roles = fn roles ->
    film.kaiju_roles
    |> Enum.reduce([], fn kr, acc ->
      current_role = kr.name || kr.kaiju_character.display_name

      case acc do
        [{^current_role, krs} | rest] -> [{current_role, krs ++ [kr]} | rest]
        _ -> [{current_role, [kr]} | acc]
      end
    end)
    |> Enum.reverse()
  end

  map = %{
    title: film.title,
    poster_url: Film.primary_poster_url(film),
    runtime: film.runtime,
    release_date: Date.to_iso8601(film.release_date),
    japanese_title: film.original_title.original,
    transliteration: film.original_title.transliteration,
    translation: film.original_title.translation,
    original_works:
      Enum.map(film.works, fn work ->
        %{
          title: work.title,
          slug: work.slug,
          format: work.format,
          authors:
            Enum.map(work.authors, fn author ->
              %{
                name: author.display_name,
                slug: if(author.showcased, do: author.slug)
              }
            end)
        }
      end),
    aliases:
      Enum.map(film.aliases, fn alias ->
        %{alias: alias.title, context: alias.context}
      end),
    studios:
      if(film.studios && film.studios != [],
        do:
          Enum.map(film.studios, fn studio ->
            studio.better_display_name || studio.display_name
          end),
        else:
          if(film.production_committee && film.production_committee.studios != [],
            do:
              Enum.map(film.production_committee.studios, fn studio ->
                studio.better_display_name || studio.display_name
              end)
          )
      ),
    series:
      if(film.series_entry,
        do: %{
          title: film.series_entry.film_series.name,
          slug: film.series_entry.film_series.slug,
          entry_number: film.series_entry.entry_number,
          previous_entry:
            if(previous_film,
              do: %{
                title: previous_film.title,
                slug: previous_film.slug,
                year: previous_film.release_date.year
              }
            ),
          next_entry:
            if(next_film,
              do: %{
                title: next_film.title,
                slug: next_film.slug,
                year: next_film.release_date.year
              }
            )
        }
      ),
    staff:
      Enum.map(display_staff.(film), fn {role, staffs} ->
        %{
          role: role,
          people:
            Enum.map(staffs, fn staff ->
              %{}
              |> then(
                &if staff.person,
                  do: Map.put(&1, :name, staff.person.display_name),
                  else: &1
              )
              |> then(
                &if staff.group,
                  do: Map.put(&1, :name, staff.group.display_name),
                  else: &1
              )
              |> then(
                &if staff.person && staff.person.showcased,
                  do: Map.put(&1, :slug, staff.person.slug),
                  else: &1
              )
              |> then(
                &if staff.group && staff.group.showcased,
                  do: Map.put(&1, :slug, staff.group.slug),
                  else: &1
              )
              |> then(&if staff.staff_alias, do: Map.put(&1, :alias, staff.staff_alias), else: &1)
            end)
        }
      end),
    top_billed_cast:
      Enum.map(top_billed_roles, fn role ->
        %{
          role: Role.role_display_name(role) |> String.trim(),
          name:
            (role.person && role.person.display_name) || (role.group && role.group.display_name),
          avatar_url: role.avatar_url,
          qualifiers: role.role_qualifiers || [],
          character_qualifiers: role.character_qualifiers
        }
        |> then(
          &if role.person && role.person.showcased,
            do: Map.put(&1, :slug, role.person.slug),
            else: &1
        )
        |> then(
          &if role.group && role.group.showcased,
            do: Map.put(&1, :slug, role.group.slug),
            else: &1
        )
        |> then(&if role.actor_alias, do: Map.put(&1, :alias, role.actor_alias), else: &1)
        |> then(&if &1.qualifiers == [], do: Map.delete(&1, :qualifiers), else: &1)
      end),
    supporting_cast:
      Enum.map(rest_of_roles, fn role ->
        %{
          role: Role.role_display_name(role) |> String.trim(),
          name: role.person.display_name,
          uncredited: role.uncredited,
          avatar_url: role.avatar_url,
          qualifiers: role.role_qualifiers || [],
          character_qualifiers: role.character_qualifiers
        }
        |> then(&if role.person.showcased, do: Map.put(&1, :slug, role.person.slug), else: &1)
        |> then(&if role.actor_alias, do: Map.put(&1, :alias, role.actor_alias), else: &1)
        |> then(&if &1.qualifiers == [], do: Map.delete(&1, :qualifiers), else: &1)
      end),
    kaiju:
      Enum.map(display_kaiju_roles.(film.kaiju_roles), fn {kaiju_name, [first | _] = kaiju_roles} ->
        %{
          name: kaiju_name,
          avatar_url: first.avatar_url,
          portrayals: []
        }
      end)
  }

  map
  |> Ymlr.document!()
  |> then(&File.write!("data/films/#{slug}.yml", &1))

  if film.credits do
    File.write!("data/credits/#{slug}.csv", film.credits.credits)
  end
end)
